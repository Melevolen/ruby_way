require_relative 'modules'
class RailwayStation
  extend InstanceCounter
  attr_accessor :trains
  attr_reader :name
  @@r_stations = {}

  def initialize(name)
    @name = name
    @trains = []
    @@r_stations["#{name}"] = self
    validate!
  end

  def trains_to_block(&_block)
    @trains.each do |i|
      yield(i)
    end
  end

  def validate!
    fail 'NameError: input a name for your train.' if name.nil?
    true
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.all
    @@r_stations
  end

  def train_add(train_obj)
    @trains << train_obj
  end

  def trains_go_route(train_obj)
    @trains.delete(train_obj)
  end

  def trains_list
    puts @trains
  end

  def trains_count(knd) # cargo || passenger
    trains_count_now = 0
    @trains.each do |x|
      trains_count_now += 1 if x.kind == knd
      p trains_count_now
    end
  end
end
