using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;
using Inspired.Repository;
using Utilities.MVC;

namespace Inspired.Web.Controllers
{
    public class InventoryController : ControllerBase
    {

        #region Constructor
            public InventoryController(IUnitOfWork unitOfWork, IUserIdentity userIdentity):base(unitOfWork, userIdentity)
            { }
        #endregion

        //
        // GET: /Default1/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListCategory()
        {

            if (String.IsNullOrEmpty(UserIdentity.GetUserName()))
                return RedirectToAction("Login", "Account");                              
            IEnumerable<Inv_CategoryMaster> catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == UserIdentity.GetCompanyId());
            return View(catList);            
        }
	}
}