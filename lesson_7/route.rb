class Route
  attr_accessor :stations

  def initialize (from, to)
    @from = from
    @to = to
    @stations = [from, to] 
    validate!
    rescue RuntimeError => e 
      puts e.inspect
  end 

  def validate!
    raise "Error! From?" if from.nil?
    raise "Error! To?" if to.nil?
  end

  def valid?
    validate! # Route instance validate.
  rescue 
    false
  end

  def station_add(station_name) # Добавляем валидацию - добавленные обьекты являются классом RailwayStation
    raise "Error! no name!" if station_name.nil?
    RailwayStation.stations.each {|i| @stations.insert(1, station_name)  if i.name == station_name}
    raise "Error! Station object not The RailwayStation object. :(" if station_name.self.class != RailwayStation
    # @stations.insert(1, station_name)
  end

  def station_del (station_name)
    raise "Error! no name!" if station_name.nil?
    @stations.delete(station_name)
  end 

  def stations_get
    puts @stations
  end
  
end
