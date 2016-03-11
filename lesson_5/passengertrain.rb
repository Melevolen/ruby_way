require_relative 'train'
require_relative 'passenger_carriage'
class PassengerTrain < Train
	attr_accessor :carriages, :name
	def initialize (name, carriages = 1)
		super
		@kind = "passenger" 
		@carriages = []
	end
end
