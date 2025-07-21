class AddSexAndMembershipTypeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :sex, :string, default: 'Male'
    add_column :users, :membership_type, :string, default: 'Full Member'

    # Add check constraints to ensure valid values
    add_check_constraint :users, "sex IN ('Male', 'Female', 'Other')", name: 'users_sex_check'
    add_check_constraint :users, "membership_type IN ('Full Member', 'Associate Member', 'Social Member', 'Guest')", name: 'users_membership_type_check'
  end
end
