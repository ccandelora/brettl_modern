class AddOtherMemberIdToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :other_member_id, :integer
  end
end
