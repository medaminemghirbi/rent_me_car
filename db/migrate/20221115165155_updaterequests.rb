class Updaterequests < ActiveRecord::Migration[6.0]
  def change
    add_column :demanderent, :user_id, :integer
    add_index  :demanderent, :user_id
    add_column :demanderent, :car_id, :integer
    add_index  :demanderent, :car_id
    add_index :demanderent, [:user_id, :car_id], unique: true
  end
end