require_relative 'train'
require_relative 'cargo_carriage'
class CargoTrain < Train
	attr_accessor :carriages, :name
	def initialize (train_name, train_factory, carriages = 1)
		super
		@kind = "cargo"
		@carriages = [] 
#		@name = train_name	
	end
end