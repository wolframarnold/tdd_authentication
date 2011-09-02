class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :avatar
      t.string :provider
      t.string :email
      t.string :nickname

      t.timestamps
    end

    add_index :users, [:uid, :provider]
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
