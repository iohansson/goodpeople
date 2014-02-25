class AddAvatarToActor < ActiveRecord::Migration
  def change
    add_column :actors, :avatar_id, :integer
  end
end
