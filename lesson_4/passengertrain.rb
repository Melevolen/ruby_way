require_relative 'train'
require_relative 'passenger_carriage'
class PassengerTrain < Train

	attr_accessor :carriages
	def initialize (carriages = 1)
		super
		@kind = "passenger" 
		@carriages = []
	end
	def carriage_add
		if speed == 0
#			@carriages += 1
			@carriages << PassengerCarriage.new
		else
			puts "pls stop the Train! Use 'stop' method for it."
		end
	end
end
