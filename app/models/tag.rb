class Tag < ActiveRecord::Base
	has_many :categories
end