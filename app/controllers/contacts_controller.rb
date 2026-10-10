class ContactsController < ApplicationController
  MINIMUM_COMPLETION_TIME = 3.seconds
  MAXIMUM_FORM_AGE = 2.hours

  before_action :prepare_contact_form

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)

    if bot_submission?
      render :new, status: :unprocessable_entity
    elsif !valid_form_token?
      flash.now[:alert] = "Please reload the page and try again."
      render :new, status: :unprocessable_entity
    elsif !ContactSubmissionRateLimiter.new(request.remote_ip).allowed?
      flash.now[:alert] = "Too many messages were sent from this connection. Please try again in an hour."
      render :new, status: :too_many_requests
    elsif @contact.invalid?
      render :new, status: :unprocessable_entity
    else
      ContactMailer.inquiry(@contact).deliver_now
      MailchimpSubscription.new(@contact).subscribe if @contact.newsletter?
      redirect_to contact_path, notice: "Thanks — we’ll be in touch soon."
    end
  end

  private

  def contact_params
    params.fetch(:contact, {}).permit(
      :name,
      :email,
      :phone,
      :preferred_contact_method,
      :source,
      :activity_other,
      :joke,
      :newsletter,
      activities: []
    )
  end

  def prepare_contact_form
    @form_token = contact_form_verifier.generate({ issued_at: Time.current.to_i })
  end

  def valid_form_token?
    payload = contact_form_verifier.verify(params[:form_token].to_s)
    elapsed = Time.current.to_f - payload.fetch("issued_at").to_i

    elapsed >= MINIMUM_COMPLETION_TIME && elapsed <= MAXIMUM_FORM_AGE
  rescue ActiveSupport::MessageVerifier::InvalidSignature, KeyError
    false
  end

  def bot_submission?
    params.dig(:contact, :website).present?
  end

  def contact_form_verifier
    Rails.application.message_verifier("contact-form")
  end
end
