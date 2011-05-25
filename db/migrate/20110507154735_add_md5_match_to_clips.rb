class AddMd5MatchToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :md5_match, :string
  end

  def self.down
    remove_column :clips, :md5_match
  end
end
