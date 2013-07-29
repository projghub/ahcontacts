class Admin::Permission < ::Permission
  attr_accessible :namespace, :controller, :action

  validates :namespace, presence: true
  validates :controller, presence: true

  validates_uniqueness_of :namespace, scope: [:controller, :action]
end
