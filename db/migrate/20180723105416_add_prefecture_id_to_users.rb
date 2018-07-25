class AddPrefectureIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :prefecture_id, :integer
  end
end
