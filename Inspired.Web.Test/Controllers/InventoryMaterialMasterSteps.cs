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

        [BeforeScenario()]
        public void Setup()
        {
            baseController = new BaseControllerTest();
            baseController.InitializeBase();
            invController = new InventoryController(baseController.UnitOfWork, baseController.UserIdentity);
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
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });   
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
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });   
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            Inv_MaterialCategory invMatlCat = new Inv_MaterialCategory() { Category_Id = 12, Category_Type = 1, Id = 1, Item_Id = 1 };
            Inv_MaterialSpecification invSpecs = new Inv_MaterialSpecification() { Id = 1, Spec_Id = 1, Spec_Value = "Test" };
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

    }
}
