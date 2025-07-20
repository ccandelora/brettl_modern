module Admin
  class BunkListsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!
    before_action :set_reservation_week, only: [ :show, :edit, :update, :destroy, :generate, :print, :finalize_and_email, :add_guest ]
    skip_before_action :verify_authenticity_token, only: [ :add_guest ] if Rails.env.development?

    def index
      @reservation_weeks = ReservationWeek.includes(:bunk_assignments, :reservations)
                                        .order(res_date: :desc)
                                        .limit(20)
    end

    def show
      @rooms = Room.includes(:bunks).ordered
      @women_rooms = @rooms.women
      @men_rooms = @rooms.men
      @coed_rooms = @rooms.coed

      # Load assignments and split by type to handle polymorphic associations
      @bunk_assignments = @reservation_week.bunk_assignments.includes(:bunk)
      @reservation_assignments = @reservation_week.bunk_assignments
                                               .where(assignable_type: "Reservation")
                                               .includes(:bunk, assignable: :user)
      @guest_assignments = @reservation_week.bunk_assignments
                                         .where(assignable_type: "Guest")
                                         .includes(:bunk, :assignable)

      # Combine the assignments for the view
      @bunk_assignments = (@reservation_assignments + @guest_assignments).sort_by { |ba| ba.bunk.name }
      @unassigned_assignables = unassigned_assignables_for_week
    end

    def edit
      @rooms = Room.includes(:bunks).ordered
      @women_rooms = @rooms.women
      @men_rooms = @rooms.men
      @coed_rooms = @rooms.coed

      # Load assignments and split by type to handle polymorphic associations
      @bunk_assignments = @reservation_week.bunk_assignments.includes(:bunk)
      @reservation_assignments = @reservation_week.bunk_assignments
                                               .where(assignable_type: "Reservation")
                                               .includes(:bunk, assignable: :user)
      @guest_assignments = @reservation_week.bunk_assignments
                                         .where(assignable_type: "Guest")
                                         .includes(:bunk, :assignable)

      # Combine the assignments for the view
      @bunk_assignments = (@reservation_assignments + @guest_assignments).sort_by { |ba| ba.bunk.name }
      @unassigned_assignables = unassigned_assignables_for_week
      @new_guest = @reservation_week.guests.build
    end

    def generate
      begin
        BunkAssignmentService.new(@reservation_week).generate_assignments
        redirect_to admin_bunk_list_path(@reservation_week), notice: "Bunk list generated successfully!"
      rescue StandardError => e
        redirect_to admin_bunk_lists_path, alert: "Error generating bunk list: #{e.message}"
      end
    end

    def update
      begin
        if params[:auto_assign]
          # Auto-assign unassigned reservations
          service = BunkAssignmentService.new(@reservation_week)
          service.assign_unassigned_only
          redirect_to admin_bunk_list_path(@reservation_week), notice: "Unassigned members have been automatically assigned!"
        else
          # Handle manual assignment updates
          assignment_params = params[:assignments] || {}
          update_manual_assignments(assignment_params)
          redirect_to admin_bunk_list_path(@reservation_week), notice: "Bunk assignments updated successfully!"
        end
      rescue StandardError => e
        redirect_to edit_admin_bunk_list_path(@reservation_week), alert: "Error updating assignments: #{e.message}"
      end
    end

    def add_guest
      @guest = @reservation_week.guests.build(guest_params)

      if @guest.save
        redirect_to edit_admin_bunk_list_path(@reservation_week), notice: "Guest added successfully!"
      else
        @rooms = Room.includes(:bunks).ordered
        @women_rooms = @rooms.women
        @men_rooms = @rooms.men
        @coed_rooms = @rooms.coed
        @bunk_assignments = @reservation_week.bunk_assignments.includes(:assignable, :bunk)
        @unassigned_assignables = unassigned_assignables_for_week
        @new_guest = @guest
        render :edit, alert: "Error adding guest."
      end
    end

    def destroy
      @reservation_week.bunk_assignments.destroy_all
      redirect_to admin_bunk_lists_path, notice: "Bunk list deleted successfully!"
    end

    def print
      # Load rooms with bunks and their owners
      @rooms = Room.includes(bunks: [ :owner ]).ordered
      @women_rooms = @rooms.women
      @men_rooms = @rooms.men
      @coed_rooms = @rooms.coed

      # Load assignments separately to handle polymorphic associations
      @bunk_assignments = @reservation_week.bunk_assignments.includes(:bunk)

      # Split assignments by type and include necessary associations
      @reservation_assignments = @reservation_week.bunk_assignments
                                               .where(assignable_type: "Reservation")
                                               .includes(:bunk, assignable: :user)
      @guest_assignments = @reservation_week.bunk_assignments
                                         .where(assignable_type: "Guest")
                                         .includes(:bunk, :assignable)

      @stats = calculate_bunk_statistics
      render layout: "print"
    end

    def finalize_and_email
      begin
        # Mark the bunk list as finalized
        @reservation_week.update!(bunk_list_finalized: true)

        # Send emails to all participants
        @bunk_assignments.each do |assignment|
          case assignment.assignable_type
          when "Reservation"
            BunkListMailer.assignment_notification(assignment).deliver_later
          when "Guest"
            # For guests, we might want to notify the admin or the person who added them
            BunkListMailer.guest_assignment_notification(assignment).deliver_later
          end
        end

        redirect_to admin_bunk_list_path(@reservation_week),
                    notice: "Bunk list has been finalized and emails are being sent."
      rescue StandardError => e
        redirect_to admin_bunk_list_path(@reservation_week),
                    alert: "Error finalizing bunk list: #{e.message}"
      end
    end

    private

    def set_reservation_week
      @reservation_week = ReservationWeek.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:name, :sex)
    end

    def update_manual_assignments(assignment_params)
      ActiveRecord::Base.transaction do
        assignment_params.each do |bunk_id, assignable_info|
          next if assignable_info[:id].blank?

          bunk = Bunk.find(bunk_id)
          assignable_type = assignable_info[:type]
          assignable_id = assignable_info[:id]

          # Find or initialize the assignment
          assignment = @reservation_week.bunk_assignments.find_or_initialize_by(bunk: bunk)

          if assignable_id == "clear"
            assignment.destroy if assignment.persisted?
          else
            assignment.assignable_type = assignable_type
            assignment.assignable_id = assignable_id
            assignment.save!
          end
        end
      end
    end

    def calculate_bunk_statistics
      {
        women: room_type_stats(@women_rooms),
        men: room_type_stats(@men_rooms),
        coed: room_type_stats(@coed_rooms)
      }.tap do |stats|
        # Add totals
        stats[:total] = {
          bunks: stats.sum { |_, s| s[:bunks] },
          occupied: stats.sum { |_, s| s[:occupied] },
          available: stats.sum { |_, s| s[:available] },
          owned: stats.sum { |_, s| s[:owned] }
        }
      end
    end

    def room_type_stats(rooms)
      return { bunks: 0, occupied: 0, available: 0, owned: 0 } if rooms.blank?

      # Count total bunks
      total_bunks = rooms.sum { |room| room.bunks.size }

      # Count owned bunks
      owned_bunks = rooms.sum { |room| room.bunks.count { |b| b.owner_id.present? } }

      # Get all room IDs for this type
      room_ids = rooms.map(&:id)

      # Count occupied bunks for these rooms
      occupied_bunks = @bunk_assignments.count { |ba| room_ids.include?(ba.bunk.room_id) }

      {
        bunks: total_bunks,
        occupied: occupied_bunks,
        available: total_bunks - occupied_bunks,
        owned: owned_bunks
      }
    end

    def unassigned_assignables_for_week
      reservations = @reservation_week.reservations.includes(:user)
      guests = @reservation_week.guests
      assigned_ids = @bunk_assignments.pluck(:assignable_id)

      unassigned_reservations = reservations.reject { |r| assigned_ids.include?(r.id) }
      unassigned_guests = guests.reject { |g| assigned_ids.include?(g.id) }

      # Return a combined array of unassigned assignables
      unassigned_reservations + unassigned_guests
    end
  end
end
