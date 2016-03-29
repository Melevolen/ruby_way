class CargoCarriage
  attr_reader :kind, :factory, :number
  attr_accessor :free_volume
  #  @@cargo_carriages = {}
  def initialize(kind, carriage_prod, carriage_space)
    @kind = kind
    @factory = carriage_prod
    @volume = carriage_space
    @free_volume = carriage_space
    @number = rand(200..500)
    validate!
    #   @@cargo_carriages["#{number}"] = self
  end

  def loading_goods(goods)
    @free_volume = @free_volume.to_i - goods.to_i
  end

  def busy_space
    #   @free_volume ||= @volume
    p @volume - @free_volume
  end

  def validate!
    fail 'Error! Wring kind for this class.' if kind != 'cargo'
    fail 'Error! Factory must be.' if factory.nil?
  end

  def valid?
    validate!
  rescue
    false
  end
end
