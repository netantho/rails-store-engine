class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :photo, :visible, :categories
  validates_presence_of :title, :description, :price
  validates :title, uniqueness: true, allow_blank: false
  validates_format_of :description, without: /^$/, message: "can not be empty"
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates_format_of :photo, allow_blank: true, with: URI::regexp(%w(http https)), message: "should be an URL"
  validates :visible, inclusion: { in: [true, false] }
  has_many :categories, through: :classifications
  has_many :classifications

  scope :visible, lambda { where(visible: true) }

  def to_s
    title
  end
end
