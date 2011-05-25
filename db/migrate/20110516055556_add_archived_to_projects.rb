class AddArchivedToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :archived, :string
  end

  def self.down
    remove_column :projects, :archived
  end
end
