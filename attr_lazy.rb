module AttrLazy
  def attr_lazy(name, &block)
    instance_var_name = "@#{name.to_s.delete('?')}"
    define_method name do
      if instance_variable_defined?(instance_var_name)
        instance_variable_get(instance_var_name)
      else
        instance_variable_set(instance_var_name, instance_eval(&block))
      end
    end
  end
end
