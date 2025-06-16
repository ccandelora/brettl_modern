require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Comment", with: @reservation.comment
    fill_in "Confirmation number", with: @reservation.confirmation_number
    check "Dinner" if @reservation.dinner
    check "Fri" if @reservation.fri
    check "Mon" if @reservation.mon
    fill_in "Name", with: @reservation.name
    fill_in "Res member type", with: @reservation.res_member_type
    fill_in "Reservation date", with: @reservation.reservation_date
    fill_in "Reservation week", with: @reservation.reservation_week_id
    check "Sat" if @reservation.sat
    fill_in "Sex", with: @reservation.sex
    check "Sun" if @reservation.sun
    check "Thur" if @reservation.thur
    check "Tue" if @reservation.tue
    fill_in "User", with: @reservation.user_id
    check "Wed" if @reservation.wed
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Comment", with: @reservation.comment
    fill_in "Confirmation number", with: @reservation.confirmation_number
    check "Dinner" if @reservation.dinner
    check "Fri" if @reservation.fri
    check "Mon" if @reservation.mon
    fill_in "Name", with: @reservation.name
    fill_in "Res member type", with: @reservation.res_member_type
    fill_in "Reservation date", with: @reservation.reservation_date
    fill_in "Reservation week", with: @reservation.reservation_week_id
    check "Sat" if @reservation.sat
    fill_in "Sex", with: @reservation.sex
    check "Sun" if @reservation.sun
    check "Thur" if @reservation.thur
    check "Tue" if @reservation.tue
    fill_in "User", with: @reservation.user_id
    check "Wed" if @reservation.wed
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    accept_confirm { click_on "Destroy this reservation", match: :first }

    assert_text "Reservation was successfully destroyed"
  end
end
