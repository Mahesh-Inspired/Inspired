//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inspired.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Inv_CategoryMaster
    {
        public int Id { get; set; }
        public int Type { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime Last_Updated { get; set; }
    
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Gen_LookupItem Gen_LookupItem { get; set; }
    }
}