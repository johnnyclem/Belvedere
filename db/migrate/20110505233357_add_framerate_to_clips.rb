class AddFramerateToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :framerate, :string
  end

  def self.down
    remove_column :clips, :framerate
  end
end
