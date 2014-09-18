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
    
    public partial class Gen_CompanyMaster
    {
        public Gen_CompanyMaster()
        {
            this.FAS_AccountMaster = new HashSet<FAS_AccountMaster>();
            this.Gen_BranchMaster = new HashSet<Gen_BranchMaster>();
            this.Gen_LookupType = new HashSet<Gen_LookupType>();
            this.Inv_CategoryMaster = new HashSet<Inv_CategoryMaster>();
            this.Inv_MaterialBranchSpec = new HashSet<Inv_MaterialBranchSpec>();
            this.Inv_MaterialDiscount = new HashSet<Inv_MaterialDiscount>();
            this.Inv_MaterialNotes = new HashSet<Inv_MaterialNotes>();
            this.Inv_MaterialPackaging = new HashSet<Inv_MaterialPackaging>();
            this.Inv_MaterialPrice = new HashSet<Inv_MaterialPrice>();
            this.Inv_MaterialSupplier = new HashSet<Inv_MaterialSupplier>();
            this.Inv_WarehouseMaster = new HashSet<Inv_WarehouseMaster>();
            this.Inv_MaterialBOM = new HashSet<Inv_MaterialBOM>();
            this.Inv_MaterialBranch = new HashSet<Inv_MaterialBranch>();
            this.Gen_UserMaster = new HashSet<Gen_UserMaster>();
            this.Inv_MaterialCategory = new HashSet<Inv_MaterialCategory>();
            this.Inv_MaterialSpecification = new HashSet<Inv_MaterialSpecification>();
            this.Gen_LookupItem = new HashSet<Gen_LookupItem>();
            this.Gen_LookupGroup = new HashSet<Gen_LookupGroup>();
            this.Inv_MaterialSpares = new HashSet<Inv_MaterialSpares>();
            this.Inv_MaterialMaster = new HashSet<Inv_MaterialMaster>();
            this.Inv_MaterialAlternateRelative = new HashSet<Inv_MaterialAlternateRelative>();
        }
    
        public int Id { get; set; }
        public string Company_Code { get; set; }
        public string Company_Description { get; set; }
        public string Status { get; set; }
    
        public virtual ICollection<FAS_AccountMaster> FAS_AccountMaster { get; set; }
        public virtual ICollection<Gen_BranchMaster> Gen_BranchMaster { get; set; }
        public virtual ICollection<Gen_LookupType> Gen_LookupType { get; set; }
        public virtual ICollection<Inv_CategoryMaster> Inv_CategoryMaster { get; set; }
        public virtual ICollection<Inv_MaterialBranchSpec> Inv_MaterialBranchSpec { get; set; }
        public virtual ICollection<Inv_MaterialDiscount> Inv_MaterialDiscount { get; set; }
        public virtual ICollection<Inv_MaterialNotes> Inv_MaterialNotes { get; set; }
        public virtual ICollection<Inv_MaterialPackaging> Inv_MaterialPackaging { get; set; }
        public virtual ICollection<Inv_MaterialPrice> Inv_MaterialPrice { get; set; }
        public virtual ICollection<Inv_MaterialSupplier> Inv_MaterialSupplier { get; set; }
        public virtual ICollection<Inv_WarehouseMaster> Inv_WarehouseMaster { get; set; }
        public virtual ICollection<Inv_MaterialBOM> Inv_MaterialBOM { get; set; }
        public virtual ICollection<Inv_MaterialBranch> Inv_MaterialBranch { get; set; }
        public virtual ICollection<Gen_UserMaster> Gen_UserMaster { get; set; }
        public virtual ICollection<Inv_MaterialCategory> Inv_MaterialCategory { get; set; }
        public virtual ICollection<Inv_MaterialSpecification> Inv_MaterialSpecification { get; set; }
        public virtual ICollection<Gen_LookupItem> Gen_LookupItem { get; set; }
        public virtual ICollection<Gen_LookupGroup> Gen_LookupGroup { get; set; }
        public virtual ICollection<Inv_MaterialSpares> Inv_MaterialSpares { get; set; }
        public virtual ICollection<Inv_MaterialMaster> Inv_MaterialMaster { get; set; }
        public virtual ICollection<Inv_MaterialAlternateRelative> Inv_MaterialAlternateRelative { get; set; }
    }
}
