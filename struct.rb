class ConStructor
  class << self
    def new(*properties, &block)
      klass = Class.new do
        @properties = properties
        attr_accessor *properties

        def initialize(*values)
          values.each_with_index do |value, index|
            send("#{self.class.properties[index]}=", value)
          end
        end

        def [](key)
          send key
        end

        def []=(key, new_value)
          send("#{key}=", new_value)
        end

        def self.properties
          @properties
        end

      end
      klass.class_eval(&block)
      klass
    end

  end
end


Product = ConStructor.new(:id, "name") do
  def to_s
    "<#{self.class} id:#{id} name:'#{name}'>"
  end
end
p Product.instance_methods(false)

pro = Product.new(123, "Ruby Book")
p pro
p pro.name
p pro.name = "different Book"
p pro["name"]
p pro.to_s
