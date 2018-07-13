class AddAreaIdToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :area_id, :integer
  end
end
