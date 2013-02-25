class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price
  validates_presence_of :title, :description, :price
  validates_format_of :title, :without => /^$/, :message => "can not be empty"
  validates_format_of :description, :without => /^$/, :message => "can not be empty"
end
