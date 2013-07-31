class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :phone, :permission_ids

  has_many :notes
  has_many :permissions_users
  has_many :permissions, through: :permissions_users

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def to_s
    [self.first_name, self.last_name].join(" ")
  end

  private
  def self.advertiser_namespace
    joins('INNER JOIN permissions_users ON "users"."id" = "permissions_users"."user_id"')
    .joins('INNER JOIN permissions ON "permissions"."id" = "permissions_users"."permission_id"')
    .where('"permissions"."namespace" = ? AND "permissions"."controller" = ?', 'advertiser', 'application')
  end

  def self.admin_namespace
    joins('INNER JOIN permissions_users ON "users"."id" = "permissions_users"."user_id"')
    .joins('INNER JOIN permissions ON "permissions"."id" = "permissions_users"."permission_id"')
    .where('"permissions"."namespace" = ? AND "permissions"."controller" = ?', 'admin', 'application')
  end


end
