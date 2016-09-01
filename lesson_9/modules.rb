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
        # name = pirojok, type = [{"type": "presence", "arg": 123}, {"type": "format", "arg": 123}]
        # if type.is_a?(Array)
        #   @validate_rules = type
        # end
        #  @validate_rules = {name: name, type: [type], args: [args]}

          @validate_rules = {name: []} 
          @validate_rules[name] << [type, args]
          # presence: (raise "Error! Presence failed." if name.nil? || name == ""),
          # format: (raise "Error! Format failed." if name =~ /A-Z{0,3}/),
          # type: (raise "Error! Type failed." if name.class != RailwayStation)
      end
      def validate_rules
        @validate_rules
      end

      def validate_presence(name, arg)
        if name.nil? || name == ""
          print "Error! Presence failed." 
          return false
        end
        return true
      end

      def validate_format(name, arg)
        if name =~ arg
          print "Error! Format failed." 
          return false
        end
        return true
      end

      def validate_type(name, arg)
        if name.class != arg
          print "Error! Type failed."
          return false
        end
        return true
      end
    end

    module InstanceMethods
      def validate! # Instance method
        # begin
          @validate_rules.each do |name, v|
            #v = ["format", "/^1/"] true
            #v = [[{"type"}{"type"}], ["1"]] false
            @validate_rules[name][v[2]] << self.send("validate_#{v[0]}", v[1])
          end

        rescue RuntimeError => e
          puts "Validation not successful: #{e}"
        # end
      end

      def valid?
        @validate_rules.map {|name, v| v[2]}.all?{|e| e == true}
      end
      
    end
  end
end
