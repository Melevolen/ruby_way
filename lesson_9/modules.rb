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

module Task_9
  def self.included(base)
    base.extend Acessors
  end
  module Acessors
    def attr_accessor_with_history(*args)
      args.each do |i|
        var_name = "@#{i}".to_sym
        define_method(i) { instance_variable_get(var_name)}
        define_method ("#{i}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          if instance_variable_defined?("#{var_name}_h") == false
            instance_variable_set("#{var_name}_h", [value]) # if instance_variable_defined?("#{var_name}_h") == false 
          else
            instance_variable_get("#{var_name}_h") << value # if instance_variable_defined?("#{var_name}_h") == true
          end
        end
        define_method("#{i}_history".to_sym) { instance_variable_get("#{var_name}_h") }
      end
    end

    def strong_attr_accessor(var, var_class)
      var_s = "@#{var}".to_sym
      define_method(var) {instance_variable_get(var_s)}
      define_method("#{var}=".to_sym) do |value| 
        raise "Error! Wrong kind!" if value.class != var_class
        instance_variable_set(var_s, value)
      end
    end
  end

  module Validation
    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end
    module ClassMethods
      def validate(name, type, *args) # Class method
          @validate_rules = {name: "#{name}", type: "#{type}", args: "#{args}"}
          # presence: (raise "Error! Presence failed." if name.nil? || name == ""),
          # format: (raise "Error! Format failed." if name =~ /A-Z{0,3}/),
          # type: (raise "Error! Type failed." if name.class != RailwayStation)
      end
    end

    module InstanceMethods
      def validate! (name, type, *args) # Instance method
        begin
        # valid?

        self.send(validate_"#{@validate_rules["type"]}",@validate_rules["name"], @validate_rules["args"])

        # send.validate(name, 'format')
        # send.validate(naem, 'type')

        rescue RuntimeError => e
          puts "Validation not successful: #{e}"
        end
      end

      def validate_presence(name, *args)
        raise "Error! Presence failed." if name.nil? || name == ""
      end

      def validate_format(name, *args)
        raise "Error! Format failed." if name =~ /A-Z{0,3}/
      end

      def validate_type(name, *args)
        raise "Error! Type failed." if name.class != RailwayStation
      end

      def valid?
        true
        # false
      end
    end
  end
end
