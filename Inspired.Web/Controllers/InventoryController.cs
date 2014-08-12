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


        // just a test page to do TDD
        public ActionResult ListCategory()
        {

            if (UserIdentity.GetUserName() == null)
                return RedirectToAction("Login", "Account");
            IEnumerable<Inv_CategoryMaster> catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == UserIdentity.GetCompanyId());
            return View(catList);
        }


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
                var catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == UserIdentity.GetCompanyId())
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
            return View();
        }

        [HttpPost]
        public JsonResult MaterialList(int jtStartIndex = 0, int jtPageSize = 0, String jtSorting = null)
        {

            try
            {
                var itemList = UnitOfWork.MaterialMasterRepository.Get().Where(e => e.Company_Id == UserIdentity.GetCompanyId())
                    .Select(c => new
                    {
                        Id = c.Id,
                        Category = c.Inv_MaterialCategory.Where(d => d.Category_Type == Core.Global.LookupItem_Category).FirstOrDefault().Inv_CategoryMaster.Description,
                        Code = c.Code,
                        Description = c.Description,
                        Status = (c.Status == "A" ? "Active" : "Passive")
                    }).ToList();
                int recordCount = itemList.Count;
               if (jtSorting != null)
               {
                   itemList = itemList.OrderBy(jtSorting).ToList();
               }
               itemList = itemList.Skip(jtStartIndex).Take(jtPageSize).ToList();
               return Json(new { Result = "OK", Records = itemList, TotalRecordCount = recordCount });
            }
            catch (Exception e)
            {
                return Json(new { Result = "Error", Message = e.Message });
            }
        }

        #endregion
    }
}