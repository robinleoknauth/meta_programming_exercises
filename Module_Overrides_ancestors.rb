module ModuleOverrides
  def ancestors
    m = method(__method__)
    puts "method_name: #{m.name}, owner: #{m.owner}"
    puts "source_location #{m.source_location}"
    puts "super_method: #{m.super_method}"
    super
  end
end

class Module
  prepend ModuleOverrides
end
