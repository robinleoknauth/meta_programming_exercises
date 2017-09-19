module DocStrings
  attr_accessor :pending_doc_string

  def doc(doc_string)
    install_hooks!
    self.pending_doc_string = doc_string
  end

  def doc_string(method_name)
    doc_strings[method_name]
  end




end
