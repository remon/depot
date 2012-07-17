class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthday
      t.string :gender
      t.string :relation
      t.text :about

      t.timestamps
    end
  end
end
