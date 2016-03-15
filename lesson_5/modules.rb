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
#		@instances = 0
	end

	module InstanceMethods # Метод инстанса

		protected
		def register_instances
		  self.class.instances ||= 0 # Иициализирует переменную при первом экземпляре класса, те когда она еще не создана.
		  self.class.instances += 1 # Увеличивает значение переменной, обращаемся к переменной КЛАССА  "self.class.variable"
		end
	end
end
