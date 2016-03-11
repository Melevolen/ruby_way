require_relative 'train'
require_relative 'cargo_carriage'
class CargoTrain < Train
	attr_accessor :carriages, :name
	def initialize (name, carriages = 1)
		super
		@kind = "cargo"
		@carriages = [] 
#		@name = name	
	end
end