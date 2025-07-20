class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation_week
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :authorize_user_for_deletion!, only: [ :destroy ]
  before_action :authorize_user!, only: %i[edit update]

  # GET /reservations or /reservations.json
  def index
    @reservations = @reservation_week.reservations.includes(:user)
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    # Check if reservations are allowed for this week
    unless can_make_reservation_for_week?(@reservation_week.res_date)
      redirect_to app_reservation_week_path, alert: "Reservation deadline has passed for this week."
      return
    end

    @reservation = @reservation_week.reservations.new
  end

  # GET /reservations/1/edit
  def edit
    # Prevent editing reservations for past weeks
    unless can_edit_reservation_for_week?(@reservation_week.res_date)
      redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), alert: "Cannot edit reservations for past weeks."
      nil
    end
  end

  # POST /reservations or /reservations.json
  def create
    # Check if reservations are allowed for this week
    unless can_make_reservation_for_week?(@reservation_week.res_date)
      redirect_to app_reservation_week_path, alert: "Reservation deadline has passed for this week."
      return
    end

    @reservation = @reservation_week.reservations.new(reservation_params)

    # Handle different reservation types
    case @reservation.reservation_type
    when "myself"
      # Reservation for the current user
      @reservation.user = current_user
      @reservation.name = current_user.name if @reservation.name.blank?
    when "other_member"
      # Reservation for another member - assign to their account
      if @reservation.other_member_id.present?
        other_member = User.find(@reservation.other_member_id)
        @reservation.user = other_member
        @reservation.name = other_member.name if @reservation.name.blank?
      else
        @reservation.errors.add(:other_member_id, "must be selected")
        render :new and return
      end
    when "guest"
      # Guest reservation - stays with current user but with guest name
      @reservation.user = current_user
      # guest_user_id can be used to link to a member if needed
    end

    if @reservation.save
      redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), notice: "Reservation was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    # Prevent updating reservations for past weeks
    unless can_edit_reservation_for_week?(@reservation_week.res_date)
      redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), alert: "Cannot edit reservations for past weeks."
      return
    end

    if @reservation.update(reservation_params)
      redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), notice: "Reservation was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), notice: "Reservation was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_week
      @reservation_week = ReservationWeek.find(params[:reservation_week_id])
    end

    def set_reservation
      @reservation = @reservation_week.reservations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:name, :wed, :thur, :fri, :sat, :sun, :mon, :tue, :dinner, :comment, :sex, :res_member_type, :reservation_date, :confirmation_number, :reservation_type, :guest_user_id, :other_member_id)
    end

    def authorize_admin!
      redirect_to root_path, alert: "Not authorized." unless current_user.admin?
    end

    def authorize_user!
      redirect_to root_path, alert: "Not authorized." unless current_user.admin? || @reservation.user == current_user
    end

    # Check if user can delete this reservation
    # Admins can delete any reservation, users can only delete their own reservations for future weeks
    def authorize_user_for_deletion!
      # Admins can delete any reservation
      return if current_user.admin?

      # Users can only delete their own reservations
      unless @reservation.user == current_user
        redirect_to root_path, alert: "You can only delete your own reservations."
        return
      end

      # Users can only delete reservations for future weeks
      unless can_delete_reservation_for_week?(@reservation_week.res_date)
        redirect_to app_reservation_week_path(date: @reservation_week.res_date.strftime("%Y-%m-%d")), alert: "You can only delete reservations for future weeks."
        nil
      end
    end
end
