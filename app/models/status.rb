class Status < ActiveRecord::Base
  attr_accessible :name, :placement

  has_many :contacts

  def to_s
    self.name
  end
end
