module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!

    def index
      # User Statistics
      @total_users = User.count
      @admin_users = User.where(role: 2).count
      @member_users = User.where.not(role: 2).or(User.where(role: nil)).count
      @unconfirmed_users = User.where(confirmed_at: nil).count

      # Reservation Statistics
      @total_reservations = Reservation.count
      @current_week_start = Date.current.beginning_of_week(:wednesday)
      @current_week = ReservationWeek.find_by(res_date: @current_week_start)
      @current_week_reservations = @current_week ? @current_week.reservations_count : 0

      # Recent Activity (last 30 days)
      @recent_reservations = Reservation.includes(:user, :reservation_week)
                                      .where("created_at > ?", 30.days.ago)
                                      .order(created_at: :desc)
                                      .limit(10)

      @recent_users = User.where("created_at > ?", 30.days.ago)
                         .order(created_at: :desc)
                         .limit(10)

      # Weekly Statistics (last 8 weeks)
      @weekly_stats = []
      8.times do |i|
        week_start = @current_week_start - (i * 7).days
        week = ReservationWeek.find_by(res_date: week_start)
        @weekly_stats << {
          week_start: week_start,
          reservations: week ? week.reservations_count : 0,
          week_name: week_start.strftime("%b %d")
        }
      end
      @weekly_stats.reverse!

      # System Health
      @total_weeks = ReservationWeek.count
      @weeks_with_reservations = ReservationWeek.joins(:reservations).distinct.count
    end

    private

    def ensure_admin!
      redirect_to root_path, alert: "Access denied. Admin privileges required." unless current_user.admin?
    end
  end
end
