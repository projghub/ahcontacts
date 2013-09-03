class Tag < ActiveRecord::Base
  before_save :titleize

  has_many :taggings
  has_many :contacts, through: :taggings

  def titleize
    self.name = self.name.titleize
  end
end
