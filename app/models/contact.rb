class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :company_name, :address, :address2, :city, :region, :postal_code, :country, :email, :phone, :website, :fax, :contact_form_url, :skype, :msn, :aol, :yahoo, :icq, :facebook, :google_plus, :twitter, :tag_list, :status_id, :user_id

  has_many :notes, as: :noteable
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :status
  belongs_to :user

  validates :email, allow_blank: true, allow_nil: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :website, allow_blank: true

  def to_s
    "#{self.first_name} #{self.last_name}"
  end

  def self.active
    where(deleted_at: nil)
  end

  def mark_as_deleted
    self.deleted_at = Time.now
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("tags.id, tags.name, taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

protected
  def self.total_count(start_at = Time.now, end_at = Time.now)
    where("created_at > ?", start_at)
    .where("created_at < ?", end_at)
    .count
  end
end
