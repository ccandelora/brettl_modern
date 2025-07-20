class BunkListMailer < ApplicationMailer
  def assignment_notification(assignment)
    @assignment = assignment
    @reservation_week = @assignment.reservation_week
    @reservation = @assignment.assignable
    @user = @reservation.user
    @bunk = @assignment.bunk
    @room = @bunk.room

    mail(
      to: @user.email,
      subject: "Your Bunk Assignment for #{@reservation_week.res_date.strftime('%B %d, %Y')}"
    )
  end

  def guest_assignment_notification(assignment)
    @assignment = assignment
    @reservation_week = @assignment.reservation_week
    @guest = @assignment.assignable
    @bunk = @assignment.bunk
    @room = @bunk.room

    # Send to admin for now, could be customized later
    mail(
      to: User.where(admin: true).pluck(:email),
      subject: "Guest Bunk Assignment for #{@reservation_week.res_date.strftime('%B %d, %Y')}"
    )
  end
end
