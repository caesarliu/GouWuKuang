class AddProductToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :product_id, :integer
    add_column :posts, :product_id, :integer
  end

  def self.down
    remove_column :tags, :product_id
    remove_column :posts, :product_id
  end
end
