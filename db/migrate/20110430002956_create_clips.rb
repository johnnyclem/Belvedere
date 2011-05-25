class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.string :clip_name
      t.string :scene
      t.integer :running_time
      t.string :camera
      t.string :notes
      t.boolean :archived
      t.boolean :streaming
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clips
  end
end
