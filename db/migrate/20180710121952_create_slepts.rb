class CreateSlepts < ActiveRecord::Migration[5.1]
  def change
    create_table :slepts do |t|
    	t.integer :user_id
    	t.integer :spot_id

      t.timestamps
    end
  end
end
