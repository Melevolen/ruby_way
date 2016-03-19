require_relative 'railway_station'
require_relative 'route'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'
require_relative 'modules'
require_relative 'train'

puts "Railway-creation.   v. 1.0"
puts "Hi, now you are in Railway-creation mode!"
puts "Pls, have in mind - you MUST create some stations, minimal ONE route and ONE train, add stations to your Route "
puts "Only after all you will can pull Train on the Route"
puts "Briefly: stations, route, add stations to route, train, add train to route and you will feel happiness."
puts "In version 1.0 we dont use Routs! Only stations, trains and carriages."
puts "----"

#trains = []
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
      raise "Error: Wrong kind" if train_kind !=  "cargo" && train_kind != "passenger"
      puts "Who will produce the train?"
      train_factory = gets.chomp
      puts "train_number?"
      train_number = gets.chomp
        if train_kind == "cargo"
          puts "Name for cargo Train? "
          train_name = gets.chomp 
          train_name = CargoTrain.new(train_name, train_factory, train_number)
        elsif train_kind == "passenger"
          puts "Name for passenger Train? "
          train_name = gets.chomp
          train_name = PassengerTrain.new(train_name, train_factory, train_number)
        end   
    when command == "carriage_add"
      puts "Pls tell a name of created train: "
      train_name = gets.chomp
      puts "Say a name of company that will produce Carriage: "
      carriage_prod = gets.chomp
      Train.trains.each{|n, x|  x.carriage_add(x.kind, carriage_prod) if x.name == train_name}
    when command == "carriage_del" # Удалим самый последний вагон.
      puts "Pls tell a name of created train: "
      train_name = gets.chomp
      Train.trains.each{|n, x|  x.carriage_del if x.name == train_name}
    when command == "train on station" 
      puts "train name: "
      train_name = gets.chomp
      puts "station name: "
      station_name = gets.chomp
      train_obj = trains.each {|i| p x if i == train_name }
      stations.each do |x|
          x.train_add(train_obj) if x.name == station_name
      end
    when command == "list"  
      p "Our trains: #{Train.trains}"
      p "Our full stations data: #{stations}"
      p "Our railway stations names: #{RailwayStation.all}"
      stations.each do |i|
        p "On station: #{i.name} we have: " 
        p i.trains_list
      end
    when command == 'train_s'
      puts "Input a number of your train: "
      train_number = gets.chomp 
      Train.find(train_number)

  end 
end

