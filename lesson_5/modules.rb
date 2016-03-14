module Prod
	attr_accessor :factory
end

module InstanceCounter
	def self.included (base)
		base.extend ClassMethods
		base.send :include, InstanceMethods
	end
	module ClassMethods
		attr_accessor :instances
		@instances = 0
	end

	module InstanceMethods

		protected
		def register_instance
		  @instances += 1
		end
	end
end
