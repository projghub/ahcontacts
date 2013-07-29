class Note < ActiveRecord::Base
  belongs_to :user
  attr_accessible :auto, :description, :namespace, :noteable_id, :noteable_type
end
