class HTML
  def initialize(&block)
    instance_eval(&block)
  end

  def method_missing(name, *args)
  end

end


html = HTML.new do
  h1 "Headline"
  h3 "Smaller headline"
  text "Long stupid text. Bla bla bla. Bla bla bla. Bla bla bla. Bla bla bla."

end
