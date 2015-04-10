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
    public class InventoryMiscReceiptSteps
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

        [When(@"I try to access Miscellaneous Receipt")]
        public void WhenITryToAccessMiscellaneousReceipt()
        {
            baseController.DocumentMastersRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_DocumentMaster>() { new Inv_DocumentMaster { } });
            baseController.StockTransRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(null);
            result = invController.MiscReceipt();
        }

        [Then(@"Miscellaneous Receipt should be displayed")]
        public void ThenMiscellaneousReceiptShouldBeDisplayed()
        {
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(MiscReceiptViewModel));
        }

        [When(@"Document type is selected")]
        public void WhenDocumentTypeIsSelected()
        {
            baseController.DocumentMastersRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_DocumentMaster>() { new Inv_DocumentMaster { } });
            baseController.StockTransRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_StockTran>() { new Inv_StockTran {  } });
            result = invController.FetchDocnoJSON("11", "misc");
        }

        [Then(@"Generate new document code")]
        public void ThenGenerateNewDocumentCode()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
        }

        [When(@"Start typing Item Code in textbox")]
        public void StartTypingItemCodeInTextbox()
        {
            result = invController.itemSearch("I");
        }

        [Then(@"Suggest list of Item Code based on text entered")]
        public void SuggestListOfItemCodeBasedOnTextEntered()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
        }

        [When(@"Start typing warehouse in textbox")]
        public void StartTypingWarehouseInTextbox()
        {
            result = invController.warehouseSearch("W");
        }

        [Then(@"Suggest list of warehouse based on text entered")]
        public void SuggestListOfWarehouseBasedOnTextEntered()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
        }

        [When(@"Serial flag of item is false")]
        public void SerialFlagOfItemIsFalse()
        {
            baseController.MaterialMasterRepository.Stub(u => u.Get(null)).IgnoreArguments().Return(new List<Inv_MaterialMaster>() { new Inv_MaterialMaster { } });
            result = invController.FetchItemSNJSON("ITEM-10097");
        }

        [Then(@"Enter default serial number")]
        public void EnterDefaultSerialNumber()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
        }

        [When(@"I try to save the details entered in the Miscellaneous Receipt")]
        public void ITryToSaveTheDetailsEnteredInTheMiscellaneousReceipt()
        {
            MiscReceiptSubmitModel MiscReceiptSubmitModel = MiscReceiptSubmit.FilledWithData();
            result = invController.Receipt_Save(MiscReceiptSubmitModel);
        }

        [Then(@"The Miscellaneous Receipt save succeeds")]
        public void TheMiscellaneousReceiptSaveSucceeds()
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult));
            var jsonResult = (JsonResult)result;
            var jsonTopLevel = jsonResult.ConvertToObjectDictionary();
            Assert.IsTrue(jsonTopLevel["success"].ToString().ToLower() == "true");
        }
    }
}
