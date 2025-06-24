# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://brettl.org"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Add public pages
  add root_path, :priority => 1.0, :changefreq => 'weekly'
  add about_path, :priority => 0.8, :changefreq => 'monthly'
  add membership_path, :priority => 0.9, :changefreq => 'monthly'
  add guest_faq_path, :priority => 0.7, :changefreq => 'monthly'
  add payment_path, :priority => 0.6, :changefreq => 'monthly'
  add volleyball_path, :priority => 0.6, :changefreq => 'monthly'
  add at_week_path, :priority => 0.6, :changefreq => 'monthly'

  # Add static pages that might be useful for SEO
  add '/', :priority => 1.0, :changefreq => 'weekly'

  # Note: We intentionally exclude:
  # - Admin pages (/admin/*)
  # - Member-only pages (/app/*)
  # - User profile pages (/profile/*)
  # - Authentication pages (/users/*)
  # - Reservation system pages (member-only)
end
