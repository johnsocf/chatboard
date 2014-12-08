class RepliesController < ApplicationController
	def create
		@reply = Reply.new(comment_params)
		@reply.topic_id = params[:topic_id]
		@topic = params[:topic_id]
		# @reply.author_name = users.email


		@reply.save
		redirect_to topic_path(@reply.topic)
		#imp
		
	end

	def comment_params
		params.require(:reply).permit(:author_name, :body)
	end
end
