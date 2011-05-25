class AddResolutionToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :resolution, :string
  end

  def self.down
    remove_column :clips, :resolution
  end
end
