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
    
    public partial class Gen_LookupGroup
    {
        public Gen_LookupGroup()
        {
            this.Gen_LookupItem = new HashSet<Gen_LookupItem>();
        }
    
        public int Id { get; set; }
        public int LookupType_Id { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime Last_Updated { get; set; }
    
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual ICollection<Gen_LookupItem> Gen_LookupItem { get; set; }
    }
}