class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :actor_id

      t.timestamps
    end
    
    add_index :photos, :actor_id
  end
end
