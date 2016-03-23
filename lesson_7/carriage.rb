require_relative 'modules'

class Carriage
	include Prod
	def create(kind, carriage_prod)
		raise "Error: Wrong kind" if kind !=  "cargo" && kind != "passenger"
		if kind == "cargo"
			CargoCarriage.new(kind, carriage_prod)
		elsif kind == "passenger"
			PassengerCarriage.new(carriage_prod)
		end
	end
end
