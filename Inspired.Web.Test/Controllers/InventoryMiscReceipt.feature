Feature: InventoryMiscReceipt
	In order to add miscellaneous receipt
	As a admin or Inventory user

@mytag
Scenario: Inventory - Miscellaneous Receipt - User should be taken to login page if not logged in
	Given I am logged in
	When I try to access Miscellaneous Receipt
	Then Miscellaneous Receipt should be displayed

Scenario: Inventory - Miscellaneous Receipt - Generate Document Code
	When Document type is selected
	Then Generate new document code