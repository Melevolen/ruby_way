require_relative 'train'
class CargoTrain < Train
	def initialize (carriages = 1)
		super
		@kind = "cargo" 	
	end
end
