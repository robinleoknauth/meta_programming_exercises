class HTML
  def initialize(&block)
    instance_eval(&block)
  end

end
