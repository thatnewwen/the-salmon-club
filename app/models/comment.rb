class Comment < ActiveRecord::Base
	has_many   :comments, as: :commentable
	belongs_to :author, class_name: "User"
  belongs_to :commetable, polymorphic: true
end