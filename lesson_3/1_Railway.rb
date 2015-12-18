class RailwayStation
	attr_accessor :trains 

	def initialize(name)
		@name = name
		@trains = 0
	end
	def trains=
		@trains += 1
	end
	def trains_go_route
		@trains -= 1
	end 
end

class Route
	attr_accessor :stations

	def initialize (from, to)
		@from = from
		@to = to
		@stations = [from, to] 
	end 
	def station_add(station_name)
		@stations << station_name
	end
	def station_del (station_name)
		@stations.delete(station_name)
	end 
	def stations_get
		puts @stations
	end
end

# cargo passenger
class Train

	attr_accessor :speed
	attr_reader :carriages

	def initialize (kind, carriages) #cargo || passenger
		@speed = 0
		@carriages = carriages
	end 
	def faster(spd)
		@speed += spd
	end
	def stop
		@speed = 0
	end
	def carriages
		if speed == 0
			@carriages += 1
		else
			puts "pls stop the Train! Use 'stop' method for it."
		end
	end
end