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
    public class InventoryLookupMasterSteps
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
        }

        [Given(@"I not logged in")]
        public void GivenINotLoggedIn()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return(null);
            baseController.UnitOfWork.UserMasterRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Gen_UserMaster> { });
        }

        [Given(@"I am logged in")]
        public void GivenIAmLoggedIn()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
        }

        [When(@"I try to access lookup master")]
        public void WhenITryToAccessLookupMaster()
        {
            result = invController.LookupList();
        }

        [Then(@"Login page should be displayed")]
        public void ThenLoginPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("Login"));
        }

        [Then(@"Lookup master screen should be displayed")]
        public void ThenLookupMasterScreenShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [When(@"I Try to access create lookup")]
        public void WhenITryToAccessCreateLookup()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(null);
            result = invController.CreateLookup();
        }

        [Then(@"Create/Edit lookup master page should be displayed")]
        public void ThenCreateEditLookupMasterPageShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(LookupViewModel));
        }

        [When(@"I try to access edit lookup")]
        public void WhenITryToAccessEditLookup()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            Gen_LookupItem genLup = new Gen_LookupItem() { LookupType_Id = 1, LookupGroup_Id = 1, Description = "TEST", IsOther = false, IsHidden = false };
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { genLup });
            result = invController.EditLookup(57);
        }

        [Given(@"I enter details of lookup")]
        public void GivenIEnterDetailsOfLookup()
        {
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { });
            collection = new LookupFormCollectionBuilder();
        }

        [When(@"I click create button")]
        public void WhenIClickCreateButton()
        {
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { });
            result = invController.CreateLookup(collection);
        }

        [Then(@"Details should be saved and I should be redirected to lookup list page")]
        public void ThenDetailsShouldBeSavedAndIShouldBeRedirectedToLookupListPage()
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("LookupList"));
        }

        [Given(@"I enter incomplete details of lookup with no lookup type")]
        public void GivenIEnterIncompleteDetailsOfLookupWithNoLookupType()
        {
            errorMessage = "Enter a valid Lookup type";
            collection = new LookupFormCollectionBuilder().WithBlankLookupType();
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { });
        }

        [When(@"I click create button with no lookup type")]
        public void WhenIClickCreateButtonWithNoLookupType()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 57, LookupGroup_Id = 1, Description = "TEST", IsOther = false, IsHidden = false } });
            result = invController.CreateLookup(collection);
        }

        [Given(@"I enter incomplete details of lookup with no lookup description")]
        public void GivenIEnterIncompleteDetailsOfLookupWithNoLookupDescription()
        {
            errorMessage = "Enter a valid Lookup description";
            collection = new LookupFormCollectionBuilder().WithBlankLookupDescription();
            baseController.UserIdentity.Expect(u => u.GetUserName()).IgnoreArguments().Return("InventoryUser");
            baseController.UserIdentity.Expect(u => u.GetCompanyId()).IgnoreArguments().Return(1);
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { });
        }

        [When(@"I click create button with no lookup description")]
        public void WhenIClickCreateButtonWithNoLookupDescription()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 57, LookupType_Id = 1, LookupGroup_Id = 1, IsOther = false, IsHidden = false } });
            result = invController.CreateLookup(collection);
        }

        [Then(@"Edit/create page is displayed with error")]
        public void ThenEditCreatePageIsDisplayedWithError()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = (ViewResult)result;
            Assert.IsTrue(viewResult.ContainsErrorMessage(errorMessage));
        }

        [Given(@"I enter incomplete details of lookup")]
        public void IEnterIncompleteDetailsOfLookup()
        {
            errorMessage = "Enter a valid Lookup description";
            collection = new LookupFormCollectionBuilder().WithBlankLookupDescription();
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 56, LookupGroup_Id = 1, Description = "TEST", IsOther = false, IsHidden = false } });
        }

        [When(@"I click save button")]
        public void WhenIClickSaveButton()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 56, LookupGroup_Id = 1, Description = "TEST", IsOther = false, IsHidden = false } });
            result = invController.EditLookup(collection);
        }

        [Then(@"Edit/create page is displayed with error message")]
        public void ThenTheCreateCategoryPageIsDisplayedWithErrorMessage()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = (ViewResult)result;
            Assert.IsTrue(viewResult.ContainsErrorMessage(errorMessage));            
        }

        [Given(@"I edit details of a lookup")]
        public void IEditDetailsDetailsOfLookup()
        {
            collection = new LookupFormCollectionBuilder();
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem> { new Gen_LookupItem { Id = 56, LookupGroup_Id = 1, Description = "TEST" } });
        }

        [When(@"I click success save button")]
        public void WhenIClickSuccessSaveButton()
        {
            baseController.LookupTypeRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupType>() { new Gen_LookupType { } });
            baseController.LookupGroupRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupGroup>() { new Gen_LookupGroup { } });
            baseController.LookupItemRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Gen_LookupItem>() { new Gen_LookupItem { Id = 56, LookupType_Id = 8, LookupGroup_Id = 1, Description = "TEST" } });
            result = invController.EditLookup(collection);
        }

        [Then(@"Details should be saved and I should be redirected to the lookup list page")]
        public void ThenDetailsShouldBeSavedAndIShouldBeRedirectedToTheLookupListPage()
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            var redirect = (RedirectToRouteResult)result;
            Assert.IsTrue(redirect.RouteValues.ContainsValue("LookupList"));
        }

        [When(@"Lookup master is displayed")]
        public void WhenLookupMasterIsDisplayed()
        {
            Gen_LookupType lookupType = new Gen_LookupType() { Id = 1, Description = "Material Statuses" };
            Gen_LookupItem lookupItem = new Gen_LookupItem() { Id = 1, Gen_LookupType = lookupType, Description = "TypeDescription" };
            baseController.LookupItemRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Gen_LookupItem> { lookupItem });

            result = invController.lupList(0, 10, "Description ASC");
        }

        [Then(@"Lookup list result is displayed")]
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

        [When(@"Lookup master is displayed and has incomplete lookup details")]
        public void WhenLookupMasterIsDisplayedAndHasIncompleteLookupDetails()
        {
            Gen_LookupType lookupType = new Gen_LookupType() { Id = 1, Description = "Material Statuses" };
            Gen_LookupItem lookupItem = new Gen_LookupItem() { Id = 1, Description = "TypeDescription" };
            baseController.LookupItemRepository.Expect(u => u.Get()).IgnoreArguments().Return(new List<Gen_LookupItem> { lookupItem });

            result = invController.lupList(0, 10, "Description ASC");
        }

        [Then(@"json exception is raised")]
        public void ThenJsonExceptionIsRaised()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["Result"].ToString() == "Error");
        }

    }

    internal class LookupFormCollectionBuilder
    {
        private FormCollection collection;

        internal LookupFormCollectionBuilder()
        {
            collection = new FormCollection();
            collection.Add("Lookup.LookupType_Id", "1");
            collection.Add("Lookup.LookupGroup_Id", "1");
            collection.Add("Description", "Test description");
            collection.Add("Lookup.isOther", "true");
            collection.Add("Lookup.isHidden", "true");
        }

        internal LookupFormCollectionBuilder WithBlankLookupType()
        {
            collection["Lookup.LookupType_Id"] = "0";
            return this;
        }

        internal LookupFormCollectionBuilder WithBlankLookupDescription()
        {
            collection["Description"] = "";
            return this;
        }

        internal FormCollection Build()
        {
            return collection;
        }

        public static implicit operator FormCollection(LookupFormCollectionBuilder lookupFormCollection)
        {
            return lookupFormCollection.Build();
        }
    }


}
