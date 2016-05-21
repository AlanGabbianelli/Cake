class Item
  attr_reader :code, :name, :price

  def initialize(code: 001, name: 'Lavander heart', price: 9.25)
    @code = code
    @name = name
    @price = price
  end
end
