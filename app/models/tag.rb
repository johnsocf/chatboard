class Tag < ActiveRecord::Base
	has_many :taggroups
	has_many :topics, through: :taggroups
end
