class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :director
      t.string :date
      t.boolean :editing_proxy
      t.boolean :streaming_proxy
      t.integer :unique_copies
      t.boolean :file_size_verification
      t.boolean :md5_verification

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
