class Klass
  def foo
    "foo"
  end
  alias_method :baz, :foo
end

k = Klass.new
puts k.foo == k.baz


def test(val)
  print val.to_i
rescue
  print 'rescued'
ensure
  puts ' & ensured'
end

test(1)
test([])
