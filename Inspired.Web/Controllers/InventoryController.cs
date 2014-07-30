using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;
using Inspired.Repository;

namespace Inspired.Web.Controllers
{
    public class InventoryController : Controller
    {
        //
        // GET: /Default1/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListCategory()
        {
            UnitOfWork unit = new UnitOfWork();
            IEnumerable<Inv_CategoryMaster> catList = unit.CategoryMasterRepository.Get();
            return View(catList);
        }
	}
}