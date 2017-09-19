module DataAccessor
  attr_accessor :data

  def initialize
    @data = {}
  end

  def self.data_accessor(*args)
    args.each do |name|
      define_method(name) do
        data[name]
      end
      define_method("#{name}=") do |new_value|
        data[name] = new_value
      end
    end
  end

end
