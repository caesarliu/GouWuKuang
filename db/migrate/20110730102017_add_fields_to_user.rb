class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :remember_token, :string
    add_column :users, :remember_token_expires, :string
  end

  def self.down
    remove_column :users, :remember_token_expires
    remove_column :users, :remember_token
  end
end
