class AddImageDiscriptionToSpotImage < ActiveRecord::Migration[5.1]
  def change
    add_column :spot_images, :image_discription, :string
  end
end
