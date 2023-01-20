class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :token, null: false
      t.integer :user_id, null: false
      t.datetime :expired_at, null: false
      
      t.timestamps
    end
    add_index :tokens, :token, unique: true
    add_index :tokens, :user_id
    add_index :tokens, :expired_at
  end
end