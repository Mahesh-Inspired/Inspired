using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;
using Inspired.Repository;
using Utilities.MVC;
using Inspired.Web.ViewModel;
using Utilities.Data;
using System.Text.RegularExpressions;
using System.IO;

namespace Inspired.Web.Controllers
{
    public class jQueryDataTableParamModel
    {
        public string sEcho { get; set; }
        public string sSearch { get; set; }
        public int iDisplayLength { get; set; }
        public int iDisplayStart { get; set; }
        public int iColumns { get; set; }
        public int iSortingCols { get; set; }
        public string sColumns { get; set; }
    }
    [Authorize]
    public class InventoryController : ControllerBase
    {

        #region Constructor
        public InventoryController(IUnitOfWork unitOfWork, IUserIdentity userIdentity)
            : base(unitOfWork, userIdentity)
        { }
        #endregion

        #region CategoryList
        public ActionResult CategoryList()
        {
            if (UserIdentity.GetUserName() == null)
                return RedirectToAction("Login", "Account");
            return View();
        }

        [HttpPost]
        public JsonResult CatList(int jtStartIndex = 0, int jtPageSize = 0, String jtSorting = null)
        {
            try
            {
                var companyID = UserIdentity.GetCompanyId();
                var catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == companyID)
                    .Select(c => new
                    {
                        Id = c.Id,
                        TypeDescription = c.Gen_LookupItem.Description,
                        Code = c.Code,
                        Description = c.Description,
                        Status = (c.Status == "A" ? "Active" : "Passive")
                    }).ToList();
                int recordCount = catList.Count;
                if (jtSorting != null)
                {
                    catList = catList.OrderBy(jtSorting).ToList();
                }
                catList = catList.Skip(jtStartIndex).Take(jtPageSize).ToList();
                return Json(new { Result = "OK", Records = catList, TotalRecordCount = recordCount });
            }
            catch (Exception e)
            {
                return Json(new { Result = "Error", Message = e.Message });
            }
        }
        #endregion

        #region Create Category
        public ActionResult CreateCategory()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var types = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId && u.LookupType_Id == Core.Global.LookupType_Category).OrderBy(u => u.Ordinal).ToList();
            CategoryViewModel catViewModel = new CategoryViewModel(types, null);
            return View(catViewModel);
        }

        [HttpPost]
        public ActionResult CreateCategory(FormCollection collection)
        {
            Int32 typeId;
            String catCode;
            String catDescription;
            Int32 companyId = UserIdentity.GetCompanyId();
            Int32.TryParse(collection["Category.Type"], out typeId);
            catCode = collection["Category.Code"].ToString();
            catDescription = collection["Category.Description"].ToString();
            Inv_CategoryMaster cat;
            cat = new Inv_CategoryMaster()
            {
                Type = typeId,
                Code = catCode,
                Description = catDescription,
                Company_Id = UserIdentity.GetCompanyId(),
                User_Id = UserIdentity.GetUserId(),
                Status = "A",
                Last_Updated = DateTime.Now
            };
            checkCategoryFields(cat, true, companyId);
            if (ModelState.IsValid)
            {
                UnitOfWork.CategoryMasterRepository.Insert(cat);
                UnitOfWork.Save();
                return RedirectToAction("CategoryList");
            }

            var types = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId).OrderBy(u => u.Ordinal).ToList();
            CategoryViewModel catViewModel = new CategoryViewModel(types, cat);
            return View(catViewModel);
        }


        private void checkCategoryFields(Inv_CategoryMaster cat, Boolean isCreate, Int32 companyId)
        {
            if (String.IsNullOrEmpty(cat.Code))
                ModelState.AddModelError("Category.Code", "Enter a valid Category code");
            if (String.IsNullOrEmpty(cat.Description))
                ModelState.AddModelError("Category.Description", "Enter a valid Category description");
            if (isCreate && !String.IsNullOrEmpty(cat.Code) &&
                UnitOfWork.CategoryMasterRepository.Get(u => u.Company_Id == companyId && u.Code == cat.Code && u.Type == cat.Type).Count() > 0)
                ModelState.AddModelError("Category.Code", "Category code already exist");
        }
        #endregion

        #region Edit Category

        public ActionResult EditCategory(Int32 id)
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var types = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId).OrderBy(u => u.Ordinal).ToList();
            var cat = UnitOfWork.CategoryMasterRepository.Get(u => u.Company_Id == companyId && u.Id == id).FirstOrDefault();
            CategoryViewModel catViewModel = new CategoryViewModel(types, cat);
            return View(catViewModel);
        }

        [HttpPost]
        public ActionResult EditCategory(FormCollection collection)
        {
            Int32 typeId;
            String catCode;
            String catDescription;
            Int32 id;
            Int32 companyId = UserIdentity.GetCompanyId();
            Int32.TryParse(collection["Category.Type"], out typeId);
            Int32.TryParse(collection["Category.Id"], out id);
            catCode = collection["Category.Code"].ToString();
            catDescription = collection["Category.Description"].ToString();

            Inv_CategoryMaster cat = UnitOfWork.CategoryMasterRepository.Get(u => u.Id == id && u.Company_Id == companyId).FirstOrDefault();
            cat.Type = typeId;
            cat.Code = catCode;
            cat.Description = catDescription;

            checkCategoryFields(cat, false, companyId);
            if (ModelState.IsValid)
            {
                UnitOfWork.CategoryMasterRepository.Update(cat);
                UnitOfWork.Save();
                return RedirectToAction("CategoryList");
            }
            var types = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId).OrderBy(u => u.Ordinal).ToList();
            CategoryViewModel catViewModel = new CategoryViewModel(types, cat);
            return View(catViewModel);
        }
        #endregion

        #region Material Master list
        public ActionResult MaterialList()
        {
            if (UserIdentity.GetUserName() == null)
                return RedirectToAction("Login", "Account");
            var companyId = UserIdentity.GetCompanyId();
            List<Inv_MaterialMaster> matlList = UnitOfWork.MaterialMasterRepository.Get(u => u.Company_Id == companyId).ToList();
            return View(matlList);
        }



        #endregion

        #region Create Material
        public ActionResult CreateMaterial()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            List<Gen_LookupItem> lookupItems = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId && u.IsHidden == false).ToList();
            MaterialViewModel material = new MaterialViewModel(lookupItems, null);
            return View(material);
        }
        #endregion

        #region Edit Material
        public ActionResult EditMaterial(Int32 itemId)
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            List<Gen_LookupItem> lookupItems = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId && u.IsHidden == false).ToList();

            Inv_MaterialMaster item = UnitOfWork.MaterialMasterRepository.Get(m => m.Id == itemId).FirstOrDefault();

            // Remove the Categories that already exist in Material Category
            foreach (Inv_MaterialCategory matCat in item.Inv_MaterialCategory)
                lookupItems.Remove(lookupItems.Where(u => u.Id == matCat.Category_Type).First());

            // Remove the specification that already exist in Material Specification
            foreach (Inv_MaterialSpecification matSpec in item.Inv_MaterialSpecification)
                lookupItems.Remove(lookupItems.Where(u => u.Id == matSpec.Spec_Id).First());

            MaterialViewModel material = new MaterialViewModel(lookupItems, item);
            material.User_Code = UserIdentity.GetUserName();
            material.User_Id = UserIdentity.GetUserId();
            return View("CreateMaterial", material);
        }
        #endregion

        #region Save Material
        private Boolean SaveMaterialDetails(MaterialSubmitModel data)
        {

            var companyId = UserIdentity.GetCompanyId();


            Inv_MaterialMaster material;
            if (data.Id != 0)
            {
                material = UnitOfWork.MaterialMasterRepository.Get(u => u.Id == data.Id).FirstOrDefault();
                material.Code = data.Code;
                material.Description = data.Description;
                material.Status = Resources.Inventory.MatlStatusTemp;
            }
            else
            {
                material = new Inv_MaterialMaster()
                {
                    Code = data.Code,
                    Description = data.Description,
                    Status = Resources.Inventory.MatlStatusTemp,
                    Company_Id = companyId
                };
            }

            // update/insert material master details
            material.SKU_Number = data.SKU_Number;
            material.Long_Description = data.Long_Description;
            material.Overview = data.Overview;
            material.UOM = data.UOM;
            material.Margin_Percent = data.Margin_Percent;
            material.Batch_YN = Convert.ToBoolean(data.Batch_YN);
            material.Serial_YN = Convert.ToBoolean(data.Serial_YN);
            material.Location_YN = Convert.ToBoolean(data.Location_YN);
            material.Shelf_Life = data.Shelf_Life;
            material.Barcode = data.Barcode;
            material.Max_Level = data.Max_Level;
            material.Min_Level = data.Min_Level;
            material.Re_order_Level = data.Re_order_Level;
            material.Lead_Time = data.Lead_Time;
            material.NETT_Price = data.NETT_Price;
            material.Sale_Price = data.Sale_Price;
            material.Cost_Price = data.Cost_Price;
            material.MCarton_Quantity = data.MCarton_Quantity;
            material.MCarton_Length = data.MCarton_Length;
            material.MCarton_Width = data.MCarton_Width;
            material.MCarton_Height = data.MCarton_Height;
            material.MCarton_Gross_Weight = data.MCarton_Gross_Weight;
            material.MCarton_NETT_Weight = data.MCarton_NETT_Weight;
            material.Company_Id = companyId;


            Boolean materialCategoryFlg = true;
            Boolean materialSpecFlg = true;
            Boolean materialPackFlg = true;
            Boolean materialSpareFlg = true;
            Boolean materialAltFlg = true, materialSuppFlg = true, materialNotesFlg = true;
            if (data.ItemCategory != null)
                materialCategoryFlg = SaveItemCategory(data.ItemCategory.ToList(), ref material, companyId);
            if (data.ItemSpecification != null)
                materialSpecFlg = SaveItemSpecification(data.ItemSpecification.ToList(), ref material, companyId);
            if (data.ItemPackaging != null)
                materialPackFlg = SaveItemPackaging(data.ItemPackaging.ToList(), ref material, companyId);
            if (data.ItemSpare != null)
                materialSpareFlg = SaveItemSpares(data.ItemSpare.ToList(), ref material, companyId);
            if (data.ItemAltRelative != null)
                materialAltFlg = SaveItemAlternateRelative(data.ItemAltRelative.ToList(), ref material, companyId);
            if (data.Suppliers != null)
                materialSuppFlg = SaveItemSupplier(data.Suppliers.ToList(), ref material, companyId);
            if (data.ItemNotes != null)
                materialNotesFlg = SaveItemNotes(data.ItemNotes.ToList(), ref material, companyId);

            if (data.Id != 0)
                UnitOfWork.MaterialMasterRepository.Update(material);
            else
                UnitOfWork.MaterialMasterRepository.Insert(material);

            UnitOfWork.Save();
            return true;

        }
        private Boolean SaveItemCategory(List<MaterialCategory> newCategories, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialCategory invMaterialCategory;
            // Delete the existing Inv_MaterialCategory details
            foreach (Inv_MaterialCategory tmpCat in material.Inv_MaterialCategory.ToList())
            {
                UnitOfWork.MaterialCategoryRepository.Delete(tmpCat);
            }

            // Insert values in the data table into Inv_MaterialCategory table
            foreach (MaterialCategory itemCat in newCategories)
            {
                invMaterialCategory = new Inv_MaterialCategory()
                {
                    Category_Id = itemCat.CatId,
                    Category_Type = itemCat.CategoryType,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialCategoryRepository.Insert(invMaterialCategory);
                material.Inv_MaterialCategory.Add(invMaterialCategory);
            }
            return true;
        }

        private Boolean SaveItemSpecification(List<MaterialSpecification> specifications, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialSpecification invMaterialSpec;
            // Delete the existing Inv_MaterialSpecification details
            foreach (Inv_MaterialSpecification tmpSpec in material.Inv_MaterialSpecification.ToList())
            {
                UnitOfWork.MaterialSpecificationRepository.Delete(tmpSpec);
            }

            // Insert values in the data table into Inv_MaterialSpecification table
            foreach (MaterialSpecification itemSpec in specifications)
            {
                invMaterialSpec = new Inv_MaterialSpecification()
                {
                    Batch_Number = itemSpec.BatchNumber,
                    Spec_Id = itemSpec.SpecId,
                    Spec_Value = itemSpec.SpecValue,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialSpecificationRepository.Insert(invMaterialSpec);
                material.Inv_MaterialSpecification.Add(invMaterialSpec);
            }
            return true;
        }

        private Boolean SaveItemPackaging(List<MaterialPackaging> packagings, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialPackaging invMaterialPackaging;
            // Delete the existing Inv_MaterialPackaging details
            foreach (Inv_MaterialPackaging tmpPack in material.Inv_MaterialPackaging.ToList())
            {
                UnitOfWork.MaterialPackagingRepository.Delete(tmpPack);
            }

            // Insert values in the data table into Inv_MaterialPackaging table
            foreach (MaterialPackaging itemPack in packagings)
            {
                invMaterialPackaging = new Inv_MaterialPackaging()
                {
                    Box_Number = itemPack.BoxNumber,
                    Box_Width = itemPack.BoxWidth,
                    Box_Height = itemPack.BoxHeight,
                    Box_Length = itemPack.BoxLength,
                    Box_Gross_Weight = itemPack.BoxGrossWeight,
                    Box_NETT_Weight = itemPack.BoxNettWeight,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialPackagingRepository.Insert(invMaterialPackaging);
                material.Inv_MaterialPackaging.Add(invMaterialPackaging);
            }
            return true;
        }

        private Boolean SaveItemSpares(List<MaterialSpare> spares, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialSpares invMaterialSpare;
            Inv_MaterialMaster invSpareMaterial;
            // Delete the existing Inv_MaterialSpares details
            Int32 itemId = material.Id;
            foreach (Inv_MaterialSpares tmpSpare in material.MaterialSpares.ToList())
            {
                UnitOfWork.MaterialSparesRepository.Delete(tmpSpare);
            }

            // Insert values in the data table into Inv_MaterialSpares table
            foreach (MaterialSpare itmSpare in spares)
            {
                invMaterialSpare = new Inv_MaterialSpares()
                {
                    Item_Id = material.Id,

                    Quantity = itmSpare.SpareQuantity,
                    Price = itmSpare.SparePrice,
                    Overview = itmSpare.SpareOverview,
                    Company_Id = companyId
                };
                if (itmSpare.SpareItemId == 0)
                {
                    invSpareMaterial = new Inv_MaterialMaster()
                    {
                        Code = itmSpare.SpareItemCode,
                        Description = itmSpare.SpareItemDesc,
                        Company_Id = companyId
                    };
                    UnitOfWork.MaterialMasterRepository.Insert(invSpareMaterial);
                    invMaterialSpare.SpareItem = invSpareMaterial;
                }
                else
                    invMaterialSpare.Spare_Id = itmSpare.SpareItemId;

                UnitOfWork.MaterialSparesRepository.Insert(invMaterialSpare);
                //material.MaterialSpares.Add(invMaterialSpare);
            }
            return true;
        }

        private Boolean SaveItemAlternateRelative(List<MaterialAltRelative> altRelatives, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialAlternateRelative invMaterialAltRelative;
            // Delete the existing Inv_MaterialAlternateRelative details
            Int32 itemId = material.Id;
            foreach (Inv_MaterialAlternateRelative tmpAlt in material.AlternateRelativeItemCollection.ToList())
            {
                UnitOfWork.MaterialAltRelativeRepository.Delete(tmpAlt);
            }

            // Insert values in the data table into Inv_MaterialAlternateRelative table
            foreach (MaterialAltRelative itmAlt in altRelatives)
            {
                invMaterialAltRelative = new Inv_MaterialAlternateRelative()
                {
                    Item_Id = material.Id,
                    AR_Flag = itmAlt.AlternateFlgId,
                    AR_Item_Id = itmAlt.AlternateItemId,
                    Notes = itmAlt.AlternateNotes,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialAltRelativeRepository.Insert(invMaterialAltRelative);
                material.AlternateRelativeItemCollection.Add(invMaterialAltRelative);
            }
            return true;
        }
        private Boolean SaveItemSupplier(List<MaterialSupplier> suppliers, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialSupplier matlSupplier;
            // Delete the existing Inv_MaterialSupplier details
            Int32 itemId = material.Id;
            foreach (Inv_MaterialSupplier tmpSupp in material.Inv_MaterialSupplier.ToList())
            {
                UnitOfWork.MaterialSupplierRepository.Delete(tmpSupp);
            }

            // Insert values in the data table into Inv_MaterialSupplier table
            foreach (MaterialSupplier supp in suppliers)
            {
                matlSupplier = new Inv_MaterialSupplier()
                {
                    Item_Id = material.Id,
                    Supplier_Code = supp.SupplierId,
                    Ref_Number = supp.RefNumber,
                    Min_Order = supp.MinOrderQty,
                    Currency = supp.CurrencyId,
                    Notes = supp.Notes,
                    Cost = supp.Cost,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialSupplierRepository.Insert(matlSupplier);
                material.Inv_MaterialSupplier.Add(matlSupplier);
            }
            return true;
        }

        private Boolean SaveItemNotes(List<MaterialNotes> itemNotes, ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialNotes itemNote;
            // Delete the existing Inv_MaterialNotes details
            Int32 itemId = material.Id;
            foreach (Inv_MaterialNotes tmpNotes in material.Inv_MaterialNotes.ToList())
            {
                UnitOfWork.MaterialNotesRepository.Delete(tmpNotes);
            }

            // Insert values in the data table into Inv_MaterialNotes table
            foreach (MaterialNotes matlNotes in itemNotes)
            {
                itemNote = new Inv_MaterialNotes()
                {
                    Item_Id = material.Id,
                    Accd_Key = matlNotes.SuppCustId,
                    Taken_By = matlNotes.TakenById,
                    Entry_date = matlNotes.EntryDate,
                    Expiry_Date = matlNotes.ExpiryDate,
                    Notes = matlNotes.Notes,
                    ToBe_Actioned_By = matlNotes.ActionById,
                    Action_Date = matlNotes.ActionByDate,
                    Type = matlNotes.NotesTypeId,
                    Priority_Flg = matlNotes.PriorityFlagId,
                    Company_Id = companyId
                };
                UnitOfWork.MaterialNotesRepository.Insert(itemNote);
                material.Inv_MaterialNotes.Add(itemNote);
            }
            return true;
        }

        [HttpPost]
        public JsonResult SaveMaterial(MaterialSubmitModel data)
        {

            Boolean canContinue = false;

            canContinue = SaveMaterialDetails(data);


            return Json(new { success = canContinue }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region JSon Fetch details

        public JsonResult FetchCategoryJSON(Int32? catType, String catCode)
        {
            Int32 id = 0;
            String catDescription = String.Empty;

            Inv_CategoryMaster cat = UnitOfWork.CategoryMasterRepository.Get(u => u.Code.ToLower() == catCode.ToLower() && u.Type == catType)
                .FirstOrDefault();
            if (cat != null)
            {
                id = cat.Id;
                catDescription = cat.Description;
                return Json(new { success = true, id = id, CategoryDescription = catDescription }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = false, Message = "Enter a valid Category details" }, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Create Material JSon Fetch

        public ActionResult CategorySearch(string term)
        {
            var categoryList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            existingList = (string[])Session["CategoryList"];

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                categoryList = UnitOfWork.CategoryMasterRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Code).ToArray();
                Session["CategoryList"] = categoryList;
                existingList = (string[])Session["CategoryList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        public ActionResult UomSearch(string term)
        {
            var uomList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            existingList = (string[])Session["UomList"];

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                uomList = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId && u.LookupType_Id == 9).ToList()
                    .Select(i => i.Description).ToArray();
                Session["UomList"] = uomList;
                existingList = (string[])Session["UomList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        public ActionResult AccountSearch(string term)
        {
            var tags = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            existingList = (string[])Session["AccountList"];

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                tags = UnitOfWork.AccountMasterRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Acc_Code).ToArray();
                Session["AccountList"] = tags;
                existingList = (string[])Session["AccountList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        public ActionResult SupplierSearch(string term)
        {
            var supplierList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            existingList = (string[])Session["SupplierList"];

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                supplierList = UnitOfWork.MaterialSupplierRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Supplier_Code.ToString()).ToArray();
                Session["SupplierList"] = supplierList;
                existingList = (string[])Session["SupplierList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        public ActionResult AlternateSearch(string term)
        {
            var alternateList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            existingList = (string[])Session["AlternateList"];

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                alternateList = UnitOfWork.MaterialMasterRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Code).ToArray();
                Session["AlternateList"] = alternateList;
                existingList = (string[])Session["AlternateList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Specification
        public JsonResult FetchSpecJSON(Int32 specid)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;
            String groupDescription = String.Empty;
            Gen_LookupItem spec = UnitOfWork.LookupItemRepository.Get(u => u.Id == specid
                && u.LookupType_Id == Core.Global.LookupType_Specification && u.Company_Id == companyId).FirstOrDefault();
            if (spec != null)
            {
                id = spec.Id;
                groupDescription = spec.Gen_LookupGroup.Description;
                return Json(new { success = true, SpecId = id, SpecGroup = groupDescription }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = false, Message = "Enter a valid specification" }, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region JSON Fetch Item Details
        public JsonResult FetchItemDescJSON(String itemcode)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;
            String itemDescription = String.Empty;

            Inv_MaterialMaster item = UnitOfWork.MaterialMasterRepository.Get(u => u.Code == itemcode).FirstOrDefault();
            if (item != null)
            {
                id = item.Id;
                itemDescription = item.Description;
                return Json(new { success = true, id = id, ItemDescription = itemDescription, ItemCode = itemcode }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = true, id = 0, ItemDescription = "" }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region JSON Fetch Account Details
        public JsonResult FetchAccountDetails(String Name, String Code)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;
            FAS_AccountMaster account;

            if (!String.IsNullOrEmpty(Code))
                account = UnitOfWork.AccountMasterRepository.Get(u => u.Acc_Code == Code).FirstOrDefault();
            else
                account = UnitOfWork.AccountMasterRepository.Get(u => u.Acc_Description == Name).FirstOrDefault();

            if (account != null)
            {
                id = account.Accd_Key;
                Name = account.Acc_Description;
                Code = account.Acc_Code;
                return Json(new { success = true, id = id, name = Name, code = Code }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = true, id = 0, name = "", code = "" }, JsonRequestBehavior.AllowGet);

        }


        #endregion

        #region JSON Fetch User Details
        public JsonResult FetchUserDetails(String Code)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;
            Gen_UserMaster user;
            user = UnitOfWork.UserMasterRepository.Get(u => u.UserName == Code).FirstOrDefault();

            if (user != null)
            {
                id = user.Id;
                Code = user.UserName;
                return Json(new { success = true, id = id, code = Code }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = true, id = 0, code = "" }, JsonRequestBehavior.AllowGet);

        }


        #endregion

        #region Warehouse master
        public ActionResult WarehouseMaster()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            List<Inv_WarehouseMaster> warehouses = UnitOfWork.WarehouseRepository.Get().ToList();
            List<Gen_LookupItem> warehouseTypes = UnitOfWork.LookupItemRepository.Get(u => u.LookupType_Id == Core.Global.LookupType_WarehouseType).OrderBy(u => u.Ordinal).ToList();
            List<Gen_BranchMaster> branches = new List<Gen_BranchMaster>();
            branches.Add(new Gen_BranchMaster() { Id = -1, Description = "Please Select" });
            branches.AddRange(UnitOfWork.BranchRepository.Get(u => u.Company_Id == companyId).ToList());
            WarehouseViewModel warehouseView = new WarehouseViewModel(warehouseTypes, warehouses, branches);
            return View(warehouseView);
        }

        public JsonResult AddUpdateWarehouse(Int32 whsId, String whsCode, String whsDesc, Int32 whsType, Int32 branchId)
        {
            try
            {
                Inv_WarehouseMaster warehouse = new Inv_WarehouseMaster();
                if (whsId != 0)
                    warehouse = UnitOfWork.WarehouseRepository.Get(u => u.Id == whsId).First();

                warehouse.Code = whsCode;
                warehouse.Description = whsDesc;
                warehouse.Type = whsType;
                warehouse.Company_Id = UserIdentity.GetCompanyId();
                //warehouse.Branch_Id = branchId <= 0 ? DBNull.Value : branchId;
                if (whsId != 0)
                    UnitOfWork.WarehouseRepository.Update(warehouse);
                else
                    UnitOfWork.WarehouseRepository.Insert(warehouse);
                UnitOfWork.Save();
                return Json(new { success = true, id = warehouse.Id }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, Message = ex.InnerException }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult DeleteWarehouse(Int32 whsId)
        {
            try
            {
                
                Inv_WarehouseMaster warehouse= UnitOfWork.WarehouseRepository.Get(u => u.Id == whsId).First();
                if (warehouse != null)
                {
                    UnitOfWork.WarehouseRepository.Delete(warehouse);
                    UnitOfWork.Save();
                    return Json(new { success = true}, JsonRequestBehavior.AllowGet);
                }
                else
                    return Json(new { success = false, Message="Invalid warehouse" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, Message = ex.InnerException }, JsonRequestBehavior.AllowGet);
            }
        }

        #endregion

        #region LookupList
        public ActionResult LookupList()
        {
            if (UserIdentity.GetUserName() == null)
                return RedirectToAction("Login", "Account");
            return View();
        }

        [HttpPost]
        public JsonResult lupList(int jtStartIndex = 0, int jtPageSize = 0, String jtSorting = null)
        {
            try
            {
                var companyID = UserIdentity.GetCompanyId();
                var LupList = UnitOfWork.LookupItemRepository.Get().Where(e => e.Company_Id == companyID)
                    .Select(c => new
                    {
                        Id = c.Id,
                        Type = c.Gen_LookupType.Description,
                        Group = (c.Gen_LookupGroup != null ? c.Gen_LookupGroup.Description : ""),
                        Description = c.Description
                    }).ToList();
                int recordCount = LupList.Count;
                if (jtSorting != null)
                {
                    LupList = LupList.OrderBy(jtSorting).ToList();
                }
                LupList = LupList.Skip(jtStartIndex).Take(jtPageSize).ToList();
                return Json(new { Result = "OK", Records = LupList, TotalRecordCount = recordCount });
            }
            catch (Exception e)
            {
                return Json(new { Result = "Error", Message = e.Message });
            }
        }

        #endregion

        #region Create Lookup
        public ActionResult CreateLookup()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var types = UnitOfWork.LookupTypeRepository.Get(u => u.Company_Id == companyId).ToList();
            var groups = UnitOfWork.LookupGroupRepository.Get(u => u.Company_Id == companyId).ToList();
            LookupViewModel lupViewModel = new LookupViewModel(types, groups, null);
            return View(lupViewModel);
        }

        [HttpPost]
        public ActionResult CreateLookup(FormCollection collection)
        {
            Int32 LookupType_Id;
            Int32 LookupGroup_Id;
            String Description;
            bool isOther;
            bool isHidden;

            Int32 Company_Id = UserIdentity.GetCompanyId();
            LookupType_Id = Convert.ToInt32(collection["Lookup.LookupType_Id"]);
            LookupGroup_Id = Convert.ToInt32(collection["Lookup.LookupGroup_Id"]);
            Description = collection["Description"].ToString();
            isOther = collection["Lookup.IsOther"].IndexOf("true") != -1;
            isHidden = collection["Lookup.IsHidden"].IndexOf("true") != -1;

            Int32 LookupID = 0;

            try
            {
                LookupID = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == Company_Id && u.LookupType_Id == LookupType_Id).Select(c => c.Id).Last() + 1;
            }
            catch
            {

            }

            Gen_LookupItem lup;

            lup = new Gen_LookupItem()
            {
                Id = LookupID,
                LookupType_Id = LookupType_Id,
                LookupGroup_Id = LookupGroup_Id,
                Description = Description,
                IsOther = isOther,
                IsHidden = isHidden,
                Company_Id = UserIdentity.GetCompanyId(),
                User_Id = UserIdentity.GetUserId(),
                Last_update = DateTime.Now
            };

            checkLookupFields(lup, true, Company_Id);

            if (ModelState.IsValid)
            {
                UnitOfWork.LookupItemRepository.Insert(lup);
                UnitOfWork.Save();
                return RedirectToAction("LookupList");
            }

            var types = UnitOfWork.LookupTypeRepository.Get(u => u.Company_Id == Company_Id).ToList();
            var groups = UnitOfWork.LookupGroupRepository.Get(u => u.Company_Id == Company_Id).ToList();
            LookupViewModel lupViewModel = new LookupViewModel(types, groups, null);
            return View(lupViewModel);
        }


        private void checkLookupFields(Gen_LookupItem lup, Boolean isCreate, Int32 companyId)
        {
            if (lup.LookupType_Id == 0)
                ModelState.AddModelError("Category.LookupType_Id", "Enter a valid Lookup type");
            if (String.IsNullOrEmpty(lup.Description))
                ModelState.AddModelError("Category.Description", "Enter a valid Lookup description");
        }
        #endregion

        #region Edit Lookup
        public ActionResult EditLookup(Int32 id)
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var types = UnitOfWork.LookupTypeRepository.Get(u => u.Company_Id == companyId).ToList();
            var groups = UnitOfWork.LookupGroupRepository.Get(u => u.Company_Id == companyId).ToList();
            var lup = UnitOfWork.LookupItemRepository.Get(u => u.Company_Id == companyId && u.Id == id).FirstOrDefault();
            LookupViewModel lupViewModel = new LookupViewModel(types, groups, lup);
            return View(lupViewModel);
        }

        [HttpPost]
        public ActionResult EditLookup(FormCollection collection)
        {
            Int32 LookupType_Id;
            Int32 LookupGroup_Id;
            String Description;
            bool isOther;
            bool isHidden;

            Int32 id;
            Int32 companyId = UserIdentity.GetCompanyId();
            LookupType_Id = Convert.ToInt32(collection["Lookup.LookupType_Id"]);
            LookupGroup_Id = Convert.ToInt32(collection["Lookup.LookupGroup_Id"]);
            id = Convert.ToInt32(collection["Lookup.Id"]);
            Description = collection["Description"].ToString();
            isOther = collection["Lookup.IsOther"].IndexOf("true") != -1;
            isHidden = collection["Lookup.IsHidden"].IndexOf("true") != -1;

            Gen_LookupItem lup = UnitOfWork.LookupItemRepository.Get(u => u.Id == id && u.Company_Id == companyId).FirstOrDefault();

            lup.LookupType_Id = LookupType_Id;
            lup.LookupGroup_Id = LookupGroup_Id;
            lup.Description = Description;
            lup.IsOther = isOther;
            lup.IsHidden = isHidden;

            checkLookupFields_Edit(lup, true, companyId);

            if (ModelState.IsValid)
            {
                UnitOfWork.LookupItemRepository.Update(lup);
                UnitOfWork.Save();
                return RedirectToAction("LookupList");
            }

            var types = UnitOfWork.LookupTypeRepository.Get(u => u.Company_Id == companyId).ToList();
            var groups = UnitOfWork.LookupGroupRepository.Get(u => u.Company_Id == companyId).ToList();
            LookupViewModel lupViewModel = new LookupViewModel(types, groups, null);
            return View(lupViewModel);
        }


        private void checkLookupFields_Edit(Gen_LookupItem lup, Boolean isCreate, Int32 companyId)
        {
            if (lup.LookupType_Id == 0)
                ModelState.AddModelError("Category.LookupType_Id", "Enter a valid Lookup type");
            if (String.IsNullOrEmpty(lup.Description))
                ModelState.AddModelError("Category.Description", "Enter a valid Lookup description");
        }
        #endregion

        #region Document Upload
        public ActionResult DocumentUpload()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var items = UnitOfWork.MaterialMasterRepository.Get(u => u.Company_Id == companyId).ToList();
            DocumentViewModel docViewModel = new DocumentViewModel(items, null);
            return View(docViewModel);
        }

        [HttpPost]
        public ActionResult DocumentUpload(FormCollection collection)
        {
            Int32 ItemID;
            String DocumentPath;
            String Description;

            Int32 companyId = UserIdentity.GetCompanyId();
            ItemID = Convert.ToInt32(collection["Documents.Item_Id"]);
            Description = collection["Description"].ToString();

            Int32 ID;

            try
            {
                Int32 preID = UnitOfWork.MaterialDocumentRepository.Get(u => u.Company_Id == companyId && u.Item_Id == ItemID).Select(c => c.version).Last();
                ID = preID + 1;
            }
            catch
            {
                Int32 preID = 0;
                ID = preID + 1;
            }

            //File Upload Begin
            var file = Request.Files[0];
            string path = AppDomain.CurrentDomain.BaseDirectory + "Documents/";
            var fileName = Path.GetFileName(file.FileName);
            var UploadfileName = Path.GetFileName(DateTime.Now.ToString("m-d-yy hh:mm:ss") + " " + fileName);
            var Uploadpath = Path.Combine(path, UploadfileName);
            file.SaveAs(Uploadpath);
            //File Upload End

            DocumentPath = "http://localhost:4204/Documents/" + UploadfileName;

            Inv_MaterialDocument doc;

            doc = new Inv_MaterialDocument()
            {
                Item_Id = ItemID,
                Document_Path = DocumentPath,
                Description = Description,
                version = ID,
                FromDT = DateTime.Now,
                Company_Id = UserIdentity.GetCompanyId(),
                User_Id = UserIdentity.GetUserId(),
                Last_Updated = DateTime.Now
            };

            checkDocFields(doc, true, companyId);

            if (ModelState.IsValid)
            {
                UnitOfWork.MaterialDocumentRepository.Insert(doc);
                UnitOfWork.Save();

                return RedirectToAction("DocumentList");
            }

            var items = UnitOfWork.MaterialMasterRepository.Get(u => u.Company_Id == companyId).ToList();
            DocumentViewModel docViewModel = new DocumentViewModel(items, null);
            return View(docViewModel);
        }

        private void checkDocFields(Inv_MaterialDocument doc, Boolean isCreate, Int32 companyId)
        {
            if (doc.Document_Path == "http://localhost:4204/Documents/" + DateTime.Now.ToString("m-d-yy hh-mm") + " ")
                ModelState.AddModelError("Document.Document_Path", "Select a Document");
        }
        #endregion

        #region Document List
        public ActionResult DocumentList()
        {
            if (UserIdentity.GetUserName() == null)
                return RedirectToAction("Login", "Account");
            var companyId = UserIdentity.GetCompanyId();
            List<Inv_MaterialDocument> doclList = UnitOfWork.MaterialDocumentRepository.Get(u => u.Company_Id == companyId).ToList();
            return View(doclList);
        }
        #endregion

        #region Misc Receipt

        //Fetch item details
        public JsonResult FetchItemJSON(String itemCode)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;
            String itemDescription = String.Empty, BatchFlag = string.Empty, SerialFlag = string.Empty;

            Inv_MaterialMaster Item = UnitOfWork.MaterialMasterRepository.Get(u => u.Code == itemCode).FirstOrDefault();

            if (Item != null)
            {
                id = Item.Id;
                itemDescription = Item.Description;
                BatchFlag = Item.Batch_YN.ToString();
                SerialFlag = Item.Serial_YN.ToString();

                return Json(new { success = true, id = id, ItemDescription = itemDescription, ItemCode = itemCode, SerialFlag = SerialFlag, flag = BatchFlag }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = true, id = 0, ItemDescription = "", SerialFlag = "true", flag = "true" }, JsonRequestBehavior.AllowGet);
        }

        //Fetch warehouse details
        public JsonResult FetchWarehouseJSON(String WarehouseCode)
        {
            var companyId = UserIdentity.GetCompanyId();

            Int32 id = 0;

            Inv_WarehouseMaster warehouse = UnitOfWork.WarehouseRepository.Get(u => u.Code == WarehouseCode).FirstOrDefault();
            if (warehouse != null)
            {
                id = warehouse.Id;
                return Json(new { success = true, id = id, code = WarehouseCode }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new { success = true, id = 0, code = "" }, JsonRequestBehavior.AllowGet);
        }

        //Generate new document code
        public JsonResult FetchDocnoJSON(String doccode, string trans_type)
        {
            var companyId = UserIdentity.GetCompanyId();

            decimal DocNum = 0;

            Inv_DocumentMaster Doc;

            Doc = UnitOfWork.DocumentMasterRepository.Get(u => u.DOC_CODE == doccode).FirstOrDefault();

            if (Doc != null)
            {
                DocNum = Doc.LAST_NO + 1;
            }

            return Json(new { success = true, currno = DocNum }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult MiscReceipt()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var docs = UnitOfWork.DocumentMasterRepository.Get(u => u.COMPANY_ID == companyId).ToList();
            MiscReceiptViewModel miscViewModel = new MiscReceiptViewModel(docs, null);
            return View(miscViewModel);
        }

        public ActionResult MiscIssue()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            var docs = UnitOfWork.DocumentMasterRepository.Get(u => u.COMPANY_ID == companyId).ToList();
            MiscIssueViewModel miscViewModel = new MiscIssueViewModel(docs, null);
            return View(miscViewModel);
        }

        public ActionResult ItemSearch(string term)
        {
            var itemList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            try { existingList = (string[])Session["ItemList"]; }
            catch { }

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                itemList = UnitOfWork.MaterialMasterRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Code).ToArray();
                Session["ItemList"] = itemList;
                existingList = (string[])Session["ItemList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        public ActionResult WarehouseSearch(string term)
        {
            var warehouseList = new string[] { }.ToArray();
            string[] existingList = new string[] { }.ToArray();

            try { existingList = (string[])Session["WarehouseList"]; }
            catch { }

            if (existingList == null)
            {
                Int32 companyId = UserIdentity.GetCompanyId();
                warehouseList = UnitOfWork.WarehouseRepository.Get(u => u.Company_Id == companyId).ToList()
                    .Select(i => i.Code).ToArray();
                Session["WarehouseList"] = warehouseList;
                existingList = (string[])Session["WarehouseList"];
            }

            List<string> tag = new List<string>(existingList);

            return this.Json(tag.Where(i => i.ToUpper().StartsWith(term.ToUpper())),
                    JsonRequestBehavior.AllowGet);
        }

        private String SaveMiscReceiptDetail(MiscReceiptSubmitModel data)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Inv_StockTran InvStockTrans;
                    Inv_StockTranSlNo InvStockTranslno;
                    Inv_StockMaster InvStockMaster;
                    Inv_StockMasterSlNo InvStockMasterSlNo;
                    Inv_DocumentMaster InvDocumentMaster;
                    decimal DocNum = 0;

                    InvDocumentMaster = UnitOfWork.DocumentMasterRepository.Get(u => u.DOC_CODE == data.DocCode).FirstOrDefault();

                    if (InvDocumentMaster != null)
                    {
                        DocNum = InvDocumentMaster.LAST_NO + 1;
                    }

                    List<ItemDetails> ItemDetails = data.ItemDetail.ToList();
                    List<SerialNoDetails> SerialNoDetails = data.SerialNoDetail.ToList();

                    Int32 Company_Id = UserIdentity.GetCompanyId();

                    foreach (ItemDetails ItemList in ItemDetails)
                    {
                        InvStockTrans = new Inv_StockTran()
                        {
                            DOC_CODE = data.DocCode,
                            DOC_NUM = DocNum,
                            DOC_DATE = data.DocDate,
                            TRANS_TYPE = data.TransType,
                            REF_NO = data.RefNum,
                            REF_DT = data.RefDate,
                            NOTES = ItemList.Notes,
                            ITEM_ID = ItemList.ItemID,
                            WHS_ID = ItemList.WareHouseID,
                            BATCH_NO = ItemList.BatchNum,
                            REC_QTY = ItemList.Quantity,
                            USER_ID = UserIdentity.GetUserId(),
                            LAST_UPDATED = DateTime.Now
                        };

                        UnitOfWork.StockTransRepository.Insert(InvStockTrans);

                        try
                        {
                            InvStockMaster = UnitOfWork.StockMasterRepository.Get(u => u.COMPANY_ID == Company_Id && u.ITEM_ID == ItemList.ItemID && u.WHS_ID == ItemList.WareHouseID && u.BATCH_NO == ItemList.BatchNum).FirstOrDefault();
                        }
                        catch
                        {
                            InvStockMaster = null;
                        }

                        if (InvStockMaster == null)
                        {
                            InvStockMaster = new Inv_StockMaster()
                            {
                                ITEM_ID = ItemList.ItemID,
                                WHS_ID = ItemList.WareHouseID,
                                BATCH_NO = ItemList.BatchNum,
                                OB_DT = data.DocDate,
                                OB_QTY = ItemList.Quantity,
                                CB_QTY = ItemList.Quantity,
                                NOTES = ItemList.Notes,
                                COMPANY_ID = Company_Id,
                                USER_ID = UserIdentity.GetUserId(),
                                LAST_UPDATED = DateTime.Now
                            };

                            UnitOfWork.StockMasterRepository.Insert(InvStockMaster);
                        }
                        else
                        {
                            InvStockMaster.CB_QTY = InvStockMaster.CB_QTY + ItemList.Quantity;
                            InvStockMaster.NOTES = ItemList.Notes;
                            InvStockMaster.USER_ID = UserIdentity.GetUserId();
                            InvStockMaster.LAST_UPDATED = DateTime.Now;

                            UnitOfWork.StockMasterRepository.Update(InvStockMaster);
                        }

                        foreach (SerialNoDetails SerialNumList in SerialNoDetails)
                        {
                            InvStockTranslno = new Inv_StockTranSlNo()
                            {
                                DOC_CODE = data.DocCode,
                                DOC_NUM = data.DocNum,
                                DOC_DATE = data.DocDate,
                                ITEM_ID = SerialNumList.ItemID,
                                WHS_ID = SerialNumList.WareHouseID,
                                BATCH_NO = SerialNumList.BatchNum,
                                REC_QTY = SerialNumList.Quantity,
                                SERIAL_NO = SerialNumList.SerialNo
                            };

                            UnitOfWork.StockTranslnoRepository.Insert(InvStockTranslno);

                            InvStockMasterSlNo = UnitOfWork.StockMasterSlNoRepository.Get(u => u.ITEM_ID == SerialNumList.ItemID && u.WHS_ID == SerialNumList.WareHouseID && u.BATCH_NO == SerialNumList.BatchNum && u.SERIAL_NO == SerialNumList.SerialNo).FirstOrDefault();

                            if (InvStockMasterSlNo == null)
                            {
                                InvStockMasterSlNo = new Inv_StockMasterSlNo()
                                {
                                    ITEM_ID = SerialNumList.ItemID,
                                    WHS_ID = SerialNumList.WareHouseID,
                                    BATCH_NO = SerialNumList.BatchNum,
                                    SERIAL_NO = SerialNumList.SerialNo,
                                    CB_QTY = 1
                                };

                                UnitOfWork.StockMasterSlNoRepository.Insert(InvStockMasterSlNo);
                            }
                            else
                            {
                                InvStockMasterSlNo.CB_QTY = InvStockMasterSlNo.CB_QTY + 1;

                                UnitOfWork.StockMasterSlNoRepository.Update(InvStockMasterSlNo);
                            }
                        }
                    }

                    InvDocumentMaster = UnitOfWork.DocumentMasterRepository.Get(u => u.DOC_CODE == data.DocCode).FirstOrDefault();

                    InvDocumentMaster.LAST_NO = data.DocNum;

                    UnitOfWork.Save();

                    return "success";
                }
                catch(Exception ex)
                {
                    return ex.Message;
                }
            }
            else
                return "Validation failed";
        }

        [HttpPost]
        public JsonResult Receipt_Save(MiscReceiptSubmitModel data)
        {
            string Message = "";

            Message = SaveMiscReceiptDetail(data);

            return Json(new { message = Message }, JsonRequestBehavior.AllowGet);
        }

        #endregion

    }
}