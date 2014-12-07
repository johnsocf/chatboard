class HomeController < ApplicationController
	def index
		@topic = Topic.all
	end
end
