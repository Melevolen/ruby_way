require_relative 'train'
require_relative 'cargo_carriage'
class CargoTrain < Train
	attr_accessor :carriages, :name
	def initialize (name, carriages = 1)
		super
		@kind = "cargo"
		@carriages = [] 
		@name = name	
	end
	def carriage_add
		if speed == 0
#			@carriages += 1
			@carriages << CargoCarriage.new
		else
			puts "pls stop the Train! Use 'stop' method for it."
		end
	end
end
