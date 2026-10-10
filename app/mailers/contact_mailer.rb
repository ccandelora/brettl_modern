class ContactMailer < ApplicationMailer
  def inquiry(contact)
    @contact = contact

    mail(
      to: ENV.fetch("CONTACT_RECIPIENT_EMAIL", "brettl.hupfers@gmail.com"),
      reply_to: @contact.email,
      subject: "New website contact from #{@contact.name}"
    )
  end
end
