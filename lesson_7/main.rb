require_relative 'railway_station'
require_relative 'route'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'
require_relative 'modules'
require_relative 'train'

stations = []
command = "start"
while command != "exit"
  puts "Input command:  "
  command = gets.chomp
  case 
    when command == "station"
      puts "Name for Station? "
      station_name = gets.chomp
      begin
        station_name = RailwayStation.new(station_name)
        rescue RuntimeError => e 
        puts e.inspect
      end
    when command == "train"
      puts "What kind of train you want? (cargo or passenger)"
      train_kind = gets.chomp
      raise "Error: Wrong kind" if train_kind !=  "cargo" && train_kind != "passenger"
      puts "Who will produce the train?"
      train_factory = gets.chomp
      puts "train_number?"
      train_number = gets.chomp
      begin
        if train_kind == "cargo"
          puts "Name for cargo Train? "
          train_name = gets.chomp 
          train_name = CargoTrain.new(train_name, train_factory, train_number)
        elsif train_kind == "passenger"
          puts "Name for passenger Train? "
          train_name = gets.chomp
          train_name = PassengerTrain.new(train_name, train_factory, train_number)
        end 
        rescue RuntimeError => e 
        puts e.inspect
      end
    when command == "carriage_add"
      puts "Pls tell the number of created train: "
      train_number = gets.chomp
      puts "Say a name of company that will produce Carriage: "
      carriage_prod = gets.chomp
      # Train.trains.each{|n, x|  x.carriage_add(x.kind, carriage_prod) if x.name == train_name}
      begin
        train_obj = Train.trains["#{train_number}"]
        puts "Input size for carriage:" if train_obj.kind == "passenger"
        puts "Input volume for carriage" if train_obj.kind == "cargo"
        carriage_space = gets.chomp
        train_obj.carriage_add(train_obj.kind, carriage_prod, carriage_space) #ВОзможно возвращение train_obj через self чтобы вообще все в предыдущей строке записать
        rescue RuntimeError => e 
        puts e.inspect
      end
    when command == "carriage_del" # Удалим самый последний вагон.
      puts "Pls tell a name of created train: "
      train_name = gets.chomp
      Train.trains.each{|n, x|  x.carriage_del if x.name == train_name}

    when command == "train on station" 
      puts "train number: "
      train_number = gets.chomp
      puts "station name: "
      station_name = gets.chomp
#      train_obj = Train.trains.each {|k, v| p v if k.to_s == train_number.to_s }
      train_obj = Train.find(train_number)
      RailwayStation.all.each do |x, v|
          v.train_add(train_obj) if x == station_name
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
      
    when command == 'stations_trains'
      RailwayStation.all.each do |k, i|
        puts "On #{i} station we have: "
        i.trains.each do |trn| 
          puts "Train with number: #{trn.number}, kind - #{trn.kind} and #{trn.carriages} carriages."
          puts "Carriages in that train: #{trn.carriages}" 
          trn.carriages.each do |carr| 
            puts "Carriage number #{carr.number}, kind #{carr.kind}, free space #{carr.free_volume}" if carr.kind == "cargo"
            puts "Carriage number #{carr.number}, kind #{carr.kind}, free size #{carr.free_space}" if carr.kind == "passenger"
          end
        end
      end

    when command == "carriage_list"
      puts "Train number for carriage list:"
      train_number = gets.chomp
      Train.trains["#{train_number}"].carriages.each do |i|
        puts "Carriage number #{i.number}, kind #{i.kind}, free space #{i.free_volume}" if i.kind == "cargo"
        puts "Carriage number #{i.number}, kind #{i.kind}, free size #{i.free_space}" if i.kind == "passenger"
      end

    when command == "load_carriage"
      puts "Train number for carriage list:"  
      train_number = gets.chomp 
      train_obj = Train.trains["#{train_number}"] 
      p train_obj
      puts "carriage number?"
      carriage_numb = gets.chomp
      if train_obj.kind == "cargo" 
        puts "how much?"
        weight = gets.chomp
        train_obj.carriages.each{|i| i.loading_goods(weight) if i.number.to_s == carriage_numb}
      else
        train_obj.carriages.each {|i| i.passenger_add if i.number.to_s == carriage_numb}
      end       
  end 
end

