class RemoveColumnsFromUsers < ActiveRecord::Migration
   def self.up
    remove_column :users, :looking_for, :string
    remove_column :users, :gender, :string
    remove_column :users, :bio, :string

  end
end
