using System;
using TechTalk.SpecFlow;
using Rhino.Mocks;
using Inspired.Web.Controllers;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Inspired.Data;
using System.Collections.Generic;
using Inspired.Web.ViewModel;
using Inspired.Web.Test.Code;
using Inspired.Web.Test.Model;

namespace Inspired.Web.Test.Controllers
{
    [Binding]
    public class InventoryMaterialMasterSteps
    {
        BaseControllerTest baseController;
        InventoryController invController;
        ActionResult result;
        FormCollection collection;
        String errorMessage;
        Inv_MaterialMaster invMastTest;
        Gen_LookupItem lookupStatus;
        Gen_LookupItem lookupCategoryType;
        Gen_LookupItem lookupAltRelative;
        Gen_LookupItem lookupSpecGroup;
        Gen_LookupItem lookupForeignCurrency;
        Gen_LookupItem lookupNotesType;
        Gen_LookupItem lookupNotesPriority;

        [BeforeScenario()]
        public void Setup()
        {
            baseController = new BaseControllerTest();
            baseController.InitializeBase();
            invController = new InventoryController(baseController.UnitOfWork, baseController.UserIdentity);
            invMastTest = new Inv_MaterialMaster() { Id = 1, Description = "Test Desc", Code = "Test" };
            invMastTest.Inv_MaterialCategory = new List<Inv_MaterialCategory>() { new Inv_MaterialCategory() { Category_Id = 1, Category_Type = 1, Company_Id = 1, Item_Id=1 } };
            invMastTest.Inv_MaterialSpecification = new List<Inv_MaterialSpecification>() { new Inv_MaterialSpecification() { Company_Id = 1, Id = 2, Item_Id = 1 } };
            invMastTest.Inv_MaterialPackaging = new List<Inv_MaterialPackaging>() { new Inv_MaterialPackaging() { Box_Number = 1, Item_Id = 1 } };
            invMastTest.MaterialSpares = new List<Inv_MaterialSpares>() { new Inv_MaterialSpares() { Item_Id = 1, Spare_Id = 2 } };
            invMastTest.AlternateRelativeItemCollection = new List<Inv_MaterialAlternateRelative>() { new Inv_MaterialAlternateRelative() { Item_Id=1, AR_Flag=1, AR_Item_Id=2 } };
            invMastTest.Inv_MaterialSupplier = new List<Inv_MaterialSupplier>() { new Inv_MaterialSupplier() { Item_Id = 1, Company_Id = 1, Supplier_Code = 2 } };
            invMastTest.Inv_MaterialNotes = new List<Inv_MaterialNotes>() { new Inv_MaterialNotes() { Item_Id = 1, Entry_date = DateTime.Now, Notes = "TEST" } };

            lookupStatus = new Gen_LookupItem() { Id = 1, Description = "Test Status", LookupType_Id = 1 };
            lookupCategoryType = new Gen_LookupItem() { Id = 2, Description = "Test Category Type", LookupType_Id = 2 };
            lookupAltRelative = new Gen_LookupItem() { Id = 3, Description = "Alternate", LookupType_Id = 3 };
            lookupSpecGroup = new Gen_LookupItem() { Id = 4, Description = "Spec group", LookupType_Id = 4 };
            lookupForeignCurrency = new Gen_LookupItem() { Id = 5, Description = "GBP", LookupType_Id = 5 };
            lookupNotesType = new Gen_LookupItem() { Id = 6, Description = "Critical", LookupType_Id = 6 };
            lookupNotesPriority = new Gen_LookupItem() { Id = 7, Description = "Critical", LookupType_Id = 7 };
            //invController.ControllerContext = new ControllerContext(baseController.HttpContext, baseController.RouteData, invController);
        }

        [Given(@"I am not logged in user")]
        public void GivenIAmNotLoggedInUser()
        {
            
        }
        [Given(@"I am a logged in user")]
        public void GivenIAmLoggedInUser()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            

        }

        [When(@"I try to access the material master page")]
        public void WhenITryToAccessTheMaterialMasterPage()
        {
            Inv_MaterialMaster invMatl = new Inv_MaterialMaster { Id = 1, Code = "TEST", Description = "Item Description", Status = "A"};
            baseController.MaterialMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_MaterialMaster> { invMatl });

            result = invController.MaterialList();
        }

        [Then(@"The user should be taken to the login page")]
        public void ThenTheUserShouldBeTakenToTheLoginPage()
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("Login"));
        }

        [Then(@"The material master list page should be displayed")]
        public void ThenTheMaterialMasterListPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }       

        [When(@"I try to access the create material page")]
        public void WhenITryToAccessTheCreateMaterialPage()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { lookupStatus, lookupCategoryType, lookupAltRelative, lookupSpecGroup, lookupForeignCurrency, lookupNotesPriority, lookupNotesType });
            result = invController.CreateMaterial();
        }

        [Then(@"The Create material master page should be displayed")]
        public void ThenTheCreateMaterialMasterPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(MaterialViewModel));
        }

        [When(@"I try to edit a material")]
        public void WhenITryToEditAMaterial()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { lookupStatus, lookupCategoryType, lookupAltRelative, lookupSpecGroup, lookupForeignCurrency, lookupNotesPriority, lookupNotesType });
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            Inv_MaterialCategory invMatlCat = new Inv_MaterialCategory() { Category_Id = 12, Category_Type = 4, Id = 1, Item_Id = 1 };
            Inv_MaterialSpecification invSpecs = new Inv_MaterialSpecification() { Id = 1, Spec_Id = 3, Spec_Value = "Test" };
            Inv_MaterialMaster invMaterial = new Inv_MaterialMaster() { Id = 1, Code = "Item1", Description = "Description", Inv_MaterialCategory = new List<Inv_MaterialCategory> { invMatlCat }, Inv_MaterialSpecification = new List<Inv_MaterialSpecification> { invSpecs } };
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster> { invMaterial });
            
            result = invController.EditMaterial(1);
        }

        [Then(@"The edit material master page should be displayed")]
        public void ThenTheEditMaterialMasterPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(MaterialViewModel));
        }

        [When(@"I try to enter an existing category code")]
        public void WhenITryToEnterAnExistingCategoryCode()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST Description", Code = "TEST" };
            baseController.InvCategoryRepository.Expect(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            result = invController.FetchCategoryJSON(2, "TEST");
        }

        [Then(@"The category description is populated")]
        public void ThenTheCategoryDescriptionIsPopulated()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel.ContainsKey("id"));
            Assert.IsTrue(jsonTopLevel.ContainsKey("CategoryDescription"));
        }

        [When(@"I enter an invalid category code")]
        public void WhenIEnterAnInvalidCategoryCode()
        {
            //Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST Description", Code = "TEST" };
            baseController.InvCategoryRepository.Expect(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { });
            result = invController.FetchCategoryJSON(2, "TEST");
        }

        [Then(@"Enter a valid category code error should be displayed")]
        public void ThenEnterAValidCategoryCodeErrorShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var data = jsonResult.ConvertToObjectDictionary();
            Assert.AreEqual(false, data["success"]);
            Assert.AreEqual("Enter a valid Category details", data["Message"]);
            
        }
        [When(@"I try to enter an invalid specification")]
        public void WhenITryToEnterAnInvalidSpecification()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { } );
            result = invController.FetchSpecJSON(1);
        }

        [Then(@"Enter a valid specification error message is displayed")]
        public void ThenEnterAValidSpecificationErrorMessageIsDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["success"].ToString() == "False");
        }
        [When(@"I try to enter a valid specification")]
        public void WhenITryToEnterAValidSpecification()
        {
            Gen_LookupGroup lookupGroup = new Gen_LookupGroup() { Id = 1, Description = "Test Group" };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test", Gen_LookupGroup = lookupGroup } });
            result = invController.FetchSpecJSON(1);
        }

        [Then(@"The call succeeds and return group details for the specification")]
        public void ThenTheCallSucceedsAndReturnGroupDetailsForTheSpecification()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["success"].ToString() == "True");
            Assert.IsTrue(jsonTopLevel["SpecGroup"].ToString() == "Test Group");
        }
        [When(@"I try to enter a valid item code")]
        public void WhenITryToEnterAValidItemCode()
        {
            Inv_MaterialMaster invMatl = new Inv_MaterialMaster() { Id = 1, Code = "TEST", Description = "TEST Description" };
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() { invMatl });
            result = invController.FetchItemDescJSON("TEST");
        }

        [Then(@"The call succeeds and return description and id of the item")]
        public void ThenTheCallSucceedsAndReturnDescriptionAndIdOfTheItem()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() == "1");
            Assert.IsTrue(jsonTopLevel["ItemDescription"].ToString() == "TEST Description");
        }
        [When(@"I try to enter a invalid item code")]
        public void WhenITryToEnterAInvalidItemCode()
        {
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() { });
            result = invController.FetchItemDescJSON("TEST");
        }

        [Then(@"The call succeeds and returns id as zero and blank description of the item")]
        public void ThenTheCallSucceedsAndReturnsIdAsZeroAndBlankDescriptionOfTheItem()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() == "0");
            Assert.IsTrue(jsonTopLevel["ItemDescription"].ToString() == "");
        }

        [When(@"I try to save the details entered in the material master")]
        public void WhenITryToSaveTheDetailsEnteredInTheMaterialMaster()
        {
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() { invMastTest });
            Gen_LookupGroup lookupGroup = new Gen_LookupGroup() { Id = 1, Description = "Test Group" };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test", Gen_LookupGroup = lookupGroup } });
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST Description", Code = "TEST" };
            baseController.InvCategoryRepository.Expect(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> {invCat });
        //    MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithBlankData();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithMaterialMasterDetails();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithItemSpecification();
            MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithItemNotes();
           result= invController.SaveMaterial(matlSubmit);
        }

        [When(@"I try to create a new material")]
        public void WhenITryToCreateANewMaterial()
        {
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() {  });
            Gen_LookupGroup lookupGroup = new Gen_LookupGroup() { Id = 1, Description = "Test Group" };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test", Gen_LookupGroup = lookupGroup } });
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST Description", Code = "TEST" };
            baseController.InvCategoryRepository.Expect(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            //    MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithBlankData();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithMaterialMasterDetails();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithItemSpecification();
            MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithItemNotes(true);
            result = invController.SaveMaterial(matlSubmit);
        }

        [When(@"I try to edit the details and enter a new spare item which doesnt exist")]
        public void WhenITryToEditTheDetailsAndEnterANewSpareItemWhichDoesntExist()
        {
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() { invMastTest });
            Gen_LookupGroup lookupGroup = new Gen_LookupGroup() { Id = 1, Description = "Test Group" };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test", Gen_LookupGroup = lookupGroup } });
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST Description", Code = "TEST" };
            baseController.InvCategoryRepository.Expect(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            //    MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithBlankData();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithMaterialMasterDetails();
            //MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithItemSpecification();
            MaterialSubmitModel matlSubmit = MaterialMasterSubmit.BuildWithNewItemSpares();
            
            result = invController.SaveMaterial(matlSubmit);
        }
        


        [Then(@"The material master save succeeds")]
        public void ThenTheCallSucceeds()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["success"].ToString().ToLower() == "true");            
        }


        [When(@"I enter a valid user id")]
        public void WhenIEnterAValidUserId()
        {
            baseController.UserRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_UserMaster>() { new Gen_UserMaster() {Id=1,UserName="TEST" } });
            result = invController.FetchUserDetails("Test");

        }

        [Then(@"The call succeeds and return the user details")]
        public void ThenTheCallSucceedsAndReturnTheUserDetails()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() != "0");
            Assert.IsTrue(jsonTopLevel["code"].ToString() == "TEST");
        }

        [When(@"I enter an invalid user id")]
        public void WhenIEnterAnInvalidUserId()
        {
            baseController.UserRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_UserMaster>() { });
            result = invController.FetchUserDetails("Test");

        }

        [Then(@"The call doen't succeed and return blank code")]
        public void ThenTheCallDoenTSucceedAndReturnBlankCode()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() == "0");
            Assert.IsTrue(jsonTopLevel["code"].ToString() == "");
        }


        [When(@"I enter a valid account code")]
        public void WhenIEnterAValidAccountCode()
        {
            baseController.AccountMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<FAS_AccountMaster>() { new FAS_AccountMaster(){ Accd_Key=1, Acc_Code="Code", Acc_Description="Description"} });
            result = invController.FetchAccountDetails("", "Test");
        }

        [Then(@"The call succeeds and return the account details")]
        public void ThenTheCallSucceedsAndReturnTheAccountDetails()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() != "0");
            Assert.IsTrue(jsonTopLevel["code"].ToString() == "Code");
        }

        [When(@"I enter a valid account description")]
        public void WhenIEnterAValidAccountDescription()
        {
            baseController.AccountMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<FAS_AccountMaster>() { new FAS_AccountMaster() { Accd_Key = 1, Acc_Code = "Code", Acc_Description = "Description" } });
            result = invController.FetchAccountDetails("Test", "");
        }

        [When(@"I enter an invalid account description")]
        public void WhenIEnterAnInValidAccountDescription()
        {
            baseController.AccountMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<FAS_AccountMaster>() { });
            result = invController.FetchAccountDetails("Test", "");
        }

        [Then(@"The call doesn't succeed and return blank code")]
        public void ThenTheCallDoesntSucceedAndReturnBlankCode()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["id"].ToString() == "0");
            Assert.IsTrue(jsonTopLevel["code"].ToString() == "");
        }


    }
}
