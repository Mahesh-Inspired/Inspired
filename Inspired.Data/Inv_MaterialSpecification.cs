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
    
    public partial class Inv_MaterialSpecification
    {
        public Inv_MaterialSpecification()
        {
            this.Inv_MaterialBranchSpec = new HashSet<Inv_MaterialBranchSpec>();
        }
    
        public int Id { get; set; }
        public int Item_Id { get; set; }
        public string Batch_Number { get; set; }
        public int Spec_Id { get; set; }
        public string Spec_Value { get; set; }
        public int Company_Id { get; set; }
        public Nullable<int> User_Id { get; set; }
        public Nullable<System.DateTime> Last_Updated { get; set; }
    
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Gen_LookupItem Gen_LookupItem { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
        public virtual ICollection<Inv_MaterialBranchSpec> Inv_MaterialBranchSpec { get; set; }
    }
}
