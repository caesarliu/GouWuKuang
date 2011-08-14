class AddBrandToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :brand_id, :integer
    add_column :products, :model, :string
    add_column :products, :rank, :integer
    add_column :products, :spec, :text
  end

  def self.down
    remove_column :products, :spec
    remove_column :products, :rank
    remove_column :products, :model
    remove_column :products, :brand_id
  end
end
