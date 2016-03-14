require_relative 'modules'
class RailwayStation
	extend InstanceCounter
	attr_accessor :trains
	attr_reader :name
	@@r_stations = []
	def initialize(name)
		@name = name
		@trains = []
		@@r_stations << name
	end
	def self.all
		return @@r_stations	
	end
	def train_add (train_obj) 
		@trains << train_obj
	end
	def trains_go_route(train_obj)
		@trains.delete(train_obj)
	end 
	def trains_list
		puts @trains
	end
	def trains_count(knd) # cargo || passenger
		trains_count_now = 0
		@trains.each do |x|
			if x.kind == knd
				trains_count_now += 1
			end
			p trains_count_now
		end	
	end 
end