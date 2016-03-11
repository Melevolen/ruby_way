require_relative 'modules'

class Carriage
	include Prod
	def create(kind, carriage_prod)
		if kind == "cargo"
			CargoCarriage.new(carriage_prod)
		elsif kind == "passenger"
			PassengerCarriage.new(carriage_prod)
		else
			puts "Wrong kind of train."
		end
	end
end
