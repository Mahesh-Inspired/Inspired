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
    public class InventoryCategoryMasterSteps
    {
        BaseControllerTest baseController;
        InventoryController invController ;
        ActionResult result;
        FormCollection collection;
        String errorMessage;

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
            //baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return(null);
           //baseController.UnitOfWork.UserMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Gen_UserMaster> { });
        }

        [Given(@"I am logged in user")]
        public void GivenIAmLoggedInUser()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
          
        }

        [When(@"I try to access the category master")]
        public void WhenITryToAccessTheCategoryMaster()
        {
            
            result = invController.CategoryList();
        }

        [When(@"The category master is displayed")]
        public void WhenTheCategoryMasterIsDisplayed()
        {
            Gen_LookupItem lookupItem = new Gen_LookupItem() { Id = 1, LookupType_Id = 1, Description = "TypeDescription" };
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST", Company_Id = 1, Gen_LookupItem = lookupItem };
            baseController.InvCategoryRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
           
            result = invController.CatList(0, 10, "Description ASC");
        }
        [Then(@"The category list result is displayed")]
        public void ThenTheCategoryListResultIsDisplayed()
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
        [When(@"The category master is displayed and has incomplete category details")]
        public void WhenTheCategoryMasterIsDisplayedAndHasIncompleteCategoryDetails()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST", Company_Id = 1 };
            baseController.InvCategoryRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            result = invController.CatList(0, 10, "Description ASC");
        }

        [Then(@"An json exception is raised")]
        public void ThenAnJsonExceptionIsRaised()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["Result"].ToString() == "Error");
        }

        [Then(@"The login page should be displayed")]
        public void ThenTheLoginPageShouldBeDisplayed()
        {

            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("Login"));
        }

        [Then(@"The Category master screen should be displayed")]
        public void ThenTheCategoryMasterScreenShouldBeDisplayedAndTheCategoryJSONIsReturned()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            //Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(IEnumerable<Inv_CategoryMaster>));
        }

        [When(@"I Try to access the create category")]
        public void WhenITryToAccessTheCreateCategory()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(null);        
            result = invController.CreateCategory();
        }

        [When(@"I try to access the edit category")]
        public void WhenITryToAccessTheEditCategory()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            result = invController.EditCategory(1);
        }

        [Then(@"The Create/Edit category master page should be displayed")]
        public void ThenTheEditCreateCategoryMasterPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(CategoryViewModel));
        }

        [Given(@"I enter the details of the category")]
        public void GivenIEnterTheDetailsOfTheCategory()
        {
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { });
            collection = new CategoryFormCollectionBuilder();

        }

        [When(@"I click the create button")]
        public void WhenIClickTheCreateButton()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });
            result = invController.CreateCategory(collection);
        }
        [When(@"I click the save button")]
        public void WhenIClickTheSaveButton()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 1, LookupType_Id = 2, Description = "Test" } });   
            result = invController.EditCategory(collection);
        }

        [Then(@"Details should be saved and I should be redirected to the category list page")]
        public void ThenDetailsShouldBeSavedAndIShouldBeRedirectedToTheCategoryListPage()
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("CategoryList"));
        }
        [Given(@"I enter incomplete details of the category")]
        public void GivenIEnterIncompleteDetailsOfTheCategory()
        {
            errorMessage = "Enter a valid Category code";
            collection = new CategoryFormCollectionBuilder().WithBlankCategoryCode();
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
        }


        [Given(@"I enter incomplete details of the category with no category description")]
        public void GivenIEnterIncompleteDetailsOfTheCategoryWithNoCategoryDescription()
        {
            errorMessage = "Enter a valid Category description";
            collection = new CategoryFormCollectionBuilder().WithBlankCategoryDescription();
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { });

        }

        [Given(@"The category code already exist")]
        public void GivenTheCategoryCodeAlreadyExist()
        {
            errorMessage = "Category code already exist";
            collection = new CategoryFormCollectionBuilder();
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
        }

        [Then(@"The edit/create page is displayed with error message")]
        public void ThenTheCreateCategoryPageIsDisplayedWithErrorMessage()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = (ViewResult)result;
            Assert.IsTrue(viewResult.ContainsErrorMessage(errorMessage));
            //foreach(ModelState modelState in viewResult.ViewData.ModelState.Values)
            //{
            //    Assert.IsTrue(modelState.Errors.Count >0);
            //    foreach (ModelError error in modelState.Errors)
            //        Assert.IsTrue(error.ErrorMessage.Contains(errorMessage));
            //}            
        }

        [Given(@"I edit the details of a category")]
        public void GivenIEditTheDetailsOfACategory()
        {
            Inv_CategoryMaster invCat = new Inv_CategoryMaster() { Id = 1, Type = 2, Description = "TEST" };
            baseController.InvCategoryRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_CategoryMaster> { invCat });
            collection = new CategoryFormCollectionBuilder();
        }


    }

    internal class CategoryFormCollectionBuilder
    {
        private FormCollection collection;

        internal CategoryFormCollectionBuilder()
        {
            collection = new FormCollection();
            collection.Add("Category.Type", "1");
            collection.Add("Category.Code", "TestCode");
            collection.Add("Category.Description", "Test description");
        }

        internal CategoryFormCollectionBuilder WithBlankCategoryCode()
        {
            collection["Category.Code"] = "";
            return this;
        }

        internal CategoryFormCollectionBuilder WithBlankCategoryDescription()
        {
            collection["Category.Description"] = "";
            return this;
        }

        internal FormCollection Build()
        {
            return collection;
        }

        public static implicit operator FormCollection(CategoryFormCollectionBuilder categoryFormCollection)
        {
            return categoryFormCollection.Build();
        }
    }
}
