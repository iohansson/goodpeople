class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :actor_id
      t.string :video_id

      t.timestamps
    end
    
    add_index :videos, :actor_id
  end
end
