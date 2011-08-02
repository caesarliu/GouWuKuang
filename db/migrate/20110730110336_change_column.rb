class ChangeColumn < ActiveRecord::Migration
  def self.up
      change_column :users, :remember_token_expires, :datetime
  end

  def self.down
	  change_column :users, :remember_token_expires, :datetime
  end
end
