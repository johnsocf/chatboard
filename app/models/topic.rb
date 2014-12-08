class Topic < ActiveRecord::Base
	validates :title, :content, presence: true
	has_many :replies
end
