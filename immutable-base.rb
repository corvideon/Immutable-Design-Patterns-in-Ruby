
class AbstractPerson

  attr_accessor :name, :address

  def initialize name, address
    @name = name
    @address = address
  end

end

class Address
  attr_accessor :line1, :line2, :line3

  def initialize line1, line2, line3
    @line1 = line1
    @line2 = line2
    @line3 = line3
  end

end

class MutablePerson < AbstractPerson
  # additional behaviour here...
end

class ImmutablePerson < AbstractPerson

  def initialize name, address
    super name, address
    self.freeze
    @address.freeze
  end

  def address
    return @address.clone
  end

end

address =  Address.new("Foo Street", "Bar Town", "Test County")

person1 =  MutablePerson.new("Foo McBar", address)
person1.address.line1 = "Bar Street"
puts person1.address.line1       # "Bar Street"

person2 =  ImmutablePerson.new("Bar McFoo", address)
person2.address.line1 = "Bar Street"  # error: can't modify frozen