class Note < ActiveRecord::Base
  attr_accessible :auto, :description, :namespace, :noteable_id, :noteable_type, :user_id

  belongs_to :noteable, polymorphic: true
  belongs_to :user

end
