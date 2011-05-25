class AddMd5destToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :md5dest, :string
  end

  def self.down
    remove_column :clips, :md5dest
  end
end
