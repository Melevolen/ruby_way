module Prod
attr_accessor :factory
	# def factory(factory_name)
	# 	@factory = factory_name
	# end
end

module InstanceCounter
	module ClassMethods
		attr_accessor :instances
		@instances = 5
		# def initialize
		# 	register_instance
		# end
		# def self.instances 
		# 	@@instances
		# end
	end

	module InstanceMethods

#		protected
		def register_instance
		  @@instances += 1
		end
	end
end
