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
    
    public partial class Inv_MaterialSpares
    {
        public int Item_Id { get; set; }
        public int Spare_Id { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public string Overview { get; set; }
        public int Company_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime Last_Updated { get; set; }
    
        public virtual Gen_CompanyMaster Gen_CompanyMaster { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
        public virtual Inv_MaterialMaster Inv_MaterialMaster1 { get; set; }
    }
}
