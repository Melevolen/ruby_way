class CargoCarriage

attr_reader :kind, :factory, :number # Пока не добавил не работал validate!. Без него метод Train работает, а тут не работает...
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
    # rescue RuntimeError => e 
    #   puts e.inspect
  end

  def loading_goods(goods)
    @free_volume = @free_volume.to_i - goods.to_i
  end

  def busy_space
 #   @free_volume ||= @volume
    p @volume - @free_volume
  end

  def validate!
    raise "Error! Wring kind for this class." if kind != "cargo" 
    raise "Error! Factory must be." if factory.nil?
  end

  def valid?
    validate!
  rescue
    false
  end

end
