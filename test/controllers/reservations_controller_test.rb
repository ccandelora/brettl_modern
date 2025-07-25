require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference("Reservation.count") do
      post reservations_url, params: { reservation: { comment: @reservation.comment, confirmation_number: @reservation.confirmation_number, dinner: @reservation.dinner, fri: @reservation.fri, mon: @reservation.mon, name: @reservation.name, res_member_type: @reservation.res_member_type, reservation_date: @reservation.reservation_date, reservation_week_id: @reservation.reservation_week_id, sat: @reservation.sat, sex: @reservation.sex, sun: @reservation.sun, thur: @reservation.thur, tue: @reservation.tue, user_id: @reservation.user_id, wed: @reservation.wed } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { comment: @reservation.comment, confirmation_number: @reservation.confirmation_number, dinner: @reservation.dinner, fri: @reservation.fri, mon: @reservation.mon, name: @reservation.name, res_member_type: @reservation.res_member_type, reservation_date: @reservation.reservation_date, reservation_week_id: @reservation.reservation_week_id, sat: @reservation.sat, sex: @reservation.sex, sun: @reservation.sun, thur: @reservation.thur, tue: @reservation.tue, user_id: @reservation.user_id, wed: @reservation.wed } }
    assert_redirected_to reservation_url(@reservation)
  end

  test "should destroy reservation" do
    assert_difference("Reservation.count", -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
