// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

document.addEventListener("turbo:load", () => {
    // This is for the facebook plugin
    if (typeof FB !== 'undefined') {
      FB.XFBML.parse();
    }
  });
