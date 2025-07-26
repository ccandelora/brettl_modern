class RenamePreferredUserToPerferredUser < ActiveRecord::Migration[8.0]
  def change
    # Remove the old foreign key and index
    remove_foreign_key :bunks, :users, column: :preferred_user_id
    remove_index :bunks, :preferred_user_id

    # Rename the column
    rename_column :bunks, :preferred_user_id, :perferred_user_id

    # Add the new foreign key and index
    add_foreign_key :bunks, :users, column: :perferred_user_id
    add_index :bunks, :perferred_user_id
  end
end
