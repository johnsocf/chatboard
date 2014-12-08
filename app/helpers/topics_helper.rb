module TopicsHelper
	def topics_params
		params.require(:topic).permit(:title, :content, :tag_list, :image)
	end
end
