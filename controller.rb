require_relative 'modelo'
require_relative 'view'

class UserController
	def logout
		@view.logout
		welcome
	end
	
	def product_index
		productall = @store.show_products
		@view.products_index(productall)
		login(@data)
	end
			
	def create_product
		@store.create_product(Product.new(@view.new_product))
		login(@data)			
	end
			
	def user_index
		@view.user_index(@store.search_user)							
		login(@data)
	end			
end

class Controller<UserController

	def initialize
		@store = Store.new
		@view = View.new
		@data
		welcome
	end

	def welcome
		case option = @view.index
		when "1"
		 	login(@view.login)
		when "2"
		 	new_user(@view.register)
		 	welcome
		when "3"
		 	@view.exit		  
		else
			p "*   **   * selecciona un opcion  **   **   *"
			welcome
		end
		  

		
	end

	def new_user(data_register)
		#mandar el metodo que guarda en el CSV
		@store.create_user(User.new(data_register[0],data_register[1],data_register[2],data_register[3]))
	end

	def login(data_log) #recibe el arrgelo de login view
		users = @store.search_user
		@data = data_log
		#itero el arreglo de mis usuarios objetos
		users.each do |user|
			user
			user #= user.email, user.pass, user.type
			if data_log[0] == user.email && data_log[1] == user.pass 
				p "datos verificados"
				if user.type == 'Admin'
					admin(@view.welcome_admin(user))
				elsif user.type == 'Seller'		
					seller(@view.welcome_seller(user))
				elsif user.type == 'client'			
					client(@view.welcome_client(user))
				end
			end
		end
		 p "*    **    **    *Email o password incorrectos*    **    **    *" 
		welcome
	end	
	
	#acciones de administrador
	def admin(accions)
		case accions
		when "1"
			logout
		when "2"
			product_index
		when "3"
			create_product
		when "4"
			user_index			
		end

	end

	def seller(accions)
		case accions
		when "1"
			logout
		when "3"
			create_product
			
		when "2"
			product_index
		end

	end

	def client(accions)
		case accions
		when "1"
			logout
		when "2"
			product_index
		end
	end

end

Controller.new
#store.welcome