class AddBackgroundImageIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :background_image_id, :string
  end
end
