class AddPaperclipToArticle < ActiveRecord::Migration
  def change
  	add_column :topics, :image_file_name, :string
  	add_column :topics, :image_content_type, :string
  	add_column :topics, :image_file_size, :integer
  	add_column :topics, :image_updated_at, :datetime
  end
end
