class Createusers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.integer :CIN
      t.integer :phone
      t.string :permis_id
      t.string :password_digest
      t.integer :age
      t.date :birthday
      t.integer :role
      t.timestamps
    end

  end
end
