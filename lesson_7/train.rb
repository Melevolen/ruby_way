require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'carriage'
require_relative 'modules'

class Train 

  include Prod
  attr_accessor :speed, :number
  attr_reader :carriages, :kind, :route

  NUMBER_FORMAT = /^(\d{3}|[a-z]{3})-?(\d{2}|[a-z]{2})$/i

  @@trains = {}

  def initialize (train_name, train_factory, train_number, carriages = 1)   #cargo || passenger

      @name = train_name
      @speed = 0
      @carriages = carriages
      @kind = kind
      @factory = train_factory
      @number = train_number 
      validate!
      @@trains["#{number}"] =  self 
      p "Your train was created with number: #{number}"
  end
  def validate! 
      raise "Error! Carriages are less or equal 0..." if carriages <= 0
      raise "NameError: Input factory name." if factory.nil?
      raise "NameError: input a name for your train." if name.nil? 
      raise "Wrong number format!!!" if number !~ NUMBER_FORMAT 
      raise "Number already created." if @@trains.keys.include?(number) # Валидация на глобальную уникальность номера.
      true
  end
  def valid?
    validate! # Train instance validate.
  rescue 
    false
  end
  def carriage_to_block(&block)
    @carriages.each{|carriage| yield(carriage)}
  end
  def self.trains
    @@trains
  end
  def self.find(train_number)
#    p @@trains["#{train_number}"]
  p  @@trains["#{train_number}"]
  end
  def carriage_del
    if speed == 0 && @carriages.count > 0 
      @carriages.delete_at(-1)
    else
      puts "pls stop the Train! Use 'stop' method for it AND check your CARRIAGES"
    end
  end
  def carriage_add(kind, carriage_prod, carriage_space)
    raise "Not enougth data! kind, carriage_prod" if kind.nil? || carriage_prod.nil?
    raise "Error! Too much speed! pls stop the Train! Use 'stop' method for it." if speed != 0 
    @carriages << Carriage.new.create(kind, carriage_prod, carriage_space)
  end
  def faster(spd)
    raise "Error! No variable!" if spd.nil?
    @speed += spd
  end
  def stop
    @speed = 0
  end

  def route_add(route_name, train_obj)
    raise "Error! route_name?" if route_name.nil?
    raise "Error! train_obj?" if train_obj.nil?
    @route = route_name
    @stn = 0 
    @route.stations[@stn].train_add(train_obj)
  end

  def station_now 
    p @route.stations[@stn].name
  end

  def station_next
    p @route.stations[@stn+1].name
  end

  def station_previous 
    if @stn == 0
      puts "You at the first station in your Route"
    else 
      p @route.stations[@stn-1].name
    end
  end

  def go_forward(train_obj)
    @route.stations[@stn].trains_go_route(train_obj)
    @stn += 1 
    @route.stations[@stn].train_add(train_obj)
  end
   
end
