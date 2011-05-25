class AddSizeToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :size, :string
  end

  def self.down
    remove_column :clips, :size
  end
end
