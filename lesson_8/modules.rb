module Prod
  attr_accessor :factory
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods # Instance methods :)
    protected

    def register_instances
      self.class.instances ||= 0  # If variable not exist - create her with 0.
      self.class.instances += 1   # Increase class variable,
      # to CLASS variable - "self.class.variable"
    end
  end
end
