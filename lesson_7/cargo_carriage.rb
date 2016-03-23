class CargoCarriage

attr_reader :kind, :factory, :number # Пока не добавил не работал validate!. Без него метод Train работает, а тут не работает...
attr_accessor :free_volume
  def initialize(kind, carriage_prod, volume = 300)
    @kind = kind
    @factory = carriage_prod
    @volume = volume
    @free_volume = volume
    @number = rand(200..500)
    validate!
    rescue RuntimeError => e 
      puts e.inspect
  end
  def loading_goods(goods)
    @free_volume = @volume - goods.to_i
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
