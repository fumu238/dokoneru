class CreateSpotImages < ActiveRecord::Migration[5.1]
  def change
    create_table :spot_images do |t|
    	t.string :image_id, null: false
    	t.integer :spot_id

      t.timestamps
    end
  end
end
