namespace :db do
  desc "Export all data to seeds.rb file"
  task export_to_seeds: :environment do
    # File to write the seeds to
    seeds_file = Rails.root.join("db", "seeds.rb")

    # Models to export (in dependency order)
    models = [
      User,
      ReservationWeek,
      Reservation,
      Note
    ]

    File.open(seeds_file, "w") do |file|
      file.write "# This file contains all the data from the development database\n"
      file.write "# Generated on #{Time.current}\n\n"
      file.write "puts 'Seeding database with existing data...'\n\n"

      models.each do |model|
        file.write "# #{model.name} records\n"
        file.write "puts '  Creating #{model.name} records...'\n"

        model.all.each do |record|
          attributes = record.attributes

          # Remove auto-generated fields that shouldn't be seeded
          attributes.delete("id")
          attributes.delete("created_at")
          attributes.delete("updated_at")

          # Handle special cases for sensitive data
          if model == User
            # Don't export real passwords, use a default one
            attributes.delete("encrypted_password")
            attributes.delete("reset_password_token")
            attributes.delete("reset_password_sent_at")
            attributes.delete("remember_created_at")
            attributes.delete("current_sign_in_at")
            attributes.delete("last_sign_in_at")
            attributes.delete("current_sign_in_ip")
            attributes.delete("last_sign_in_ip")
            attributes.delete("confirmation_token")
            attributes.delete("confirmed_at")
            attributes.delete("confirmation_sent_at")
            attributes.delete("unconfirmed_email")

            # Create user with default password
            file.write "user = #{model.name}.find_or_create_by(email: #{attributes['email'].inspect}) do |u|\n"
            attributes.each do |key, value|
              next if key == "email"
              file.write "  u.#{key} = #{value.inspect}\n"
            end
            file.write "  u.password = 'password123'\n"
            file.write "  u.password_confirmation = 'password123'\n"
            file.write "end\n"
            file.write "user.save!(validate: false) if user.persisted?\n\n"
          else
            # For other models, create normally
            file.write "#{model.name}.find_or_create_by("

            # Use a unique identifier for find_or_create_by
            unique_attrs = []
            if model == ReservationWeek
              unique_attrs = [ "res_date" ]
            elsif model == Reservation
              unique_attrs = [ "name", "user_id", "reservation_week_id" ]
            elsif model == Note
              unique_attrs = [ "title" ]
            end

            if unique_attrs.any?
              find_attrs = unique_attrs.map { |attr| "#{attr}: #{attributes[attr].inspect}" }.join(", ")
              file.write "#{find_attrs}) do |record|\n"

              # Set remaining attributes
              (attributes.keys - unique_attrs).each do |key|
                file.write "  record.#{key} = #{attributes[key].inspect}\n"
              end
              file.write "end\n\n"
            else
              # Fallback: just create the record
              file.write "#{attributes.map { |k, v| "#{k}: #{v.inspect}" }.join(', ')}\n"
              file.write ")\n\n"
            end
          end
        end

        file.write "\n"
      end

      file.write "puts 'Database seeding completed!'\n"
      file.write "puts \"Users: \#{User.count}\"\n"
      file.write "puts \"Reservation Weeks: \#{ReservationWeek.count}\"\n"
      file.write "puts \"Reservations: \#{Reservation.count}\"\n"
      file.write "puts \"Notes: \#{Note.count}\"\n"
    end

    puts "✅ Data exported to #{seeds_file}"
    puts "📊 Exported:"
    models.each do |model|
      puts "   #{model.name}: #{model.count} records"
    end
  end
end
