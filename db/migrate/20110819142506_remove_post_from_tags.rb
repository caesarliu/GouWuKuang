class RemovePostFromTags < ActiveRecord::Migration
  def self.up
    remove_column :tags, :post_id
  end

  def self.down
    add_column :tags, :post_id, :integer
  end
end
