class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :phone
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
