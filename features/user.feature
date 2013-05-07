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
	
	Scenario: invalid user should not be able to login
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
