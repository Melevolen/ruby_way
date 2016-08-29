require_relative 'modules'
class Max
  include Task_9
  include InstanceCounter #::InstanceMethods
 # attr_accessor_with_history :gr, :method2, :numb
  def initialize(*args)
    @numb = *args[0]
    register_instances
    p self.class
  end
end

# Max.methods
Max.attr_accessor_with_history(:a, :b, :c) 
m = Max.new

# p m.a
m.a = 5
m.a = 255
m.b = 7
m.b = 47
m.c = 6
m.c = 36
m.c = 43376

p Max.history_h
p m.c
puts '------'
p m.c_history


dd = "er"
cc = "ror"
cc_cl = cc.class
puts "ok" if dd.class == cc_cl
