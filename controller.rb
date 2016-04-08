require_relative 'modelo'
require_relative 'view'

class Controller

	def initialize
		@store = Store.new
		@view = View.new
		@data
	end

	def welcome
		case option = @view.index
		when "1"
		 	login(@view.login)
		when "2"
		 	new_user(@view.register)
		when "3"
		 	@view.exit		  
		end
		  puts "*   **   *   *no ingresaste opcion*   **   *"
		welcome
	end

	def new_user(data_register)
		#mandar el metodo que guarda en el CSV
		@store.create(User.new(data_register[0],data_register[1],data_register[2],data_register[3]))
	end

	def login(data_log) #recibe el arrgelo de login view
		users = @store.search_user
		@data = data_log
		#itero el arreglo de mis usuarios objetos
		users.each do |user|
			#user #= user.email, user.pass, user.type
			if data_log[0] == user.email && data_log[1] == user.pass && user.type == 'Admin'
				admin(@view.welcome_admin(user))

			elsif data_log[0] ==  user.email && data_log[1] == user.pass && user.type == 'Seller'
				@view.welcome_seller(user)
			
			elsif data_log[0] ==  user.email && data_log[1] == user.pass && user.type == 'Client'
				@view.welcome_client(user)
			else
			 "*    **    **    *Email o password incorrectos*    **    **    *" 
			end
		end
	end	
	#acciones de administrador

	
	def admin(accion)
		case accion
		when '1'
			@view.logout
			welcome
		when '2'
			@view.products_index(@store.show_products)
			login(@data)
		when '3'
			@store.create_product(Product.new(@view.new_product))
			login(@data)
		when '4'
			@view.user_index(@store.search_user)							
			login(@data)
		end
	end

	def seller
		
	end

	def client
		
	end

end

store = Controller.new
store.welcome