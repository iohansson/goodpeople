class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.boolean :is_published, default: true

      t.timestamps
    end
  end
end
