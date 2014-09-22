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


        #region YesNo

        public static Int32 LookupType_YesNo = 3;

        public static Int32 LookupItem_Yes = 20;
        public static Int32 LookupItem_No = 21;

        #endregion

        #region Specification
                
        public static Int32 LookupType_Specification = 4;

        #endregion

        #region Alternate Relative
        public static Int32 LookupType_AlternateRelative = 5;

        public static Int32 LookupItem_Alternate = 25;
        public static Int32 LookupItem_Relative = 26;
        #endregion

        #region Currency
        public static Int32 LookupType_Currency = 6;

        public static Int32 LookupItem_GBP = 50;
        public static Int32 LookupItem_EURO = 51;

        #endregion
    }
}