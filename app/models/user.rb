class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :display_name, :full_name
  validates :display_name, length: { minimum: 2, maximum: 32 }, allow_nil: true
  validates_presence_of :password, :email, :full_name, on: :create
  validates :email, uniqueness: true, email: true, on: :create
  validates :role, inclusion: { in: %w(admin user), :message => "%{value} is not a valid role" }, on: :save
  validates_format_of :full_name, without: /^$/, message: "can not be empty"
  before_save :default_values
  
  def default_values
    self.role ||= 'user'
  end
end
