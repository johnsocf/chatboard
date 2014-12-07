module TopicsHelper
	def topics_params
		params.require(:topic).permit(:title, :content)
	end
end
