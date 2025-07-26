class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Protect against CSRF attacks
  protect_from_forgery with: :exception

  # Allow broader browser support for better accessibility
  # Removed overly restrictive :modern requirement

  # Make helper methods available to views
  helper_method :can_make_reservation_for_week?, :can_edit_reservation_for_week?, :can_delete_reservation_for_week?

  protected

  def ensure_admin!
    unless current_user&.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  protected

  # Check if reservations can be made for a given week
  # Reservations cannot be made for current week after Wednesday midnight Eastern
  def can_make_reservation_for_week?(week_start_date)
    current_week_start = Date.current.beginning_of_week(:wednesday)

    # Future weeks are always allowed
    return true if week_start_date > current_week_start

    # Past weeks are never allowed
    return false if week_start_date < current_week_start

    # For current week, check if it's before Wednesday midnight Eastern
    eastern_time = Time.current.in_time_zone("Eastern Time (US & Canada)")
    # Since week_start_date is a Wednesday, the deadline is at the end of that Wednesday
    wednesday_midnight = week_start_date.end_of_day.in_time_zone("Eastern Time (US & Canada)")

    eastern_time <= wednesday_midnight
  end

  # Check if reservations can be edited for a given week
  # Reservations cannot be edited for past weeks
  def can_edit_reservation_for_week?(week_start_date)
    current_week_start = Date.current.beginning_of_week(:wednesday)
    week_start_date >= current_week_start
  end

  # Check if reservations can be deleted for a given week
  # Users can only delete their own reservations for future weeks (not current or past weeks)
  def can_delete_reservation_for_week?(week_start_date)
    current_week_start = Date.current.beginning_of_week(:wednesday)
    week_start_date > current_week_start
  end

  private

  # Overwriting the user method for Pundit
  def pundit_user
    current_user
  end
end
