class TopicsController < ApplicationController
	include TopicsHelper

	def index
		@topic = Topic.all
	end

	def new
		@topic = Topic.new
		# puts topics_params.inspect

	end

	def create
		@topic = Topic.create(topics_params)
		@topic.user = current_user.email

		@topic.save

		puts @topic.user

		if @topic.valid?
			# redirect_to home_index_path
			redirect_to topic_path(@topic)
		else 
			puts "---------"
			puts @topic.inspect

			if @topic.title == ""
				@topic.content
			elsif @topic.content == ""
				puts @topic.content
			end

			redirect_to new_topic_path(@topic)
		end


		if @topic.id
			# redirect_to topic_path(@topic)
		else
			# redirect_to home_index_path
		end
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def destroy
		# puts '*********' 
		# puts Topic.find(params[:id])
		@topic = Topic.find(params[:id])
		@topic.destroy
		
		redirect_to home_index_path
	end
end
