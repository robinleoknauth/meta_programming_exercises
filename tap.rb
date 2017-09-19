class Object
  def tab
    yield(self) if block_given?
    self
  end

  def tab2(&block)
    instance_eval(&block)
    self
  end

end

class MyClass
  def initialize
    @var = "instance var"
  end

  def foo
    "MyClass#foo"
  end
end
obj = MyClass.new
obj.tap2 { puts @var }.foo # Output: "instance var" returns: "MyClass#foo"
