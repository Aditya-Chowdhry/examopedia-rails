class User < ActiveRecord::Base
	enum section: [:'Arts', :'Commerce',:'Science']
 	enum level: [:'Undergraduate',:'Global',:'Postgraduate']
 
end
