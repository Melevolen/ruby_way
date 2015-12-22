class RailwayStation
	attr_accessor :trains 
	attr_reader :name
	def initialize(name)
		@name = name
		@trains = []
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
	# def trains_cargo_count
	# 	@trains.each  do |x|
	# 		if x.kind == "cargo"
	# 			@trains_cargo += 1
	# 		end
	# 		p @trains_cargo
	# 	end
	# end
	# def trains_passenger_count
	# 	@trains.each  do |x|
	# 		if x.kind == "passenger"
	# 			@trains_passenger += 1
	# 		end
	# 		p @trains_passenger
	# 	end
	# end
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

class Train 
# Перемещаться между станциями, указанными в маршруте.

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
	def carriages_add
		if speed == 0
			@carriages += 1
		else
			puts "pls stop the Train! Use 'stop' method for it."
		end
	end
	def route_add(route_name, train_obj)
		@route = route_name
		@stn = 0 # Подразумеваю номер станции, когда назначаем маршрут, поезд же с первой станции начинает.
		@route.stations[@stn].train_add(train_obj)
	end
	def station_now 
	#	@route.stations.each {|x| p x.name}
		p	@route.stations[@stn].name
	end
	def station_next
		p	@route.stations[@stn+1].name
	end
	def station_previous 
		if @stn == 0 
			puts "You at the first station in your Route"
		else 
			p	@route.stations[@stn-1].name
		end
	end
	def go_forward(train_obj)
		@route.stations[@stn].trains_go_route(train_obj)
		@stn += 1 # && (puts "Go to the next station")
		@route.stations[@stn].train_add(train_obj)
	end	
	def carriages_del
		if speed == 0 && @carriages != 0   # Проверяем скорость и кол-во вагонов.
			@carriages -= 1
		else
			puts "pls stop the Train! Use 'stop' method for it AND check your CARRIAGES"
		end
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
train1.route_add(route1, train1)

p train1.route 
train1.station_next

train1.go_forward(train1) # Едем на следующую станцию
train1.station_next
train1.station_previous

train1.go_forward(train1) # Едем на следующую, последнюю в этом маршруте станцию.
train1.station_now

p train1.carriages #ДОбавляем вагончик
train1.carriages_add
p train1.carriages

station3.trains_count("cargo") # Считаем кол-во поездов на станции каждого вида.
station3.trains_count("passenger") 

train1.carriages_del # Отцепили 2 вагона.
train1.carriages_del
p train1.carriages







