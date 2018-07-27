class AddSleptCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slept_count, :integer, default: 0
  end
end
