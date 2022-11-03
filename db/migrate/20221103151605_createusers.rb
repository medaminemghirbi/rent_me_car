class Createusers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :lastname, null:false
      t.string :firstname, null:false
      t.string :email, null:false
      t.integer :CIN, null:false
      t.integer :phone, null:false
      t.string :permis_id, null:false
      t.integer :age
      t.date :birthday
      t.integer :role
      t.timestamps
    end

  end
end
