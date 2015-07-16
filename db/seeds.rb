# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#f.input :title
      # Will preview the image when the object is edited
     # f.input :image
     # f.input :description
     # f.input :section, as: :select, collection: Exam.sections.keys
     # f.input :level, as: :select, collection: Exam.levels.keys
     # f.input :exam_date
     # f.input :form_last_date
     # f.input :form_release_date
     # f.input :link1_name
     # f.input :link1
     # f.input :link2_name
     # f.input :link2
     # f.input :link3_name
     # f.input :link4_name
     # f.input :link4
     # f.input :gen_fees_boys , :label => "Gen Boys fees-integer"
     # f.input :gen_fees_girls ,:label => "Gen Girls fees-integer"
     # f.input :sc_fees_boys , :label => "Sc/st/obc Boys Fees -integer"
     # f.input :sc_fees_girls, :label => "Sc/st/obc Girls Fees -integer"
     # f.input :others_note ,:label => "Some other fees if given. Give name of fees-string."
     # f.input :others, :label => "Other fees-integer . (If other fees given)"
#
#
i=0
	for a in 'a'..'z'
		for b in a..'z'
			for c in b..'z'
   			Exam.create!(title:"#{a}+#{a}@#{b}+#{c}",description:"#{b}+#{a}+#{b}+#{a}+#{b}+#{a}+#{b}+#{a}",section:0,level:0,exam_date:"01/01/2015",form_last_date:"01/01/2015",form_release_date:"01/01/2015",gen_fees_boys:"#{i*500}",gen_fees_girls:"#{i*500}",link1:"#{a}#{b}#{c}",link2:"#{a}#{b}#{c}",link1_name:"#{a}#{b}#{c}",link2_name:"#{a}#{b}#{c}");
   			i=i+1;
   			if i==100
   				break
   			end
		end
   		 if i==100
   		 break
   		end
   	end

   			if i==100
   				break
   			end	
   end		