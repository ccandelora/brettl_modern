require "test_helper"

class ReservationWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation_week = reservation_weeks(:one)
  end

  test "should get index" do
    get reservation_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_week_url
    assert_response :success
  end

  test "should create reservation_week" do
    assert_difference("ReservationWeek.count") do
      post reservation_weeks_url, params: { reservation_week: { note: @reservation_week.note, res_date: @reservation_week.res_date } }
    end

    assert_redirected_to reservation_week_url(ReservationWeek.last)
  end

  test "should show reservation_week" do
    get reservation_week_url(@reservation_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_week_url(@reservation_week)
    assert_response :success
  end

  test "should update reservation_week" do
    patch reservation_week_url(@reservation_week), params: { reservation_week: { note: @reservation_week.note, res_date: @reservation_week.res_date } }
    assert_redirected_to reservation_week_url(@reservation_week)
  end

  test "should destroy reservation_week" do
    assert_difference("ReservationWeek.count", -1) do
      delete reservation_week_url(@reservation_week)
    end

    assert_redirected_to reservation_weeks_url
  end
end
