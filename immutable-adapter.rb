class Person

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

class ImmutablePerson

  def initialize name, address
    @mutable_person = Person.new name, address
    @mutable_person.freeze
    @mutable_person.address.freeze
  end

  def name
    return @mutable_person.name
  end

  def address
    return @mutable_person.address
  end

end

address =  Address.new("Foo Street", "Bar Town", "Test County")

person1 =  Person.new("Foo McBar", address)
person1.address.line1 = "Bar Street"
puts person1.address.line1       # "Bar Street"

person2 =  ImmutablePerson.new("Bar McFoo", address)
person2.address.line1 = "Bar Street"  # error: can't modify frozen