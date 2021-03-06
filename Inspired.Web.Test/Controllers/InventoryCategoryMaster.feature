﻿Feature: InventoryCategoryMaster
	In order to add or edit categories used to group the items
	As a admin or Inventory user

@mytag
Scenario: Inventory - Category Master - User should be taken to the login page if not logged in
	Given I am not logged in	
	When I try to access the category master
	Then The login page should be displayed

Scenario: Inventory - Category Master - User should be displayed the category master list page
	Given I am logged in user
	When I try to access the category master
	Then The Category master screen should be displayed

Scenario: Inventory - Category Master - User should be displayed the category lists jsonresult
	Given I am logged in user
	When The category master is displayed
	Then The category list result is displayed

Scenario: Inventory - Category Master - A exception is raised in the jsonresult
	Given I am logged in user
	When The category master is displayed and has incomplete category details	
	Then An json exception is raised

Scenario: Inventory - Create Category Master - User should be displayed the create category page.
	Given I am logged in user
	When I Try to access the create category
	Then The Create/Edit category master page should be displayed

Scenario: Inventory - Edit Category Master - User should be displayed the edit category page
	Given I am not logged in
	When I try to access the edit category
	Then The Create/Edit category master page should be displayed

Scenario: Inventory - Create Category Master - User saves the record
	Given I enter the details of the category
	When I click the create button
	Then Details should be saved and I should be redirected to the category list page

Scenario: Inventory - Create Category Master - Incomplete data returns an error - no category code
	Given I enter incomplete details of the category
	When I click the create button
	Then The edit/create page is displayed with error message

Scenario: Inventory - Create Category Master - Incomplete data returns an error - no category description
	Given I enter incomplete details of the category with no category description
	When I click the create button
	Then The edit/create page is displayed with error message

Scenario: Inventory - Create Category Master - Category code already exist should display an error
	Given The category code already exist
	When I click the create button
	Then The edit/create page is displayed with error message

Scenario: Inventory - Edit Category Master - Incomplete data returns an error
	Given I enter incomplete details of the category
	When I click the save button
	Then The edit/create page is displayed with error message

Scenario: Inventory - Edit Category Master - User saves the record
	Given I edit the details of a category
	When I click the save button
	Then Details should be saved and I should be redirected to the category list page






