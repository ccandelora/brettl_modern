class ContactForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  ACTIVITIES = [
    "Skiing or Snowboarding",
    "Cross-country skiing",
    "Hiking",
    "Canoeing & kayaking",
    "Volleyball",
    "Mountain biking",
    "Après-ski",
    "Other"
  ].freeze

  attribute :name, :string
  attribute :email, :string
  attribute :phone, :string
  attribute :preferred_contact_method, :string, default: "email"
  attribute :source, :string
  attribute :activity_other, :string
  attribute :joke, :string
  attribute :newsletter, :boolean, default: false

  attr_reader :activities

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 254 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, length: { maximum: 40 }, allow_blank: true
  validates :preferred_contact_method, inclusion: { in: %w[email phone] }
  validates :source, length: { maximum: 200 }, allow_blank: true
  validates :activity_other, length: { maximum: 200 }, allow_blank: true
  validates :joke, length: { maximum: 2_000 }, allow_blank: true
  validate :other_activity_has_description
  validate :contains_no_control_characters

  def initialize(attributes = {})
    super
    self.activities ||= []
  end

  def activities=(values)
    @activities = Array(values).select { |activity| ACTIVITIES.include?(activity) }
  end

  def newsletter?
    ActiveModel::Type::Boolean.new.cast(newsletter)
  end

  private

  def other_activity_has_description
    return unless activities.include?("Other") && activity_other.blank?

    errors.add(:activity_other, "is required when Other is selected")
  end

  def contains_no_control_characters
    attributes.slice("name", "email", "phone", "source", "activity_other", "joke").each do |attribute, value|
      next if value.blank? || !value.match?(/[\r\n\0]/)

      errors.add(attribute, "contains invalid characters")
    end
  end
end
