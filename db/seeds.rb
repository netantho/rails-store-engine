# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: 'Living Room')
Category.create(title: 'Bathroom')
Category.create(title: 'Kitchen')
Category.create(title: 'Bedroom')
Category.create(title: 'Outdoors')

u = User.new(full_name: 'Franklin Webber', email: 'demoXX+franklin@jumpstartlab.com', password: 'password')
u.role = 'user'
u.save
u = User.new(full_name: 'Jeff', email: 'demoXX+jeff@jumpstartlab.com', password: 'password', display_name: 'j3')
u.role = 'user'
u.save
u = User.new(full_name: 'Steve Klabnik', email: 'demoXX+steve@jumpstartlab.com', password: 'password', display_name: 'SkrilleX')
u.role = 'admin'
u.save

Product.create(title: 'Sofa', description: 'Albert Sofa', price: 500, visible: true, categories: [Category.find_by_title('Living Room')])
Product.create(title: 'Media Storage', description: 'Media Storage Cabinet', price: 200, visible: true, categories: [Category.find_by_title('Living Room'), Category.find_by_title('Bedroom')])
Product.create(title: 'Artwork', description: 'Painted Pieced Woodwork', price: 399, visible: true, categories: [Category.find_by_title('Living Room'), Category.find_by_title('Bedroom')])
Product.create(title: 'Bar Cart', description: 'Cart Blanc', price: 600, visible: true, categories: [Category.find_by_title('Living Room')])
Product.create(title: 'Bookcase', description: 'Expedit Bookcase', price: 129, visible: true, categories: [Category.find_by_title('Living Room'), Category.find_by_title('Bedroom')])
Product.create(title: 'Shower Head', description: 'Color Changing Shower Head', price: 29, visible: true, categories: [Category.find_by_title('Bathroom')])
Product.create(title: 'Toilet', description: 'American Standard Toilet', price: 400, visible: true, categories: [Category.find_by_title('Bathroom')])
Product.create(title: 'Medecine Cabinet', description: 'Mirror Cabinet', price: 69.99, visible: true, categories: [Category.find_by_title('Bathroom')])
Product.create(title: 'Fry Pan', description: 'Round Fry Pan', price: 15.95, visible: true, categories: [Category.find_by_title('Kitchen')])
Product.create(title: 'Pot', description: 'Small Pot', price: 55, visible: true, categories: [Category.find_by_title('Kitchen')])
Product.create(title: 'Fry Pan', description: 'Round Fry Pan', price: 15.95, visible: true, categories: [Category.find_by_title('Kitchen')])
Product.create(title: 'Gas Rangetop', description: '36" Pro-Style Gas Rangetop with 6 Sealed Burners', price: 1500, visible: true, categories: [Category.find_by_title('Kitchen')])
Product.create(title: 'Dresser', description: 'Patchwork Dresser', price: 999, visible: true, categories: [Category.find_by_title('Bedroom')])
Product.create(title: 'Chest', description: '3-Drawer Chest', price: 349.91, visible: true, categories: [Category.find_by_title('Bedroom')])
Product.create(title: 'Bed', description: 'Platform Bed with Drawers', price: 1899, visible: true, categories: [Category.find_by_title('Bedroom')])

s1 = Sale.new(quantity: 1, price: 1899)
s1.product = Product.find_by_title('Bed')
s1.save
s2 = Sale.create(quantity: 1, price: 999)
s2.product = Product.find_by_title('Dresser')
s2.save
Order.create(status: 'pending', total_price: 2898, user: User.first)
