require 'pry'

# Create CashRegister class
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  # Initialize with 0 total and optional discount
  def initialize(discount = 0)
    @items = []
    @last_transaction = []
    @total = 0
    @discount = discount
  end

  # Return current total
  def total
    @total
  end

  # Return array of all added items
  def items
    @items
  end

  # Add price and quantity to total
  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times { @items << title }
    @last_transaction = [title, price, quantity]
  end

  # Calculate discount on total purchase and subtract from total
  def apply_discount
    @total = @total - ((@discount / 100.00) * @total)
    if @discount > 0
      message = "After the discount, the total comes to $#{@total.to_i}."
    else 
      message = "There is no discount to apply."
    end
  end

  # Remove last item
  def void_last_transaction
    add_item(@last_transaction[0], @last_transaction[1], -@last_transaction[2])
  end

end
