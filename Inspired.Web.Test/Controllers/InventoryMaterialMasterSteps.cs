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

        [When(@"The material master is displayed")]
        public void WhenTheMaterialMasterIsDisplayed()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster { Id = 1, Description = "DESC" };
            Inv_MaterialCategory invMatlCat = new Inv_MaterialCategory { Category_Type = 12, Inv_CategoryMaster = invCat };
            List<Inv_MaterialCategory> lstMatlCat = new List<Inv_MaterialCategory> { invMatlCat };
            Inv_MaterialMaster invMatl = new Inv_MaterialMaster { Id = 1, Code = "TEST", Description = "Item Description", Status = "A", Inv_MaterialCategory = lstMatlCat };
            baseController.MaterialMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_MaterialMaster> { invMatl });

            result = invController.MaterialList(0, 10, "Description ASC");
        }

        [When(@"The material master is displayed and has incomplete category details")]
        public void WhenTheMaterialMasterIsDisplayedAndHasIncompleteCategoryDetails()
        {
            Inv_MaterialMaster invMatl = new Inv_MaterialMaster { Id = 1, Code = "TEST", Description = "Item Description", Status = "A"};
            baseController.MaterialMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_MaterialMaster> { invMatl });

            result = invController.MaterialList(0, 10, "Description ASC");
        }

        [Then(@"Material Master list page raises a json exception")]
        public void ThenMaterialMasterListPageRaisesAJsonException()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["Result"].ToString() == "Error");
        }


        [Then(@"The material list result is displayed")]
        public void ThenTheMaterialListResultIsDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            var jsonData = serializer.DeserializeObject(serializer.Serialize(jsonTopLevel["Records"])) as object[];
            var jsonDataValues = jsonData[0] as IDictionary<string, object>;
            Assert.AreEqual(1, jsonData.Length);
            Assert.IsTrue(jsonDataValues.ContainsKey("Id"));
            Assert.IsTrue(jsonDataValues.ContainsKey("Description"));
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
            Inv_MaterialMaster invMaterial = new Inv_MaterialMaster() { Id = 1, Code = "Item1", Description = "Description" };
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


    }
}
