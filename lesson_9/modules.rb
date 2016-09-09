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
#    base.extend Validation
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
end

module Validation
    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # @@validation_rules = {}
      def validate(name, type, *args) # Class method
        # Метод класса validate не должен определять методы для валидации. 
        # Он должен сохранять правила валидации (имя переменной, тип валиадции, аргументы валидации и т.п.) 
        # в хеше (в инстанс-переменной уровня класса )
        @@validation_rules[name] = []
        @@validation_rules[name] << {type: type, arg: args}
      end
    end

    module InstanceMethods
      @@validation_rules = {}
      @@foo = ''
      def validate! # Instance method
        # Инстанс-метод validate! затем читает эти правила из хеша и динамически вызывает (через send) методы валидации,
        # передавая туда значение переменной и параметры валидации
        @@validation_rules.keys.each do |k|
          @@validation_rules[k].each do |i|
            self.send(validate_"#{i[:type]}",[k, i[:arg]])
          end
        end
      end

      def valid?
        validate!
        true
        rescue
        false
      end

    private
      # Сами методы валидации - это приватные инстанс-методы, но они определяются не динамически, 
      # а статически прописаны в модуле, т.е. они имеют имя вроде validate_presence, validate_format и т.п. 
      # и принимают аргументы (значение и параметры валидации), делают проверку и если она не прошла, выбрасывают исключение.
      def validate_presence(name)
        raise "Error! Presence failed!" if name.nil? || name == ""
      end

      def validate_format(name, arg)
        raise "Error! Format failed!" if name !~ arg
      end

      def validate_type(name, arg)
        raise "Error! Type failed!" if name.class != arg
      end

    end
end
