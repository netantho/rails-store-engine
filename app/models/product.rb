class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :photo
  validates_presence_of :title, :description, :price
  validates_format_of :title, :without => /^$/, :message => "can not be empty"
  validates_format_of :description, :without => /^$/, :message => "can not be empty"
  validates_format_of :photo, :allow_blank => true, :with => URI::regexp(%w(http https)), :message => "should be an URL"
  has_many :categories, through: :classifications

  def to_s
    title
  end
  
  def tag_list
    return self.tags.join(", ")
  end
  
  def tag_list=(tags_string)
    self.taggings.destroy_all
    
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    
    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name)
      tagging = self.taggings.new # self = this article
      tagging.tag_id = tag.id
    end
  end
end
