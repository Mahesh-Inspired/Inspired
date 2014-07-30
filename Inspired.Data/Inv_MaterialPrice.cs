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
    
    public partial class Inv_MaterialPrice
    {
        public int Id { get; set; }
        public Nullable<int> Account_Id { get; set; }
        public int Item_Id { get; set; }
        public int From_Qty { get; set; }
        public int To_Qty { get; set; }
        public int Price_Type { get; set; }
        public decimal Price { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime Last_Updated { get; set; }
    
        public virtual FAS_AccountMaster FAS_AccountMaster { get; set; }
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Gen_LookupItem Gen_LookupItem { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
    }
}
