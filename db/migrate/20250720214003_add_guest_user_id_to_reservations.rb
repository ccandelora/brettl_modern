class AddGuestUserIdToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :guest_user_id, :integer
  end
end
