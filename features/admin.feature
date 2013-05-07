# language: en
Feature: Admin
	In order to navigate through the menu
	As an admin
	I want to see the link and be able to click on them
	
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
