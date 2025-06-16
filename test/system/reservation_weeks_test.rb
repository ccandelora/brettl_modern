require "application_system_test_case"

class ReservationWeeksTest < ApplicationSystemTestCase
  setup do
    @reservation_week = reservation_weeks(:one)
  end

  test "visiting the index" do
    visit reservation_weeks_url
    assert_selector "h1", text: "Reservation weeks"
  end

  test "should create reservation week" do
    visit reservation_weeks_url
    click_on "New reservation week"

    fill_in "Note", with: @reservation_week.note
    fill_in "Res date", with: @reservation_week.res_date
    click_on "Create Reservation week"

    assert_text "Reservation week was successfully created"
    click_on "Back"
  end

  test "should update Reservation week" do
    visit reservation_week_url(@reservation_week)
    click_on "Edit this reservation week", match: :first

    fill_in "Note", with: @reservation_week.note
    fill_in "Res date", with: @reservation_week.res_date
    click_on "Update Reservation week"

    assert_text "Reservation week was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation week" do
    visit reservation_week_url(@reservation_week)
    accept_confirm { click_on "Destroy this reservation week", match: :first }

    assert_text "Reservation week was successfully destroyed"
  end
end
