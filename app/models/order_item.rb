class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :item
    

    def subtotal
       item.price_to.to_i * quantity.to_i
    end
    def total
      3142434  
    end
end
