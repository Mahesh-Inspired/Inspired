//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inspired.DomainClasses
{
    using System;
    using System.Collections.Generic;
    
    public partial class Inv_MaterialAlternateRelative
    {
        public int Id { get; set; }
        public int Item_Id { get; set; }
        public int AR_Item_Id { get; set; }
        public bool AR_Flag { get; set; }
        public string Notes { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public Nullable<System.DateTime> Last_Updated { get; set; }
    
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster1 { get; set; }
    }
}
