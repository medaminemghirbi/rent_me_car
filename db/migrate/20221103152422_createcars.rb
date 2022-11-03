class Createcars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars  do |t|
    t.integer :color, null:false
    t.string :body_style, null:false
    t.integer :doors, null:false
    t.integer :seats, null:false
    t.string :engine, null:false
    t.float :price, null:false
    t.string :transmission, null:false
    t.boolean :disponible, null:false
    t.string :emission_class, null:false
    t.belongs_to :user, foreign_key: true
    t.belongs_to :model , foreign_key: true
    t.timestamps
    end
  end
end
