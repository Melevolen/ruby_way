require_relative 'modules'

class Carriage
  include Prod
  def create(kind, carriage_prod, carriage_space)
    fail 'Error: Wrong kind' if kind != 'cargo' && kind != 'passenger'
    if kind == 'cargo'
      CargoCarriage.new(kind, carriage_prod, carriage_space)
    elsif kind == 'passenger'
      PassengerCarriage.new(carriage_prod, carriage_space)
    end
  end
end
