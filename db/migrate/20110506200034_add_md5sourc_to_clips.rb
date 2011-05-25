class AddMd5sourcToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :md5source, :string
  end

  def self.down
    remove_column :clips, :md5source
  end
end
