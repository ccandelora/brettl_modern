class CreateRoomsBunksBunkAssignments < ActiveRecord::Migration[7.1]
  def change
    # Create rooms table
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :order, null: false, default: 0
      t.timestamps
    end

    # Create bunks table
    create_table :bunks do |t|
      t.references :room, null: false, foreign_key: true
      t.references :owner, null: true, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :bunk_type, null: false
      t.integer :order, null: false, default: 0
      t.timestamps
    end

    # Create bunk_assignments table
    create_table :bunk_assignments do |t|
      t.references :reservation_week, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true
      t.references :bunk, null: false, foreign_key: true
      t.timestamps
    end

    # Add indexes for better query performance
    add_index :rooms, :gender
    add_index :rooms, :order
    add_index :bunks, :bunk_type
    add_index :bunks, :order
    add_index :bunk_assignments, [:reservation_week_id, :bunk_id], unique: true
  end
end
