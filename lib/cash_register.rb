
class CashRegister
  attr_accessor :total, :items, :inventory_map
  attr_reader :discount_is, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @discount_is = 1-(self.discount * 0.01)
    @items = []
    @inventory_map = {}
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    self.inventory_map[title] = price * quantity
    for i in 1..quantity
      @items << title
    end
  end

  def apply_discount
    if self.discount > 0
      self.total *= self.discount_is
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    remove = self.items.pop
    self.total -= (self.inventory_map[remove]*discount_is)
    self.inventory_map.delete(remove)
  end
end