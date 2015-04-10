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

Scenario: Inventory - Miscellaneous Receipt - Autocomplete item code textbox
	When Start typing Item Code in textbox
	Then Suggest list of Item Code based on text entered

Scenario: Inventory - Miscellaneous Receipt - Autocomplete warehouse textbox
	When Start typing warehouse in textbox
	Then Suggest list of warehouse based on text entered

Scenario: Inventory - Miscellaneous Receipt - If Serial flag of Item is false populate default serial number
	When Serial flag of item is false
	Then Enter default serial number

Scenario: Inventory - Miscellaneous Receipt - The data is saved 
	Given I am logged in user
	When I try to save the details entered in the Miscellaneous Receipt
	Then The Miscellaneous Receipt save succeeds