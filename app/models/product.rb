class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :photo
  validates_presence_of :title, :description, :price
  validates_format_of :title, :without => /^$/, :message => "can not be empty"
  validates_format_of :description, :without => /^$/, :message => "can not be empty"
  validates_format_of :photo, :allow_blank => true, :with => URI::regexp(%w(http https)), :message => "should be an URL"
end
