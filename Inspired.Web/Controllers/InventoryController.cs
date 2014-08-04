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
            public InventoryController(IUnitOfWork unitOfWork):base(unitOfWork)
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
            
            String userName = HttpContext.User.Identity.Name;
            Gen_UserMaster currentUser = UnitOfWork.UserMasterRepository.Get().Where(e => e.UserName == userName).FirstOrDefault();
            if(currentUser == null)
            {
                HandleErrorInfo error = new HandleErrorInfo(new Exception("INFO: Invalid user"), "Inventory", "ListCategory");
                return View("Error", error);
            }
            IEnumerable<Inv_CategoryMaster> catList = UnitOfWork.CategoryMasterRepository.Get().Where(e => e.Company_Id == currentUser.Company_Id);
            return View(catList);
        }
	}
}