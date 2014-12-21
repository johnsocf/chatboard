class CreateTaggroups < ActiveRecord::Migration
  def change
    create_table :taggroups do |t|
      t.references :tag, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
