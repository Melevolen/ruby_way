class Carriage
#	def self.create(kind)
	def create(kind)
		if kind == "cargo"
			CargoCarriage.new
		elsif kind == "passenger"
			PassengerCarriage.new
		else
			puts "Wrong kind of train."
		end
	end
end
	