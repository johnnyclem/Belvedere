class AddIcountToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :icount, :string
  end

  def self.down
    remove_column :projects, :icount
  end
end
