class Sale < ActiveRecord::Base
  attr_accessible :price, :quantity
  belongs_to :product
  belongs_to :order

  validates_presence_of :price, :quantity
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates :product, presence: true
end
