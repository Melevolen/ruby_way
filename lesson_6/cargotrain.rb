require_relative 'train'
require_relative 'cargo_carriage'
class CargoTrain < Train
	attr_accessor :carriages, :name
	def initialize (train_name, train_factory, train_number, carriages = 1)
		super
		@kind = "cargo"
		@carriages = [] 
	end
end