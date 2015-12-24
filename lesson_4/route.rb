class Route #Part done
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