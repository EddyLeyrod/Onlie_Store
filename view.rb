class View

	def index
		puts "\n\n::::::::::::::::::::::::::::::::::::::::::::"
		puts "\nWelcome to the online store: Crea tu playera, (www.crea-tu-playera.com) \n----------------------------------------------------------------------"
		puts "Select option number"	
		puts "1. Login"
		puts "2. Register"
		puts "3. Exit"
		print "=> "
		gets.chomp
	end
	#vista para el usuario par login
	def login
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		log = []
		puts "Ingresa tu email"
		print "=> "
		email = gets.chomp
		puts "Ingresa tu password"
		print "=> "
		pass = gets.chomp
		log << email
		log << pass
		log
	end

	def register
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		new_user = []	
		puts "Registro"	
		puts "Ingresa tu nombre"
		name = gets.chomp
		puts "Ingresa tu correo"
		email = gets.chomp
		puts "Crea tu password"
		pass = gets.chomp
		puts "Tipo de usuario :: |Admin|Seller|Client|"
		type = gets.chomp		
		new_user << name
		new_user << email
		new_user << pass
		new_user << type
		new_user
	end

	def welcome_admin(user)
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		puts "Welcome #{user.name}. Your type is Admin."
		puts "Select option number:"
		puts "1. Logout"
		puts "2. Products index"
		puts "3. Create product"
		puts "4. Users index"
		puts "5. Salir"
		gets.chomp
	end

	def welcome_seller(user)
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		puts "Welcome #{user.name}. Your type is Seller."
		puts "Select option number:"
		puts "1. Logout"
		puts "2. Products index"
		puts "3. Create product"
		puts "4. Salir"
		gets.chomp
	end

	def welcome_client(user)
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		puts "Welcome #{user.name}. Your type is Client."
		puts "Select option number:"
		puts "1. Logout"
		puts "2. Products index"
		puts "3.Salir"
		gets.chomp
	end

	def exit
		puts "\n::::::::::::::::::::::::::::::::::::::::::::"
		puts "adios"
	end

	def logout
		puts "Saliste de tu cuenta"
	end


	def products_index(products)
		puts "\- - - - - -  - - - - - - - "
		puts "Todos los productos"
		products.each_with_index do |product, index|
			puts "#{index+1}.- #{product.name}"
		end
		puts "\- - - - - -  - - - - - - - "
	end

	def new_product
		puts "Crear nuevo producto"
		puts "Nombre del producto:"
		gets.chomp
	end

	def user_index(users)
		puts "\- - - - - -  - - - - - - - "
		puts "Todos los usuarios"
		users.each_with_index do |user, index|
			puts "#{index+1}.- #{user.name}"
		end
		puts "\- - - - - -  - - - - - - - "
	end

end