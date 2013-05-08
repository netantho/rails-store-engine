# language: en
Feature: Admin
	In order to use the website
	As a user
	I want to use the menu, be able to view products and buy some
	
	Scenario: Navigate through the menu
		Given a category
		When I go to the root page
		Then I see Home Categories MyString Cart: 0 items Register Log in
		When I click on Home
		Then I'm on the Home page
			And I see Home Categories MyString Cart: 0 items Register Log in
		When I click on Cart: 0 items
		Then I'm on the Cart page
			And I see Home Categories MyString Cart: 0 items Register Log in
		When I click on Register
		Then I'm on the Register page
			And I see Home Categories MyString Cart: 0 items Register Log in
		When I click on Log in
		Then I'm on the Log in page
			And I see Home Categories MyString Cart: 0 items Register Log in

	Scenario: Not authorized to access admin pages
		When I go to the Admin page
		Then I see You must be an admin to access this section
			And I'm on the Home page
		When I go to the Admin Categories page
		Then I see You must be an admin to access this section
			And I'm on the Home page
		Given a user
		When I authentificate as a user
		Then I'm on the Home page
		When I go to the Admin page
		Then I see You must be an admin to access this section
			And I'm on the Home page
		When I go to the Admin Categories page
		Then I see You must be an admin to access this section
			And I'm on the Home page

	Scenario: Log in and Log out
		Given a user
		When I go to the root page
		Then I see Log in
		When I click on Log in
		Then I see Email
			And I see Password
		When I fill in email with user@example.com
			And I fill in password with toto
			And I click on Log in within form
		Then I see Logged in!
			And I see Logged as User
			And I'm on the Home page
		When I click on Logout
		Then I see Logged out!
			And I see Log in
			And I'm on the Home page

	Scenario: Register and login
		When I go to the root page
		Then I see Register
		When I click on Register
		Then I fill in user_email with toto@example.com
			And I fill in user_full_name with Toto
			And I fill in user_display_name with Super Toto
			And I fill in user_password with tata
			And I fill in user_password_confirmation with tata
		When I click on Create User
		Then I see Signed up!
			And I'm on the Home page	
		When I click on Log in
		Then I see Email
			And I see Password
		When I fill in email with toto@example.com
			And I fill in password with tata
			And I click on Log in within form
		Then I see Logged in!
			And I see Logged as Super Toto
			And I'm on the Home page
		When I click on Logout
		Then I see Logged out!
			And I see Log in
			And I'm on the Home page
	
	Scenario: Invalid user should not be able to login
		When I go to the root page
		Then I see Log in
		When I click on Log in
		Then I see Email
			And I see Password
		When I fill in email with eve@example.com
			And I fill in password with toto
			And I click on Log in within form
		Then I see Invalid email or password
			And I don't see Logged as Eve

	Scenario: Should see visible products
		Given a product
		Given a table product
		Given an unvisible chair
		Given a gift
		When I go to the root page
		Then I see Chair $50.5
			And I see MyString Gift $10.5
			And I see Table $100
			And I don't see Unvisible Chair
		When I click on MyString
		Then I see MyString Gift $10.5
			And I don't see Chair $50.5
			And I don't see Table $100
			And I don't see Unvisible Chair
		When I click on Gift
		Then I see Gift $10.5 Surprise! Add to Cart
			
	Scenario: Should be able to add products to cart
		Given a product
		Given a table product
		When I go to the root page
		Then I see Chair $50.5
			And I see Table $100
			And I see Cart: 0 items
		When I click on the 0th Add to Cart
		Then I see Cart: 1 items
		When I click on the 1th Add to Cart
		Then I see Cart: 2 items
		When I click on Cart: 2 items
		Then I see Price Quantity Total Chair Four chair legs $50.5 1 $50.5 Table Simple table $100.0 1 $100.0 $150.5 Empty your cart Buy
		When I click on the 0th icon icon-plus-sign icon-white
		Then I see Chair Four chair legs $50.5 2 $101.0 Table Simple table $100.0 1 $100.0 $201.0
		When I click on the 1th icon icon-minus-sign icon-white
		Then I see Chair Four chair legs $50.5 2 $101.0
		When I click on the 0th icon icon-minus-sign icon-white
		Then I see Chair Four chair legs $50.5 1 $50.5
		When I click on Chair
		Then I see Chair $50.5 Four chair legs Add to Cart
