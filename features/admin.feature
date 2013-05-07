# language: en
Feature: Admin
	In order to use the admin pannel
	As an admin
	I want to use the menu, be able to manage categories and products
	
	Scenario: Navigate through the menu
		When I go to the admin page
		Then I see Home Products Categories
			And I'm on the Home page
		When I click on Home
		Then I'm on the Home page
			And I see Home Products Categories
		When I click on Products
		Then I'm on the Products page
			And I see Home Products Categories
		When I click on Categories
		Then I'm on the Categories page
			And I see Home Products Categories
	
	Scenario: Create, edit, update and delete categories
		# Create
		When I go to the admin page
		When I click on Categories
		Then I'm on the Categories page
			And I see Listing categories
			And I see Title
			And I see Products
		When I click on New Category
		Then I'm on the New Category page
			And I see Title
		When I fill in category_title with test
			And I click on Create Category
		Then I see Category was successfully created.
		When I click on Categories
			Then I see test

		# Edit
		When I click on the last Edit
			And I fill in category_title with test2
			And I click on Update Category
		Then I see Category was successfully updated.
		When I click on Back
			Then I'm on the Categories page
			And I see test2
		
		# Show
		When I click on the last Show
		Then I see test2
		
		# Destroy
		When I click on Destroy
		Then I'm on the Categories page
			And I don't see test2
		
	Scenario: Create, edit, update and delete products
		# Create
		Given a category
		When I go to the admin page
		Then I'm on the Home page
			And I see Listing products
			And I see Title
			And I see Categories
			And I see Price
		When I click on New Product
		Then I'm on the New Product page
			And I see Title
			And I see Description
			And I see Price
			And I see Photo
		When I fill in product_title with test
			And I fill in product_description with test area
			And I fill in product_price with 5
			And I fill in product_photo with http://stars85.s.t.pic.centerblog.net/o/45124325.jpg
			And I check MyString
			And I click on Create Product
		Then I see Product was successfully created.
		When I click on Products
			Then I see test

		# Edit
		When I click on the last Edit
			And I fill in product_title with test2
			And I fill in product_description with test area2
			And I fill in product_price with 2
			And I click on Update Product
		Then I see Product was successfully updated.
		When I click on Back
			Then I'm on the Products page
			And I see test2
		
		# Show
		When I click on the last Show
		Then I see Title: test2 Categories: MyString Description: test area2 Price: 2.0
		
		# Destroy
		When I click on Destroy
		Then I'm on the Products page
			And I don't see test2
