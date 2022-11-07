class Createcars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars  do |t|
    t.integer :color
    t.string :body_style
    t.integer :doors
    t.integer :seats
    t.string :engine
    t.float :price
    t.string :transmission
    t.boolean :disponible
    t.string :emission_class
    t.belongs_to :user, foreign_key: true
    t.belongs_to :model , foreign_key: true
    t.timestamps
    end
  end
end
