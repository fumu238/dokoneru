class AddSpotIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spot_id, :integer
  end
end
