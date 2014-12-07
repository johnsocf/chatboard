class AddSavedTopicData < ActiveRecord::Migration
  def change
  	add_column :topics, :saved_title, :string
  	add_column :topics, :saved_content, :string
  end
end
