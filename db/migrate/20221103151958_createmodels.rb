class Createmodels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :model_name, null:false
      t.timestamps
      
    end
  end
end
