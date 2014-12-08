class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :author_name
      t.text :body
      t.integer :topic_id
      t.datetime :reply_date

      t.timestamps
    end
  end
end
