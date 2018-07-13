class AddRestAreaToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :rest_area, :string
  end
end
