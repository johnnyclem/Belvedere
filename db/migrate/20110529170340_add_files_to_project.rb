class AddFilesToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :file, :string
  end

  def self.down
    remove_column :projects, :file
  end
end
