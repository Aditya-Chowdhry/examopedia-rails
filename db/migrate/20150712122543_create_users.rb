class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :section
      t.integer :level
      t.integer :points
      t.boolean :career_assist 
      t.text :description ,null: true
      t.integer :age ,null: true
      t.string :courses ,null: true
      t.text :interests ,null: true
      t.integer :marks10 ,null: true
      t.integer :marks12 ,null: true
      t.integer :marksug ,null: true

      t.timestamps null: false
    end
  end
end
