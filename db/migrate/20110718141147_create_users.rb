class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
	  t.string :remember_token
	  t.string :remember_token_expires
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
