class CreatedemandeRent < ActiveRecord::Migration[6.0]
  def change
    create_table :demanderent do |t|
      t.date :start_date , null:false 
      t.date :end_date , null:false 
      t.integer :status , null:false ,default: 0
    end
  end
end
