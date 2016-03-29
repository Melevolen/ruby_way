class PassengerCarriage
  attr_reader :kind, :factory, :size_full
  attr_accessor :free_space

  def initialize(kind, carriage_prod, carriage_space)
    @kind = kind
    @factory = carriage_prod
    @size = carriage_space
    @free_space = carriage_space
    @number = rand(200..500)
    validate!
  end

  def validate!
    fail 'Error! Wring kind for this class.' if kind != 'passenger'
    fail 'Error! Factory must be.' if factory.nil?
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
