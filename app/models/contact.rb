class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :company_name, :address, :address2, :city, :region, :postal_code, :country, :email, :phone, :website, :fax, :contact_form_url

  has_many :notes, as: :noteable

  def to_s
    "#{self.first_name} #{self.last_name}"
  end

  def self.active
    where(deleted_at: nil)
  end

  def mark_as_deleted
    self.deleted_at = Time.now
  end
end
