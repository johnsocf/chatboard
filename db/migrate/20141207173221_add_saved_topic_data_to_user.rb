class AddSavedTopicDataToUser < ActiveRecord::Migration
  def change
  	add_column :users, :saved_title, :string
  	add_column :users, :saved_content, :string
  end
end
