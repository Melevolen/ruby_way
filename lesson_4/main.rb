require_relative 'railway_station'
require_relative 'route'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'

puts "Railway-creation.   v. 1.0"
puts "Hi, now you are in Railway-creation mode!"
puts "Pls, have in mind - you MUST create some stations, minimal ONE route and ONE train, add stations to your Route "
puts "Only after all you will can pull Train on the Route"
puts "Briefly: stations, route, add stations to route, train, add train to route and you will feel happiness."
puts "In version 1.0 we dont use Routs! Only stations, trains and carriages."
puts "----"

# + Создавать станции
# + Создавать поезда
# + Добавлять вагоны к поезду
# + Отцеплять вагоны от поезда
# + Помещать поезда на станцию
# + Просматривать список станций и список поездов на станции
trains = []
stations = []
command = "start"
while command != "exit"
	puts "Input command:  "
	command = gets.chomp
	case 
		when command == "station"
			puts "Name for Station? "
			station_name = gets.chomp
			station_name = RailwayStation.new(station_name)
			stations << station_name
		when command == "train"
			puts "What kind of train you want? (cargo or passenger)"
			train_kind = gets.chomp 
				if train_kind == "cargo"
					puts "Name for cargo Train? "
					train_name = gets.chomp
					train_name = CargoTrain.new(train_name)
					trains << train_name
				elsif train_kind == "passenger"
					puts "Name for passenger Train? "
					train_name = gets.chomp
					train_name = PassengerTrain.new(train_name)
					trains << train_name
				else
					puts "ERROR: Wrond kind"	
				end	
		when command == "carriage_add"
			puts "Pls tell a name of created train: "
			train_name = gets.chomp
			trains.each{|x|  x.carriage_add(x.kind) if x.name == train_name}
		when command == "carriage_del" # Удалим самый последний вагон.
			puts "Pls tell a name of created train: "
			train_name = gets.chomp
			trains.each{|x|  x.carriage_del if x.name == train_name}
		when command == "train on station" 
			puts "train name: "
			train_name = gets.chomp
			puts "station name: "
			station_name = gets.chomp
			train_obj = trains.each {|i| p x if i == train_name }
			stations.each do |x| # Да, я добавил итератор в итератор, чтобы мы могли итерировать пока итерируем. Это не заработало и все поменял.
					x.train_add(train_obj) if x.name == station_name
				# trains.each {|i| x.train_add(i) if i == train_name }
				# else
				# 	puts "thms wrong..."
				# end
			end
		when command == "list"	
			p "Our trains: #{trains}"
			p "Our stations: #{stations}"
			stations.each do |i|
				p "On station: #{i.name} we have: " 
				p i.trains_list
			end
	end 
end

