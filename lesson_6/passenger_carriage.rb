class PassengerCarriage

  attr_reader :kind, :factory # Пока не добавил не работал validate!. Без него метод Train работает, а тут не работает...

  def initialize(carriage_prod)
    @kind = "passenger"
    @factory = carriage_prod
    validate!
    rescue RuntimeError => e 
      puts e.inspect
  end
  def validate!
    raise "Error! Wring kind for this class." if kind != "passenger" # Пока что сделал на всякий случай. 
    raise "Error! Factory must be." if factory.nil?
  end
  def valid?
    validate!
  rescue
    false
  end
end
