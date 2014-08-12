using System;
using TechTalk.SpecFlow;
using Rhino.Mocks;
using Inspired.Web.Controllers;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Inspired.Data;
using System.Collections.Generic;


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
            baseController.MaterialMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_MaterialMaster> { });

        }

        [When(@"I try to access the material master page")]
        public void WhenITryToAccessTheMaterialMasterPage()
        {
            result = invController.MaterialMasterList();
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
            result = invController.MaterialMasterList(0, 10, "Description ASC");
        }

        [Then(@"The material list result is displayed")]
        public void ThenTheMaterialListResultIsDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
        }


    }
}
