class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :phone
      t.string :name
      t.text :comment
      t.integer :actor_id
      t.date :event_date

      t.timestamps
    end
    add_index :orders, :actor_id
  end
end
