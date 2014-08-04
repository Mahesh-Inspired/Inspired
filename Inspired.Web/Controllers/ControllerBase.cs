using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Utilities.MVC;
using Inspired.Repository;

namespace Inspired.Web.Controllers
{
    public class ControllerBase : AntiForgeryControllerBase
    {
        protected IUnitOfWork UnitOfWork { get; set; }
        protected IUserIdentity UserIdentity { get; set; }

        public ControllerBase(IUnitOfWork unitOfWork, IUserIdentity userIdentity) {
            UnitOfWork = unitOfWork;
            UserIdentity = userIdentity;
        }
	}
}