require 'csv'

class Product
	#mostrar todos los productos

end


class User
	attr_accessor :name,:email,:pass,:type
	def initialize(name,email,pass,type)
		 @name = name
		 @email = email
		 @pass = pass
		 @type = type
	end
end

class Store
	def create(user)
		CSV.open("Users.csv", "a+") do |csv|
			csv << [user.name,user.email,user.pass,user.type]
		end
	end
	
end
	
		
