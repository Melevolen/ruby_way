require_relative 'train'
require_relative 'cargo_carriage'
require_relative 'modules'
class CargoTrain < Train
  attr_accessor :carriages, :name

  def initialize(options = {}) # train_name, train_factory, train_number
    super
    @kind = 'cargo'
    @carriages = []
  end
end
