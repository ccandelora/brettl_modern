require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @reservation_week = reservation_weeks(:one)
    @reservation = Reservation.new(
      name: "Test User",
      user: @user,
      reservation_week: @reservation_week,
      sex: "Male",
      res_member_type: "Full Member"
    )
  end

  test "should be valid with all required fields" do
    assert @reservation.valid?
  end

  test "should require sex" do
    @reservation.sex = nil
    assert_not @reservation.valid?
    assert_includes @reservation.errors[:sex], "can't be blank"
  end

  test "should require res_member_type" do
    @reservation.res_member_type = nil
    assert_not @reservation.valid?
    assert_includes @reservation.errors[:res_member_type], "can't be blank"
  end

  test "should accept valid sex values" do
    ["Male", "Female"].each do |sex|
      @reservation.sex = sex
      assert @reservation.valid?, "#{sex} should be valid"
    end
  end

  test "should accept valid member type values" do
    ["Full Member", "Associate Member", "Race Member", "Guest"].each do |member_type|
      @reservation.res_member_type = member_type
      assert @reservation.valid?, "#{member_type} should be valid"
    end
  end
end
