class Category < ActiveRecord::Base
  attr_accessible :title, :products
  validates :title, presence: true, allow_blank: false
  has_many :classifications, dependent: :destroy
  has_many :products, through: :classifications
  
  def to_s
    title
  end
end
