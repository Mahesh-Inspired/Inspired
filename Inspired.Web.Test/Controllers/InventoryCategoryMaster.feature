Feature: InventoryCategoryMaster
	In order to add or edit categories used to group the items
	As a admin or Inventory user

@mytag
Scenario: Category Master - User should be taken to the login page if not logged in
	Given I am not logged in	
	When I try to access the category master
	Then The login page should be displayed

Scenario: Category Master - User should be displayed the category master page
	Given I am logged in user
	When I try to access the category master
	Then The Category master screen should be displayed


