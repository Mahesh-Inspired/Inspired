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
    
    public partial class Inv_MaterialSupplier
    {
        public int Id { get; set; }
        public int Item_Id { get; set; }
        public int Supplier_Code { get; set; }
        public string Ref_Number { get; set; }
        public Nullable<int> Min_Order { get; set; }
        public string Notes { get; set; }
        public int Currency { get; set; }
        public decimal Cost { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime Last_Updated { get; set; }
    
        public virtual FAS_AccountMaster FAS_AccountMaster { get; set; }
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Gen_LookupItem Gen_LookupItem { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
    }
}