require 'bigdecimal'
require 'bigdecimal/util'

class Item
  attr_reader :code, :name, :price

  def initialize(code: 001, name: 'Lavander heart', price: 9.25)
    @code = code
    @name = name
    @price = price.to_d
  end
end
