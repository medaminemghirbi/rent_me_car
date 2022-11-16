class Updaterequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :user_id, :integer
    add_index  :requests, :user_id
    add_column :requests, :car_id, :integer
    add_index  :requests, :car_id
    add_index :requests, [:user_id, :car_id], unique: true
  end
end