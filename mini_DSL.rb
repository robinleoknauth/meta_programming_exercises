class HTML
  def initialize(&block)
    @rendered_html = []
    instance_eval(&block)
  end

  undef p

  def method_missing(name, *args)
    @rendered_html << "<#{name}><#{args[0]}></#{name}>"
  end

  def render
    @rendered_html
  end

end


html = HTML.new do
  h1 "Headline"
  h3 "Smaller headline"
  p "Long stupid text. Bla bla bla. Bla bla bla. Bla bla bla. Bla bla bla."
  
end

puts html.render
