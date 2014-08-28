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

namespace Inspired.Web.Controllers
{

    [Authorize]
    public class InventoryController : ControllerBase
    {

        #region Constructor
        public InventoryController(IUnitOfWork unitOfWork, IUserIdentity userIdentity)
            : base(unitOfWork, userIdentity)
        { }
        #endregion

        //public ActionResult Index()
        //{
        //    return View();
        //}
        //// just a test page to do TDD
        //public ActionResult ListCategory()
        //{

        //    if (UserIdentity.GetUserName() == null)
        //        return RedirectToAction("Login", "Account");
        //    IEnumerable<Inv_CategoryMaster> catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == UserIdentity.GetCompanyId());
        //    return View(catList);
        //}


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
                var catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == companyID )
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
            if(isCreate && !String.IsNullOrEmpty(cat.Code) && 
                UnitOfWork.CategoryMasterRepository.Get(u=>u.Company_Id == companyId && u.Code == cat.Code && u.Type == cat.Type).Count() > 0 )
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

        //[HttpPost]
        //public JsonResult MaterialList(int jtStartIndex = 0, int jtPageSize = 0, String jtSorting = null)
        //{

        //    try
        //    {
        //        var companyId = UserIdentity.GetCompanyId();
        //        var itemList = UnitOfWork.MaterialMasterRepository.Get().Where(e => e.Company_Id == companyId)
        //            .Select(c => new
        //            {
        //                Id = c.Id,
        //                Category = "",//c.Inv_MaterialCategory.Where(d => d.Category_Type == Core.Global.LookupItem_Category).FirstOrDefault().Inv_CategoryMaster.Description,
        //                Code = c.Code,
        //                Description = c.Description,
        //                Status = (c.Status == "A" ? "Active" : "Passive")
        //            }).ToList();
        //        int recordCount = itemList.Count;
        //       if (jtSorting != null)
        //       {
        //           itemList = itemList.OrderBy(jtSorting).ToList();
        //       }
        //       itemList = itemList.Skip(jtStartIndex).Take(jtPageSize).ToList();
        //       return Json(new { Result = "OK", Records = itemList, TotalRecordCount = recordCount });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { Result = "Error", Message = e.Message });
        //    }

            
        //}

        #endregion

        #region Create Material        
        public ActionResult CreateMaterial()
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            IEnumerable<Gen_LookupItem> catTypes = UnitOfWork.LookupItemRepository.Get(u => u.LookupType_Id == Core.Global.LookupType_Category && u.Company_Id == companyId).ToList();
            IEnumerable<Gen_LookupItem> statuses = UnitOfWork.LookupItemRepository.Get(l => l.LookupType_Id == Core.Global.LookupType_Status).ToList();
            MaterialViewModel material = new MaterialViewModel(catTypes, statuses, null);
            return View(material);
        }
        #endregion

        #region Edit Material
        public ActionResult EditMaterial(Int32 itemId)
        {
            Int32 companyId = UserIdentity.GetCompanyId();
            List<Gen_LookupItem> catTypes = UnitOfWork.LookupItemRepository.Get(u => u.LookupType_Id == Core.Global.LookupType_Category && u.Company_Id == companyId).ToList();
            IEnumerable<Gen_LookupItem> statuses = UnitOfWork.LookupItemRepository.Get(l => l.LookupType_Id == Core.Global.LookupType_Status).ToList();
            Inv_MaterialMaster item = UnitOfWork.MaterialMasterRepository.Get(m => m.Id == itemId).FirstOrDefault();

            // Remove the Categories that already exist in Material Category
            foreach (Inv_MaterialCategory matCat in item.Inv_MaterialCategory)
                catTypes.Remove(catTypes.Where(u => u.Id == matCat.Category_Type).First());
            
            MaterialViewModel material = new MaterialViewModel(catTypes, statuses, item);
            return View("CreateMaterial", material);
        }
        #endregion
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
                material.Company_Id = companyId;                            
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

            var materialCategoryFlg = SaveItemCategory(data.ItemCategory.ToList(), ref material, companyId);
            
            if (data.Id != 0)
                UnitOfWork.MaterialMasterRepository.Update(material);
            else
                UnitOfWork.MaterialMasterRepository.Insert(material);
            
            UnitOfWork.Save();
            

            return true;
        }

        private Boolean SaveItemCategory(List<MaterialCategory> newCategories,ref Inv_MaterialMaster material, Int32 companyId)
        {
            Inv_MaterialCategory invMaterialCategory;
            // Delete the existing Inv_MaterialCategory details
            foreach(Inv_MaterialCategory tmpCat in material.Inv_MaterialCategory.ToList())
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

    
        [HttpPost]
        public JsonResult SaveMaterial(MaterialSubmitModel data)
        {

            Boolean canContinue = false;

                canContinue = SaveMaterialDetails(data);
            
            
            return Json(new { success = canContinue}, JsonRequestBehavior.AllowGet);
        }
        #region JSon Fetch details

        public JsonResult fetchCategoryJSON(Int32? catType, String catCode) 
        {
            Int32 id =0;
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

    }
}