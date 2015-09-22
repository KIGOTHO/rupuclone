class Item < ActiveRecord::Base
  belongs_to :product
    has_many :order_items
end
