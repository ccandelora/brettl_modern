class AddPreferredUserToBunks < ActiveRecord::Migration[8.0]
  def change
    add_column :bunks, :preferred_user_id, :integer, null: true
    add_foreign_key :bunks, :users, column: :preferred_user_id
    add_index :bunks, :preferred_user_id
  end
end
