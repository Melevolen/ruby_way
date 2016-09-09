require_relative 'modules'
class Max
  include Task_9
  include InstanceCounter #::InstanceMethods
  include Validation

  NUMBER_FORMAT = /^(\d{3}|[a-z]{3})-?(\d{2}|[a-z]{2})$/i
  validate :number, :format, NUMBER_FORMAT
 # attr_accessor_with_history :gr, :method2, :numb
  def initialize(*args)
    @numb = *args[0]
    register_instances
    p self.class
  end
end

l = Max.new
p Max.class_variables
p Max.instance_variables # Class-Level instance variables
p l.instance_variables












# Max.methods
# Max.attr_accessor_with_history(:a, :b, :c) 
# m = Max.new

# # p m.a
# m.a = 5
# m.a = 255
# m.b = 7
# m.b = 47
# m.c = 6
# m.c = 36
# m.c = 44

# p Max.history_h
# p m.c
# puts '------'
# p m.c_history
# p 1.send("+", 2)

# f = String.new
# test_h = {}
# test_h[f] = []
# # p test_h
# s = 13
# d = 'fork'
# w = /A-Z/
# a = 'format'
# test_h[f] << {type: d, arg: s}
# test_h[f] << {type: a, arg: w}
# p test_h
# test_h.keys.each do |k|
#   test_h[k].each do |i|
# 	 p i[:type] 
# 	 p i[:arg]
#   end
# end
