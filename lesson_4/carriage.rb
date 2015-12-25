class Carriage
	def carriage_create(kind, train_obj)
		if kind == "cargo"
			train_obj.carriages << CargoCarriage.new
		elsif kind == "passenger"
			train_obj.carriages << PassengerCarriage.new
		else
			puts "Wrong kind of train."
		end
	end
end

