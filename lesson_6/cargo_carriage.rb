class CargoCarriage
	def initialize(carriage_prod)
		@kind = "cargo"
		@factory = carriage_prod
		validate!
	end
	def validate!
		raise "Error! Wring kind for this class." if kind != "cargo" # Пока что сделал на всякий случай. 
		raise "Error! Factory must be." if factory.nil?
	end
end