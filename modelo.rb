require 'csv'

class Product
	#mostrar todos los productos
	attr_accessor :name
	def initialize(name)
		@name = name	
	end

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

#agrega el usuario al CSV
class Store

	def initialize
	end
	def create_user(user)
		CSV.open("users.csv", "a+") do |csv|
			csv << [user.name,user.email,user.pass,user.type]
		end 
	end

	def search_user
		users = []
		CSV.foreach("users.csv") do |user|
			users << User.new(user[0],user[1],user[2],user[3])
		end	
		users
	end


	def create_product(product)
		CSV.open("products.csv", "a+") do |csv|
			csv << [product.name]
		end
	end

	def show_products
		products = []
		CSV.foreach("products.csv") do |product|
			products << Product.new(product[0])
		end	
		products
	end

end