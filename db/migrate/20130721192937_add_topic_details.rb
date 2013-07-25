class AddTopicDetails < ActiveRecord::Migration
  def change
    add_column :topics, :detail, :text
  end
end
