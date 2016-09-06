require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'
require_relative 'modules'

class Train
  include Prod
  include Task_9
  include Validation
  attr_accessor :speed, :number
  attr_reader :carriages, :kind, :route

  NUMBER_FORMAT = /^(\d{3}|[a-z]{3})-?(\d{2}|[a-z]{2})$/i

  @@trains = {}

  def initialize(options = {}) # train_name, train_factory, train_number
    @name = options[:name] # train_name
    @speed = 0
    @carriages = []
    @kind = kind
    @factory = options[:factory] # train_factory
    @number = options[:number] # train_number
    self.validate(name, 'format', NUMBER_FORMAT)
    validate!
    @@trains["#{number}"] = self
    p "Your train was created with number: #{number}"
  end

  # def validate!
  #   #    fail 'Error! Carriages are less or equal 0...' if carriages <= 0
  #   # fail 'NameError: input a name for your train.' if name.nil?
  #   # fail 'Wrong number format!!!' if number !~ NUMBER_FORMAT

  #   fail 'Number already created.' if @@trains.keys.include?(number)
  #   fail 'NameError: Input factory name.' if factory.nil?
  #   true
  # end

  def carriage_to_block(&_block)
    @carriages.each { |carriage| yield(carriage) }
  end

  def self.trains
    @@trains
  end

  def self.find(train_number)
    #    p @@trains["#{train_number}"]
    p @@trains["#{train_number}"]
  end

  def carriage_del
    if speed == 0 && @carriages.count > 0
      @carriages.delete_at(-1)
    else
      puts "pls stop the Train! Use 'stop' method for it AND check CARRIAGES"
    end
  end

  def carriage_add(kind, carriage_prod, carriage_space)
    fail 'Not enougth! kind, carriage_prod' if kind.nil? || carriage_prod.nil?
    fail "Error! Too much speed! pls stop the Train!
      Use 'stop' method for it." if speed != 0
    @carriages << Carriage.new.create(kind, carriage_prod, carriage_space)
  end

  def faster(spd)
    fail 'Error! No variable!' if spd.nil?
    @speed += spd
  end

  def stop
    @speed = 0
  end

  def route_add(route_name, train_obj)
    fail 'Error! route_name?' if route_name.nil?
    fail 'Error! train_obj?' if train_obj.nil?
    @route = route_name
    @stn = 0
    @route.stations[@stn].train_add(train_obj)
  end

  def station_now
    p @route.stations[@stn].name
  end

  def station_next
    p @route.stations[@stn + 1].name
  end

  def station_previous
    if @stn == 0
      puts 'You at the first station in your Route'
    else
      p @route.stations[@stn - 1].name
    end
  end

  def go_forward(train_obj)
    @route.stations[@stn].trains_go_route(train_obj)
    @stn += 1
    @route.stations[@stn].train_add(train_obj)
  end
end
