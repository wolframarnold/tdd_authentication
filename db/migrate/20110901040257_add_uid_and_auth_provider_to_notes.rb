class AddUidAndAuthProviderToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :uid, :string
    add_column :notes, :provider, :string

    add_index :notes, [:uid, :provider]
  end

  def self.down
    remove_column :notes, :provider
    remove_column :notes, :uid
  end
end
