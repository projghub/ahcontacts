class Email < ActiveRecord::Base
  attr_accessible :email_html, :email_text, :from_email, :from_name, :name, :publish, :subject

  validates_presence_of :name
  validates_presence_of :subject

  validates :from_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def to_s
    self.name
  end
end
