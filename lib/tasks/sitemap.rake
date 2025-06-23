namespace :sitemap do
  desc "Generate sitemap"
  task generate: :environment do
    puts "Generating sitemap..."

    # Load the sitemap configuration
    load Rails.root.join('config', 'sitemap.rb')

    puts "Sitemap generated successfully!"
    puts "Location: #{Rails.root.join('public', 'sitemap.xml')}"
  end

  desc "Generate and upload sitemap to remote server"
  task upload: :environment do
    puts "Generating and uploading sitemap..."

    # Load the sitemap configuration
    load Rails.root.join('config', 'sitemap.rb')

    puts "Sitemap generated and uploaded successfully!"
  end
end
