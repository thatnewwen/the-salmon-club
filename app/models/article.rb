class Article < ActiveRecord::Base
	belongs_to :author, class_name: "User"
  has_many   :comments, as: :commentable
  has_many   :categories
  has_many   :discussions
end