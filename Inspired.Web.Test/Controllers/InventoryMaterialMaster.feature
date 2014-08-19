Feature: InventoryMaterialMaster
	In order to add or edit Material details
	

@mytag
Scenario: Inventory - Material Master - User should be taken to the login page if not logged in
	Given I am not logged in user
	When I try to access the material master page
	Then The user should be taken to the login page  
	
Scenario: Inventory - Material Master - User should be displayed the material master list page
	Given I am a logged in user
	When I try to access the material master page
	Then The material master list page should be displayed

Scenario: Inventory - Material Master - User should be displayed the material lists jsonresult
	Given I am logged in user
	When The material master is displayed
	Then The material list result is displayed

Scenario: Inventory - Material Master - A exception is raised in the jsonresult
	Given I am logged in user
	When The material master is displayed and has incomplete category details	
	Then Material Master list page raises a json exception 

Scenario: Inventory - Material Master - User should be displayed the create material page
	Given I am logged in user
	When I try to access the create material page
	Then The Create material master page should be displayed

Scenario: Inventory - Material Master - User should be displayed the edit material page
	Given I am logged in user
	When I try to edit a material
	Then The edit material master page should be displayed


Scenario: Inventory - Material Master - The category description should be populated when the category code is entered
	Given I am logged in user
	When I try to enter an existing category code 
	Then The category description is populated
