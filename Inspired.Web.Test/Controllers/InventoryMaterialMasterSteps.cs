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
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            Inv_MaterialCategory invMatlCat = new Inv_MaterialCategory() { Category_Id = 12, Category_Type = 1, Id = 1, Item_Id = 1 };
            Inv_MaterialMaster invMaterial = new Inv_MaterialMaster() { Id = 1, Code = "Item1", Description = "Description", Inv_MaterialCategory = new List<Inv_MaterialCategory> { invMatlCat } };
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
            result = invController.fetchCategoryJSON(2, "TEST");
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
            result = invController.fetchCategoryJSON(2, "TEST");
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

    }
}
