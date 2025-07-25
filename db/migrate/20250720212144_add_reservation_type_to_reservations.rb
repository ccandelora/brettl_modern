class AddReservationTypeToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :reservation_type, :string
  end
end
