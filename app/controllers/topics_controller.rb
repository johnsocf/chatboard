class TopicsController < ApplicationController
	include TopicsHelper
	before_filter :zero_authors_or_authenticated, only: [:new, :create]

	def zero_authors_or_authenticated
	    unless User.count == 0 || current_user
	        redirect_to root_path
	        return false
	    end
	end

	def index
		@topic = Topic.all

	end
	end

	def new
		@topic = Topic.new
		puts "**************************************"
		puts topics_params.inspect

	end

	def create
		@topic = Topic.create(topics_params)
		@topic.user_id = current_user.email

		@topic.save

		@current_user = current_user

		puts "$$$$$$$$$$$$"
		puts @current_user.inspect


		if @current_user.saved_content
			puts @current_user.saved_content
		elsif @current_user.saved_title
			puts @current_user.saved_title
		end
			

		if @topic.valid?
			redirect_to topic_path(@topic)
			current_user.saved_title = nil
			current_user.saved_content = nil
			current_user.save
		else 
			puts "---------"
			puts @topic.inspect

			if @topic.title == ""
				@current_user.saved_content = @topic.content
				@current_user.saved_title = nil
			elsif @topic.content == ""
				@current_user.saved_content = nil
				@current_user.saved_title = @topic.title
			end
			# puts @current_user.inspect

			@current_user.save

			redirect_to new_topic_path(@topic)
		end


		# if @topic.id
		# 	# redirect_to topic_path(@topic)
		# else
		# 	# redirect_to home_index_path
		# end
	end

	def show
		@topic = Topic.find(params[:id])
		@replies = Reply.new
		@replies.topic_id = @topic.id
	end

	def destroy
		# puts '*********' 
		# puts Topic.find(params[:id])
		@topic = Topic.find(params[:id])
		@topic.destroy
		
		redirect_to home_index_path
	end
end
