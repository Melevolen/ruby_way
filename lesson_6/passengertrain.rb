require_relative 'train'
require_relative 'passenger_carriage'
class PassengerTrain < Train
	attr_accessor :carriages, :name
	def initialize (train_name, train_factory, carriages = 1)
		super
		@kind = "passenger" 
		@carriages = []
	end
end
