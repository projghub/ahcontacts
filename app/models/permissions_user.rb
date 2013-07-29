class PermissionsUser < ActiveRecord::Base
  belongs_to :permission
  belongs_to :user
  # attr_accessible :title, :body
end
