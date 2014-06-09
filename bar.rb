require 'time' # you're gonna need it

class Bar
  attr_reader :name, :menu_items
  attr_accessor :happy_discount

  def initialize(name)
    @name = name
    @menu_items = []
    @happy_discount = 0
  end

  def add_menu_item(name, price)
    menu_items << MenuItem.new(name, price)
  end

  def happy_discount
    happy_hour? ? @happy_discount : 0
  end

  def happy_discount=(discount)
    if discount > 1
      @happy_discount = 1
    elsif discount < 0
      @happy_discount = 0
    else
      @happy_discount = discount
    end
  end
 

  def happy_hour?
    hour = Time.now.hour
    if hour == 15
      true
    else
      false
    end
  end

  def get_price(drink_name)
    price = @menu_items.find { |drink| drink.name == drink_name }.price 
    happy_hour? ? price * 0.5 : price
  end

end

class MenuItem
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end


