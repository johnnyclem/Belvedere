class AddProxyOfflineToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :proxy_offline, :string
  end

  def self.down
    remove_column :projects, :proxy_offline
  end
end
