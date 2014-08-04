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
    public class InventoryCategoryMasterSteps
    {
        BaseControllerTest baseController;
        InventoryController invController ;
        ActionResult result;
     

        [BeforeScenario()]
        public void Setup()
        {
            baseController = new BaseControllerTest();
            baseController.InitializeBase();
            invController = new InventoryController(baseController.UnitOfWork,baseController.UserIdentity);
            //invController.ControllerContext = new ControllerContext(baseController.HttpContext, baseController.RouteData, invController);
        }

        [Given(@"I am not logged in")]
        public void GivenIAmNotLoggedIn()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return(null);
           //baseController.UnitOfWork.UserMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Gen_UserMaster> { });
        }

        [Given(@"I am logged in user")]
        public void GivenIAmLoggedInUser()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.InvCategoryRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_CategoryMaster> { });
        }

        [When(@"I try to access the category master")]
        public void WhenITryToAccessTheCategoryMaster()
        {
            result = invController.ListCategory();
        }

        [Then(@"The login page should be displayed")]
        public void ThenTheLoginPageShouldBeDisplayed()
        {

            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("Login"));
        }

        [Then(@"The Category master screen should be displayed")]
        public void ThenTheCategoryMasterScreenShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(IEnumerable<Inv_CategoryMaster>));
        }
    }
}
