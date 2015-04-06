Feature: InventoryLookupMaster
	In order to add or edit lookup items
	As a admin or Inventory user

@mytag
Scenario: Inventory - Lookup Master - User should be taken to login page if not logged in
	Given I not logged in
	When I try to access lookup master
	Then Login page should be displayed

Scenario: Inventory - Lookup Master - User should be displayed lookup master list page
	Given I am logged in
	When I try to access lookup master
	Then Lookup master screen should be displayed

Scenario: Inventory - Create Lookup Master - User should be displayed create lookup page.
	Given I am logged in
	When I Try to access create lookup
	Then Create/Edit lookup master page should be displayed

Scenario: Inventory - Edit Lookup Master - User should be displayed edit lookup page
	Given I not logged in
	When I try to access edit lookup
	Then Create/Edit lookup master page should be displayed

Scenario: Inventory - Create Lookup Master - User saves record
	Given I enter details of lookup
	When I click create button
	Then Details should be saved and I should be redirected to lookup list page

Scenario: Inventory - Create Lookup Master - Incomplete data returns an error - no lookup type selected
	Given I enter incomplete details of lookup with no lookup type
	When I click create button with no lookup type
	Then Edit/create page is displayed with error

Scenario: Inventory - Create Lookup Master - Incomplete data returns an error - no lookup description
	Given I enter incomplete details of lookup with no lookup description
	When I click create button with no lookup description
	Then Edit/create page is displayed with error

Scenario: Inventory - Edit Lookup Master - Incomplete data returns an error
	Given I enter incomplete details of lookup
	When I click save button
	Then Edit/create page is displayed with error message

Scenario: Inventory - Edit Lookup Master - User saves the record
	Given I edit details of a lookup
	When I click success save button 
	Then Details should be saved and I should be redirected to the lookup list page

Scenario: Inventory - Lookup Master - User should be displayed lookup lists jsonresult
	Given I am logged in user
	When Lookup master is displayed
	Then Lookup list result is displayed

Scenario: Inventory - Lookup Master - A exception is raised in jsonresult
	Given I am logged in user
	When Lookup master is displayed and has incomplete lookup details	
	Then json exception is raised




