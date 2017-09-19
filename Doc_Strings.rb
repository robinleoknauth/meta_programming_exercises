module DocStrings
  attr_accessor :pending_doc_string

  def doc(doc_string)
    install_hooks!
    self.pending_doc_string = doc_string
  end

  def doc_string(method_name)
    doc_strings[method_name]
  end

  def install_hooks!
    unless @hooks_installed
      class_eval do
        def self.method_added(method_name)
          apply_pending!(method_name)
          super
        end
      end
    end
    @hooks_installed = true
  end

  def apply_pending!(method_name)
    if pending_doc_string
      doc_strings[method_name] = pending_doc_string
      self.pending_doc_string = nil
    end
  end

end
