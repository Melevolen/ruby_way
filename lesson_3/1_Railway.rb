class RailwayStation
	attr_accessor :trains 

	def initialize(name)
		@name = name
		@trains = []
	end
	def train_add (obj) 
		@trains << obj
	end
	def trains_go_route(obj)
		@trains.delete(obj)
	end 
	def trains_list
		puts @trains
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
		@stations.insert(1, station_name)
	end
	def station_del (station_name)
		@stations.delete(station_name)
	end 
	def stations_get
		puts @stations
	end
end


class Train

	attr_accessor :speed
	attr_reader :carriages, :kind, :route

	def initialize (kind, carriages) #cargo || passenger
		@speed = 0
		@carriages = carriages
		@kind = kind
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
	def route_add(route_name)
		@route = route_name.stations
	end
	def station_now 
		@route[0].name  
	end
	def station_next
	end
	def station_previous 
	end
end

station1 = RailwayStation.new("monino")
p station1
station2 = RailwayStation.new("nijnie_cotli")
p station2
station3 = RailwayStation.new("odincovo")
p station3

route1 = Route.new(station1, station3)
route1.station_add(station2)
p route1.stations
train1 = Train.new("cargo", 15)
train1.route_add(route1)
p train1.route 
p train1.station_now




