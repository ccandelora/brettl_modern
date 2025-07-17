class BunkListsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!
  before_action :set_reservation_week, only: [:show, :edit, :update, :destroy, :generate, :print, :finalize_and_email]

  def index
    @reservation_weeks = ReservationWeek.includes(:bunk_assignments, :reservations)
                                       .order(res_date: :desc)
                                       .limit(20)
  end

  def show
    @rooms = Room.includes(:bunks).ordered
    @women_rooms = @rooms.women
    @men_rooms = @rooms.men
    @bunk_assignments = @reservation_week.bunk_assignments.includes(:reservation, :bunk)
    @unassigned_reservations = unassigned_reservations_for_week
  end

  def edit
    # Same as show - the edit interface is the same as the view interface
    show
    render :show
  end

  def generate
    begin
      BunkAssignmentService.new(@reservation_week).generate_assignments
      redirect_to bunk_list_path(@reservation_week), notice: 'Bunk list generated successfully!'
    rescue StandardError => e
      redirect_to bunk_lists_path, alert: "Error generating bunk list: #{e.message}"
    end
  end

  def update
    # Handle manual assignment updates via AJAX
    assignment_params = params[:bunk_assignments] || {}

    begin
      BunkAssignmentService.new(@reservation_week).update_assignments(assignment_params)
      redirect_to bunk_list_path(@reservation_week), notice: 'Bunk assignments updated successfully!'
    rescue StandardError => e
      redirect_to bunk_list_path(@reservation_week), alert: "Error updating assignments: #{e.message}"
    end
  end

  def destroy
    @reservation_week.bunk_assignments.destroy_all
    redirect_to bunk_lists_path, notice: 'Bunk list deleted successfully!'
  end

  def print
    @rooms = Room.includes(:bunks).ordered
    @women_rooms = @rooms.women
    @men_rooms = @rooms.men
    @bunk_assignments = @reservation_week.bunk_assignments.includes(:reservation, :bunk)

    # Calculate summary statistics
    @stats = calculate_bunk_statistics

    render layout: 'print'
  end

  def finalize_and_email
    # TODO: Implement email functionality
    # For now, just mark as finalized
    redirect_to bunk_list_path(@reservation_week), notice: 'Bunk list finalized! (Email functionality coming soon)'
  end

  private

  def set_reservation_week
    @reservation_week = ReservationWeek.find(params[:id])
  end

  def ensure_admin!
    redirect_to root_path, alert: 'Access denied. Admin privileges required.' unless current_user.admin?
  end

  def unassigned_reservations_for_week
    assigned_reservation_ids = @reservation_week.bunk_assignments.pluck(:reservation_id)
    @reservation_week.reservations.where.not(id: assigned_reservation_ids)
  end

  def calculate_bunk_statistics
    all_bunks = Bunk.joins(:room).includes(:room)
    assigned_bunks = @bunk_assignments.map(&:bunk)

    stats = {
      women: {
        total: all_bunks.joins(:room).where(rooms: { gender: 'women' }).count,
        occupied: assigned_bunks.select { |b| b.room.gender == 'women' }.count,
        owned: all_bunks.joins(:room).where(rooms: { gender: 'women' }).where.not(owner: nil).count
      },
      men: {
        total: all_bunks.joins(:room).where(rooms: { gender: 'men' }).count,
        occupied: assigned_bunks.select { |b| b.room.gender == 'men' }.count,
        owned: all_bunks.joins(:room).where(rooms: { gender: 'men' }).where.not(owner: nil).count
      }
    }

    stats[:women][:open] = stats[:women][:total] - stats[:women][:occupied]
    stats[:men][:open] = stats[:men][:total] - stats[:men][:occupied]
    stats[:total] = {
      total: stats[:women][:total] + stats[:men][:total],
      occupied: stats[:women][:occupied] + stats[:men][:occupied]
    }

    stats
  end
end
