module Other
# class Other
  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def Other.altered()
  # def altered()
    puts "OTHER altered()"
  end
end

class Child
  include Other
  # def initialize()
  #   @other = Other.new()
  # end
  #
  # def implicit()
  #   @other.implicit()
  # end

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE altered()"
    # @other.altered()
    Other.altered()
    puts "CHILD, AFTER altered()"
  end
end

son = Child.new()

son.implicit()
son.override()
son.altered()
