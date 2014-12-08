class HomeController < ApplicationController
	def index
		@topic = Topic.all
		@reply = Reply.all
	end
end
