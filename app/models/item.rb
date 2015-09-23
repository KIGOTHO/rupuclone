class Item < ActiveRecord::Base
  belongs_to :product
  has_many :order_items
    
    validates_numericality_of :price_to
    validates_numericality_of :price_from
    validates_numericality_of :price_save
end
