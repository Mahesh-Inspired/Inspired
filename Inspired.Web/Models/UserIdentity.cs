using System;
using System.Linq;
using System.Web;
using Utilities.MVC;
using Inspired.Repository;
using Inspired.Data;

namespace Inspired.Web.Models
{
    class UserIdentity : IUserIdentity
    { 
        public int GetUserId()
        {            
            throw new NotImplementedException();
        }

        public string GetUserName()
        {
            return HttpContext.Current.User.Identity.Name;
        }

        public int GetCompanyId()
        {
            IUnitOfWork unitOfWork = new UnitOfWork();
            Gen_UserMaster currentUser = unitOfWork.UserMasterRepository.Get(e => e.UserName == HttpContext.Current.User.Identity.Name).FirstOrDefault();
            return currentUser.Company_Id;          
        }

        public int? GetBranchId()
        {
            IUnitOfWork unitOfWork = new UnitOfWork();
            Gen_UserMaster currentUser = unitOfWork.UserMasterRepository.Get(e => e.UserName == HttpContext.Current.User.Identity.Name).FirstOrDefault();
            return currentUser.Branch_Id;
        }
    }
}
