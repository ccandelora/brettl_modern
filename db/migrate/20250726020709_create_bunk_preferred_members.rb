class CreateBunkPreferredMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :bunk_preferred_members do |t|
      t.references :bunk, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rank, null: false

      t.timestamps
    end

    # Ensure unique combinations of bunk and user (can't prefer same member twice for same bunk)
    add_index :bunk_preferred_members, [ :bunk_id, :user_id ], unique: true

    # Ensure unique rank per bunk (can't have two members with same rank for same bunk)
    add_index :bunk_preferred_members, [ :bunk_id, :rank ], unique: true

    # Index for efficient querying by bunk with rank ordering
    add_index :bunk_preferred_members, [ :bunk_id, :rank ], name: 'index_bunk_preferred_members_on_bunk_and_rank'
  end
end
