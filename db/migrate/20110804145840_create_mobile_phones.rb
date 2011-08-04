class CreateMobilePhones < ActiveRecord::Migration
  def self.up
    create_table :mobile_phones do |t|
      t.string :name
      t.integer :brand_id
      t.string :model
      t.integer :rank
      t.decimal :price
      t.text :spec
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :mobile_phones
  end
end
