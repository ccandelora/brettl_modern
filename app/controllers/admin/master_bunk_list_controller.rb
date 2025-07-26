class Admin::MasterBunkListController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def index
    @rooms = Room.includes(bunks: [ :owner, :preferred_users ]).ordered
    @women_rooms = @rooms.women
    @men_rooms = @rooms.men
    @coed_rooms = @rooms.coed
    @stats = calculate_stats
  end

  def edit_bunk
    @bunk = Bunk.find(params[:id])
    @users = User.all.order(:name)
  end

  def update_bunk
    @bunk = Bunk.find(params[:id])

    if @bunk.update(bunk_params)
      redirect_to admin_master_bunk_list_index_path, notice: "Bunk updated successfully!"
    else
      @users = User.all.order(:name)
      render :edit_bunk
    end
  end

  def add_preferred_member
    @bunk = Bunk.find(params[:bunk_id])
    @user = User.find(params[:user_id])

    # Check gender compatibility
    unless gender_compatible?(@user, @bunk)
      redirect_to admin_master_bunk_list_index_path, alert: "#{@user.display_name} cannot be added as a preferred member for #{@bunk.name} due to gender restrictions."
      return
    end

    if @bunk.add_preferred_user(@user)
      redirect_to admin_master_bunk_list_index_path, notice: "#{@user.display_name} added as preferred member for #{@bunk.name}!"
    else
      redirect_to admin_master_bunk_list_index_path, alert: "#{@user.display_name} is already a preferred member for #{@bunk.name}."
    end
  rescue => e
    Rails.logger.error "Error in add_preferred_member: #{e.message}"
    redirect_to admin_master_bunk_list_index_path, alert: "Error adding preferred member: #{e.message}"
  end

  def remove_preferred_member
    @bunk = Bunk.find(params[:bunk_id])
    @user = User.find(params[:user_id])

    if @bunk.remove_preferred_user(@user)
      redirect_to admin_master_bunk_list_index_path, notice: "#{@user.display_name} removed from preferred members for #{@bunk.name}!"
    else
      redirect_to admin_master_bunk_list_index_path, alert: "Could not remove #{@user.display_name} from preferred members for #{@bunk.name}."
    end
  rescue => e
    Rails.logger.error "Error in remove_preferred_member: #{e.message}"
    redirect_to admin_master_bunk_list_index_path, alert: "Error removing preferred member: #{e.message}"
  end

  def import_from_html
    # Re-import from HTML file
    if File.exist?(Rails.root.join("Bunk List Draft .html"))
      # Run the import task
      system("cd #{Rails.root} && bundle exec rake bunk_list:import_from_html")
      redirect_to admin_master_bunk_list_index_path, notice: "Master bunk list updated from HTML file!"
    else
      redirect_to admin_master_bunk_list_index_path, alert: "HTML file not found!"
    end
  end

  def bulk_update
    # Handle bulk updates from the main page (only for owners now)
    if params[:bunks]
      updated_count = 0
      errors = []

      params[:bunks].each do |bunk_id, bunk_data|
        begin
          bunk = Bunk.find(bunk_id)
          owner_id = bunk_data[:owner_id].present? ? bunk_data[:owner_id] : nil

          if bunk.update(owner_id: owner_id)
            updated_count += 1
          else
            errors << "Failed to update bunk #{bunk.name}: #{bunk.errors.full_messages.join(', ')}"
          end
        rescue => e
          errors << "Error updating bunk #{bunk_id}: #{e.message}"
        end
      end

      if errors.any?
        redirect_to admin_master_bunk_list_index_path, alert: "Some updates failed: #{errors.join('; ')}"
      else
        redirect_to admin_master_bunk_list_index_path, notice: "#{updated_count} bunk owners updated successfully!"
      end
    else
      redirect_to admin_master_bunk_list_index_path, alert: "No updates to save."
    end
  end

  private

  def ensure_admin!
    redirect_to root_path, alert: "Access denied. Admin privileges required." unless current_user.admin?
  end

  def gender_compatible?(user, bunk)
    room_gender = bunk.room.gender&.downcase
    user_sex = user.sex&.downcase

    case room_gender
    when "women"
      user_sex == "female"
    when "men"
      user_sex == "male"
    when "coed"
      true # All genders allowed in coed rooms
    else
      true # Fallback - allow if room gender is not set
    end
  end

  def bunk_params
    params.require(:bunk).permit(:name, :bunk_type, :owner_id, :preferred_user_id)
  end

  def calculate_stats
    {
      total_rooms: Room.count,
      total_bunks: Bunk.count,
      women: {
        rooms: Room.where(gender: "women").count,
        bunks: Bunk.joins(:room).where(rooms: { gender: "women" }).count,
        owned: Bunk.joins(:room).where(rooms: { gender: "women" }).where.not(owner: nil).count,
        open: Bunk.joins(:room).where(rooms: { gender: "women" }).where(owner: nil).count
      },
      men: {
        rooms: Room.where(gender: "men").count,
        bunks: Bunk.joins(:room).where(rooms: { gender: "men" }).count,
        owned: Bunk.joins(:room).where(rooms: { gender: "men" }).where.not(owner: nil).count,
        open: Bunk.joins(:room).where(rooms: { gender: "men" }).where(owner: nil).count
      },
      coed: {
        rooms: Room.where(gender: "coed").count,
        bunks: Bunk.joins(:room).where(rooms: { gender: "coed" }).count,
        owned: Bunk.joins(:room).where(rooms: { gender: "coed" }).where.not(owner: nil).count,
        open: Bunk.joins(:room).where(rooms: { gender: "coed" }).where(owner: nil).count
      }
    }
  end
end
