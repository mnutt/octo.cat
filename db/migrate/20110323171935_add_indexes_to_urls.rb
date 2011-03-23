class AddIndexesToUrls < ActiveRecord::Migration
  def self.up
    add_index :urls, :short, :unique => true
  end

  def self.down
  end
end
