# language: en
Feature: Admin
	In order to use the admin pannel
	As an admin
	I want to use the menu, be able to manage categories and products
	
	Scenario: Navigate through the menu
		Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I see Admin StoreEngine Website Dashboard Products Categories Logged as Admin Logout
			And I'm on /admin/dashboard
		When I click on Dashboard
		Then I see Admin StoreEngine Website Dashboard Products Categories Logged as Admin Logout
			And I'm on /admin/dashboard
		When I click on Categories
		Then I'm on the Admin Categories page
			And I see Admin StoreEngine Website Dashboard Products Categories Logged as Admin Logout
		When I click on Products
		Then I'm on the Admin Products page
			And I see Admin StoreEngine Website Dashboard Products Categories Logged as Admin Logout
	
	Scenario: Create, edit, update and delete categories
		Given an admin
		When I authentificate as an admin
			And I click on Admin
		
		# Create
		When I go to the Admin page
		When I click on Categories
		Then I'm on the Admin Categories page
			And I see Title
			And I see Products
		When I click on New Category
		Then I'm on the Admin New Category page
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
			Then I'm on the Admin Categories page
			And I see test2
		
		# Show
		When I click on the last Show
		Then I see test2
		
		# Destroy
		When I click on Destroy
		Then I'm on the Admin Categories page
			And I don't see test2
		
	Scenario: Create, edit, update and delete products
		Given an admin
		When I authentificate as an admin
			And I click on Admin
		
		# Create
		Given a category
		When I go to the Admin page
		Then I'm on the Admin Products page
			And I see Title
			And I see Categories
			And I see Price
		When I click on New Product
		Then I'm on the Admin New Product page
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
			And I should see the icon icon-eye-close
			And I should not see the icon icon-eye-open
		When I click on icon icon-eye-close
		Then I see test
			And I should see the icon icon-eye-open
			And I should not see the icon icon-eye-close
		When I click on icon icon-eye-open
		Then I see test
			And I should see the icon icon-eye-close
			And I should not see the icon icon-eye-open

		# Edit
		When I click on the last Edit
			And I fill in product_title with test2
			And I fill in product_description with test area2
			And I fill in product_price with 2
			And I check product_visible
			And I click on Update Product
		Then I see Product was successfully updated.
		When I click on Back
			Then I'm on the Admin Products page
			And I should see the icon icon-eye-open
			And I should not see the icon icon-eye-close
		
		# Show
		When I click on the last Show
		Then I see Title: test2 Categories: MyString Description: test area2 Price: 2.0 Visible: true
		
		# Destroy
		When I click on Destroy
		Then I'm on the Admin Products page
			And I don't see test2

	Scenario: dashboard with a pending order
	    Given an order
	    Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I'm on /admin/dashboard
			And I see Pending (1) Cancelled (0) Paid (0) Shipped (0) Returned (0)
			And I see User $1.5
		When I go to /admin/dashboard/1/ship
		Then I see Order must be paid
		When I go to /admin/dashboard/1/return
		Then I see Order must be shipped
		When I click on Details
		Then I'm on /admin/dashboard/1
			And I see Status: pending Cancel
			And I don't see Mark as returned
			And I don't see Mark as shipped
			And I see Customer: User (user@example.com)
			And I see Chair Four chair legs $1.5 1 $1.5 $1.5
		When I click on icon icon-plus-sign icon-white
			And I click on icon icon-plus-sign icon-white
		Then I see Chair Four chair legs $1.5 3 $4.5 $4.5
		When I click on icon icon-minus-sign icon-white
		Then I see Chair Four chair legs $1.5 2 $3.0 $3.0
		When I click on Cancel
		Then I'm on /admin/dashboard
			And I see Order is now cancelled
			And I see Pending (0) Cancelled (1) Paid (0) Shipped (0) Returned (0)

	Scenario: dashboard with a cancelled order
	    Given a cancelled order
	    Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I'm on /admin/dashboard
			And I see Pending (0) Cancelled (1) Paid (0) Shipped (0) Returned (0)
			And I see User $1.5
		When I go to /admin/dashboard/1/cancel
		Then I see Order must be pending
		When I go to /admin/dashboard/1/ship
		Then I see Order must be paid
		When I go to /admin/dashboard/1/return
		Then I see Order must be shipped
		When I click on Details
		Then I'm on /admin/dashboard/1
			And I see Status: cancel
			And I don't see Status: cancelled Cancel
			And I don't see Mark as returned
			And I don't see Mark as shipped
			And I see Customer: User (user@example.com)
			And I see Chair Four chair legs $1.5 1 $1.5 $1.5

	Scenario: dashboard with a paid order
	    Given a paid order
	    Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I'm on /admin/dashboard
			And I see Pending (0) Cancelled (0) Paid (1) Shipped (0) Returned (0)
			And I see User $1.5
		When I go to /admin/dashboard/1/cancel
		Then I see Order must be pending
		When I go to /admin/dashboard/1/return
		Then I see Order must be shipped
		When I click on Details
		Then I'm on /admin/dashboard/1
			And I see Status: paid Mark as shipped
			And I don't see Status: paid Cancel
			And I don't see Mark as returned
			And I see Customer: User (user@example.com)
			And I see Chair Four chair legs $1.5 1 $1.5 $1.5
		When I click on icon icon-plus-sign icon-white
			And I click on icon icon-plus-sign icon-white
		Then I see Chair Four chair legs $1.5 3 $4.5 $4.5
		When I click on icon icon-minus-sign icon-white
		Then I see Chair Four chair legs $1.5 2 $3.0 $3.0
		When I click on Mark as shipped
		Then I'm on /admin/dashboard
			And I see Order is now shipped
			And I see Pending (0) Cancelled (0) Paid (0) Shipped (1) Returned (0)

	Scenario: dashboard with a shipped order
	    Given a shipped order
	    Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I'm on /admin/dashboard
			And I see Pending (0) Cancelled (0) Paid (0) Shipped (1) Returned (0)
			And I see User $1.5
		When I go to /admin/dashboard/1/cancel
		Then I see Order must be pending
		When I go to /admin/dashboard/1/ship
		Then I see Order must be paid
		When I click on Details
		Then I'm on /admin/dashboard/1
			And I see Status: shipped
			And I don't see Status: shipped Cancel
			And I see Mark as returned
			And I don't see Mark as shipped
			And I see Customer: User (user@example.com)
			And I see Chair Four chair legs $1.5 1 $1.5 $1.5
		When I click on Mark as returned
		Then I'm on /admin/dashboard
			And I see Order is now returned
			And I see Pending (0) Cancelled (0) Paid (0) Shipped (0) Returned (1)

	Scenario: dashboard with a returned order
	    Given a returned order
	    Given an admin
		When I authentificate as an admin
			And I click on Admin
		Then I'm on /admin/dashboard
			And I see Pending (0) Cancelled (0) Paid (0) Shipped (0) Returned (1)
			And I see User $1.5
		When I go to /admin/dashboard/1/cancel
		Then I see Order must be pending
		When I go to /admin/dashboard/1/ship
		Then I see Order must be paid
		When I go to /admin/dashboard/1/return
		Then I see Order must be shipped
		When I click on Details
		Then I'm on /admin/dashboard/1
			And I see Status: returned
			And I don't see Status: returned Cancel
			And I don't see Mark as returned
			And I don't see Mark as shipped
			And I see Customer: User (user@example.com)
			And I see Chair Four chair legs $1.5 1 $1.5 $1.5
