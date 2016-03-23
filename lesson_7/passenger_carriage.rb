class PassengerCarriage

  attr_reader :kind, :factory, :size_full # Пока не добавил не работал validate!. Без него метод Train работает, а тут не работает...
  attr_accessor :free_space

  def initialize(carriage_prod, size = 150)
    @kind = "passenger"
    @factory = carriage_prod
    @size = size
    @free_space = size
    @number = rand(200..500)
    validate!
    rescue RuntimeError => e 
      puts e.inspect
  end
  def validate!
    raise "Error! Wring kind for this class." if kind != "passenger" # Пока что сделал на всякий случай. 
    raise "Error! Factory must be." if factory.nil?
  end
  def passenger_add
    @free_space -= 1
  end
  def busy_space
   @size - @free_space
  end
  def valid?
    validate!
  rescue
    false
  end
end
