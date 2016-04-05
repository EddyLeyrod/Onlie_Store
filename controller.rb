require_relative 'modelo'
require_relative 'view'

class Controller

	def initialize
		@model = Store.new
		@view = View.new
	end

	def welcome
		#option recibe el metodo welcome de vista
		option = @view.welcome

		case 
		when option == "1"
		 	@view.login
		when option == "2"
		 	new_user(@view.register)
		when option == "3"
		 	@view.exit
		else
		  "no ingresaste opcion"
		end
	end
#prueba de git
	def new_user(data_register)
		#mandar el metodo que guarda en el CSV
		@model.create(User.new(data_register[0],data_register[1],data_register[2],data_register[3]))

	end

	def login

		
	end

	def register
		#añadir usuario
		#autentificacion
		#cpontrolar el acceso
		
	end

end

store = Controller.new
store.welcome