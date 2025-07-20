class CreateGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :sex
      t.string :guest_type
      t.string :phone
      t.string :email
      t.references :reservation_week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
