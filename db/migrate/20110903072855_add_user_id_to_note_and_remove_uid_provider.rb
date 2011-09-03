class AddUserIdToNoteAndRemoveUidProvider < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.integer :user_id
      t.remove :uid
      t.remove :provider
      t.index :user_id
    end
  end


  def self.down
    change_table :notes do |t|
      t.string :uid
      t.string :provider
      t.remove :user_id
      t.index [:uid,:provider]
    end
  end
end
