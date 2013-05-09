class Order < ActiveRecord::Base
  attr_accessible :date_shipment, :status, :total_price, :sales, :user
  validates_presence_of :status, :total_price, :sales, :user
  validates_numericality_of :total_price, greater_than_or_equal_to: 0
  validates :status, inclusion: { in: ['pending', 'cancelled', 'paid', 'shipped', 'returned'] }
  has_many :sales
  belongs_to :user
end
