class View

def welcome
	puts "\nWelcome to the online store: Crea tu playera, (www.crea-tu-playera.com) \n----------------------------------------------------------------------"
	puts "Select option number"	
	puts "1. Login"
	puts "2. Register"
	puts "3. Exit"
	print "=> "
	gets.chomp
	end

	def login
		puts "Ingresa tu email"
		print "=> "
		gets.chomp.to_s
	end

	def register
		new_user = []	
		puts "Registro"	
		puts "Ingresa tu nombre"
		name = gets.chomp
		puts "Ingresa tu correo"
		email = gets.chomp
		puts "Crea tu password"
		pass = gets.chomp
		puts "Tipo de usuario |Admin|Seller|Client|"
		type = gets.chomp
		
		new_user << name
		new_user << email
		new_user << pass
		new_user << type
		new_user
	end

	def exit
		puts "adios"
	end

end