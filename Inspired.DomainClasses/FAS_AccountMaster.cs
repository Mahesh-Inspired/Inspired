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
    
    public partial class FAS_AccountMaster
    {
        public FAS_AccountMaster()
        {
            this.Inv_MaterialDiscount = new HashSet<Inv_MaterialDiscount>();
            this.Inv_MaterialNotes = new HashSet<Inv_MaterialNotes>();
            this.Inv_MaterialPrice = new HashSet<Inv_MaterialPrice>();
            this.Inv_MaterialSupplier = new HashSet<Inv_MaterialSupplier>();
        }
    
        public int Accd_Key { get; set; }
        public string Acc_Code { get; set; }
        public string Acc_Description { get; set; }
        public int Acc_Type { get; set; }
        public Nullable<int> Price_Type { get; set; }
        public int Company_Id { get; set; }
        public int Branch_Id { get; set; }
    
        public virtual Gen_BranchMaster Gen_BranchMaster { get; set; }
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Gen_LookupItem Gen_LookupItem { get; set; }
        public virtual ICollection<Inv_MaterialDiscount> Inv_MaterialDiscount { get; set; }
        public virtual ICollection<Inv_MaterialNotes> Inv_MaterialNotes { get; set; }
        public virtual ICollection<Inv_MaterialPrice> Inv_MaterialPrice { get; set; }
        public virtual ICollection<Inv_MaterialSupplier> Inv_MaterialSupplier { get; set; }
    }
}
