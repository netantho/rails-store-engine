class Category < ActiveRecord::Base
  attr_accessible :title, :products
  validates_presence_of :title
  has_many :classifications, dependent: :destroy
  has_many :products, through: :classifications
  
  def to_s
    title
  end
end
