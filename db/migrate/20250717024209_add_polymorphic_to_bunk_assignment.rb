class AddPolymorphicToBunkAssignment < ActiveRecord::Migration[8.0]
  def change
    # Add polymorphic columns
    add_reference :bunk_assignments, :assignable, polymorphic: true, null: true

    # Migrate existing data
    reversible do |dir|
      dir.up do
        # Update existing records to use the new polymorphic association
        execute <<-SQL
          UPDATE bunk_assignments
          SET assignable_type = 'Reservation', assignable_id = reservation_id
          WHERE reservation_id IS NOT NULL
        SQL
      end
    end

    # Make the polymorphic columns non-null after migration
    change_column_null :bunk_assignments, :assignable_type, false
    change_column_null :bunk_assignments, :assignable_id, false

    # Remove the old reservation_id column
    remove_reference :bunk_assignments, :reservation, null: false, foreign_key: true
  end
end
