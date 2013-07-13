class AddIndexToTopic < ActiveRecord::Migration
  def change
    add_index :topics, :slug, unique: true
  end
end
