class AddUsernameUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :users, :username, :unique => true
  end

  def self.down
    remove_index :users, :username
  end
end
