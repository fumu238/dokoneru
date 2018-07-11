class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
    	t.string :spot_name, null: false
    	t.string :spot_address
    	t.text :discription
    	t.string :type
    	t.string :watar
    	t.string :toilet
    	t.string :roof
    	t.integer :prefecture_id

      t.timestamps
    end
  end
end
