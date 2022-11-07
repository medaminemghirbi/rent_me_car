class CreatedemandeRent < ActiveRecord::Migration[6.0]
  def change
    create_table :demanderent do |t|
      t.date :start_date 
      t.date :end_date 
      t.integer :status ,default: 0
    end
  end
end
