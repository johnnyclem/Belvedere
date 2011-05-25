class DumpFootage < ActiveRecord::Migration
  def self.up
    add_column :clips, :clip_file_name, :string
    add_column :clips, :clip_content_type, :string
    add_column :clips, :clip_file_size, :integer
    add_column :clips, :clip_updated_at, :datetime
  end

  def self.down
    remove_column :clips, :clip_updated_at
    remove_column :clips, :clip_file_name
    remove_column :clips, :clip_content_type
    remove_column :clips, :clip_file_size
  end
end
