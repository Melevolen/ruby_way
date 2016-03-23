require_relative 'modules'
class Max
#	extend InstanceCounter::ClassMethods
	include InstanceCounter   #::InstanceMethods
	def initialize(numb)
		@numb = numb
		register_instances
		p self.class
	end
end
lol = Max.new("123")
p Max.instances
puts "yes" if lol.class == Max
