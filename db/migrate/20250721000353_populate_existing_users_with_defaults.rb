class PopulateExistingUsersWithDefaults < ActiveRecord::Migration[8.0]
  def up
    # Update users where sex is null
    User.where(sex: [ nil, '' ]).update_all(sex: 'Male')

    # Update users where membership_type is null
    User.where(membership_type: [ nil, '' ]).update_all(membership_type: 'Full Member')

    # Update admin users to have "Full Member" membership type
    User.where(role: 2).update_all(membership_type: 'Full Member')
  end

  def down
    # This migration is irreversible since we don't know the original null values
    # If needed, could set all to null but that would break the constraints
    # raise ActiveRecord::IrreversibleMigration
  end
end
