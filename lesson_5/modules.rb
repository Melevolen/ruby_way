module Prod
attr_accessor :factory
	def factory(factory_name)
		@factory = factory_name
	end
end

module InstanceCounter
	attr_accessor :instance
	@@instance = 0
	def self.instances 
		puts @@instance
	end
	
protected
	def register_instance(@@instance) 
	  @@instance += 1
	  p @@instance
	end
end
