using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities.MVC
{
    public interface IUserIdentity
    {
        int GetUserId();
        string GetUserName();

        int GetCompanyId();

        int? GetBranchId();
    }
}
