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
    
    public partial class Inv_StockMasterSlNo
    {
        public int ITEM_ID { get; set; }
        public int WHS_ID { get; set; }
        public string BATCH_NO { get; set; }
        public string SERIAL_NO { get; set; }
        public decimal CB_QTY { get; set; }
    
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
        public virtual Inv_WarehouseMaster Inv_WarehouseMaster { get; set; }
    }
}
