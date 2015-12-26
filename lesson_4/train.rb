require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'

#  + Метод добавления вагонов должен остаться в базовом классе.
#  Мы передаем в параметрах объект вагона и сравниваем тип,
#  а метод сравнения типа вагона и поезда должен быть уже в подклассах,
#   а в базовом только вызываться

class Train 

	attr_accessor :speed
	attr_reader :carriages, :kind, :route

	def initialize (kind, carriages = 1)   #cargo || passenger
		if carriages > 0
			@speed = 0
			@carriages = carriages
			@kind = kind
		else
			return  puts "Your train went to the dark side... His carriages are less or equal 0..."
		end
	end
	def carriage_del
		if speed == 0 && @carriages.count > 0 
			@carriages.delete_at(-1)
		else
			puts "pls stop the Train! Use 'stop' method for it AND check your CARRIAGES"
		end
	end
	def carriage_add(kind)
		if speed == 0
			@carriages << Carriage.new.create(kind)
#			Carriage.new.carriage_create(kind, train_obj)
		else
			puts "pls stop the Train! Use 'stop' method for it."
		end
	end
	def faster(spd)
		@speed += spd
	end
	def stop
		@speed = 0
	end

	def route_add(route_name, train_obj)
		@route = route_name
		@stn = 0 
		@route.stations[@stn].train_add(train_obj)
	end
	def station_now 
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
		@stn += 1 
		@route.stations[@stn].train_add(train_obj)
	end	
end














