class AddUserIdToMotorbikes < ActiveRecord::Migration
  def change
    add_column :motorbikes, :user_id, :integer
  end
end
