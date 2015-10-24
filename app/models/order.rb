class Order < ActiveRecord::Base
has_many :order_items, dependent: :destroy
    def subtotals
  order_items.map do |i| i.subtotal end
end

 def total
  subtotals.sum
end
end
