class AddBunkListFinalizedToReservationWeeks < ActiveRecord::Migration[8.0]
  def change
    add_column :reservation_weeks, :bunk_list_finalized, :boolean, default: false, null: false
  end
end
