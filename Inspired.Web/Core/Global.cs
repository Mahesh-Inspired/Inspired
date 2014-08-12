using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inspired.Web.Core
{
    public class Global
    {
        #region Statuses lookup

        public static Int32 LookupType_Status = 1;

        public static Int32 LookupItem_Active = 1; // Active
        public static Int32 LookupItem_Passive = 2; // Passive
        public static Int32 LookupItem_Temp = 3; // Temporary

        #endregion

        #region Category Lookup details

        public static Int32 LookupType_Category = 2;
        
        public static Int32 LookupItem_Group = 10; 
        public static Int32 LookupItem_Type = 11;
        public static Int32 LookupItem_Category = 12;
        public static Int32 LookupItem_SubCategory = 13;
        public static Int32 LookupItem_Make = 14;

        #endregion
    }
}