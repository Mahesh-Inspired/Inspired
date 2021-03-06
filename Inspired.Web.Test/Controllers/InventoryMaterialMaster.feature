﻿Feature: InventoryMaterialMaster
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

Scenario: Inventory - Material Master - An error is raised when invalid category code is entered
	Given I am logged in user
	When I enter an invalid category code
	Then Enter a valid category code error should be displayed

Scenario: Inventory - Material Master - The specification displays an error message when the specification is not selected
	Given I am logged in user
	When I try to enter an invalid specification
	Then Enter a valid specification error message is displayed

Scenario: Inventory - Material Master - The specification group is populated when the specification is selected
	Given I am logged in user
	When I try to enter a valid specification
	Then The call succeeds and return group details for the specification

Scenario: Inventory - Material Master - The item description and id are returned when the item code is passed
	Given I am logged in user
	When I try to enter a valid item code
	Then The call succeeds and return description and id of the item

Scenario: Inventory - Material Master - The item description and id are blank and zero when invalid item code is passed
	Given I am logged in user
	When I try to enter a invalid item code
	Then The call succeeds and returns id as zero and blank description of the item

Scenario: Inventory - Material Master - The data is saved 
	Given I am logged in user
	When I try to save the details entered in the material master
	Then The material master save succeeds

Scenario: Inventory - Material Master - New Item is created
	Given I am logged in user
	When I try to create a new material
	Then The material master save succeeds

Scenario: Inventory - Material Master - Modify an existing item
	Given I am logged in user
	When I try to edit the details and enter a new spare item which doesnt exist
	Then The material master save succeeds

Scenario: Inventory - Material Master - User details are populated when a valid user id is entered
	Given I am logged in user
	When I enter a valid user id
	Then The call succeeds and return the user details

Scenario: Inventory - Material Master - Blank user details are returned if the user id is invalid
	Given I am logged in user
	When I enter an invalid user id
	Then The call doen't succeed and return blank code

Scenario: Inventory - Material Master - Account details are populated when a valid account code is entered
	Given I am logged in user
	When I enter a valid account code
	Then The call succeeds and return the account details

Scenario: Inventory - Material Master - Account details are populated when a valid account description is entered
	Given I am logged in user
	When I enter a valid account description
	Then The call succeeds and return the account details

Scenario: Inventory - Material Master - A blank account details is returned if an invalid account is entered
	Given I am logged in user
	When I enter an invalid account description
	Then The call doesn't succeed and return blank code