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
        #region Alternate Relative
        public static Int32 LookupType_AlternateRelative = 3;

        public static Int32 LookupItem_Alternate = 20;
        public static Int32 LookupItem_Relative = 21;
        #endregion

        #region Specification
                
        public static Int32 LookupType_Specification = 4;

        #endregion

        #region Currency
        
        public static Int32 LookupType_Currency = 5;

        public static Int32 LookupItem_GBP = 25;
        public static Int32 LookupItem_EURO = 26;

        #endregion

        #region Notes Type

        public static Int32 LookupType_NotesType = 6;

        public static Int32 LookupItem_Internal = 35;
        public static Int32 LookupItem_External = 36;
        public static Int32 LookupItem_Secretive = 37;

        #endregion

        #region Notes Priority

        public static Int32 LookupType_NotesPriority = 7;


        public static Int32 LookupItem_Critical = 45;
        public static Int32 LookupItem_Information = 46;
        public static Int32 LookupItem_GeneralNotes = 47;
        #endregion
    }
}