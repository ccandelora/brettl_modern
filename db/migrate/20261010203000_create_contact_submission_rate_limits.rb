class CreateContactSubmissionRateLimits < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_submission_rate_limits do |t|
      t.string :ip_hash, null: false
      t.datetime :window_started_at, null: false
      t.integer :submissions_count, null: false, default: 0

      t.timestamps
    end

    add_index :contact_submission_rate_limits,
              [ :ip_hash, :window_started_at ],
              unique: true,
              name: "index_contact_rate_limits_on_ip_hash_and_window"
  end
end
