require_relative 'train'
class PassengerTrain < Train
	def initialize (carriages = 1)
		super
		@kind = "passenger" 
	end
end
