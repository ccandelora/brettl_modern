class ApplicationMailer < ActionMailer::Base
  default from: "Brettl-Hupfers Ski Club <noreply@brettl.org>",
          reply_to: "brettl.hupfers@gmail.com"

  layout "mailer"

  private

  def set_delivery_headers
    headers["X-Entity-Ref-ID"] = SecureRandom.uuid
    headers["X-Mailer"] = "Brettl-Hupfers Ski Club"
    headers["List-Unsubscribe"] = "<mailto:noreply@brettl.org?subject=unsubscribe>"
    headers["Precedence"] = "bulk"
  end
end
