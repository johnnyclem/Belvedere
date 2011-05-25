class AddOfflineToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :offline, :string
  end

  def self.down
    remove_column :projects, :offline
  end
end
