#
#    create_table :users do |t|
#      t.string :name
#      t.string :email
#      t.integer :section
#      t.integer :level
#      t.integer :points
#      t.boolean :career_assist 
#      t.text :description ,null: true
#      t.integer :age ,null: true
#      t.string :courses ,null: true
#      t.text :interests ,null: true
#      t.integer :marks10 ,null: true
#     t.integer :marks12 ,null: true
#      t.integer :marksug ,null: true

#
class User < ActiveRecord::Base
	validates :name,:email,:presence => true
	enum section: [:'Arts', :'Commerce',:'Science']
 	enum level: [:'Undergraduate',:'Global',:'Postgraduate']
 
end
