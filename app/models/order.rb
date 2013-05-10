class Order < ActiveRecord::Base
  attr_accessible :date_shipment, :status, :total_price, :sales, :user
  validates_presence_of :status, :total_price, :sales, :user
  validates_numericality_of :total_price, greater_than_or_equal_to: 0
  validates :status, inclusion: { in: ['pending', 'cancelled', 'paid', 'shipped', 'returned'] }
  has_many :sales
  belongs_to :user

  scope :pending, lambda { where(status: 'pending') }
  scope :cancelled, lambda { where(status: 'cancelled') }
  scope :paid, lambda { where(status: 'paid') }
  scope :shipped, lambda { where(status: 'shipped') }
  scope :returned, lambda { where(status: 'returned') }
end
