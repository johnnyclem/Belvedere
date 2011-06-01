class AddIcountToClips < ActiveRecord::Migration
  def self.up
    add_column :clips, :icount, :string
  end

  def self.down
    remove_column :clips, :icount
  end
end
