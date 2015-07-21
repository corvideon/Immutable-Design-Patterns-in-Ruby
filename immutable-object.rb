
class ImmutablePerson

  attr_reader :name

  def initialize name, date_of_birth, address
    @name = name
    @date_of_birth = date_of_birth
    @address = address
    self.freeze
  end

  def address
    return @address.clone
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


address =  Address.new("Foo Street", "Bar Town", "Test County")
person =  ImmutablePerson.new("Foo McBar", address)
puts person.name
puts person.address.line1             # 'Foo Street'
person.address.line1 = 'Bar Street'
puts person.address.line1             # still 'Foo Street'