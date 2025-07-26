class AddReservationsCountToReservationWeeks < ActiveRecord::Migration[8.0]
  def change
    add_column :reservation_weeks, :reservations_count, :integer, default: 0, null: false
    add_index :reservation_weeks, :reservations_count
  end
end
