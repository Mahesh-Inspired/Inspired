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
    
    public partial class Inv_StockTranSlNo
    {
        public string DOC_CODE { get; set; }
        public decimal DOC_NUM { get; set; }
        public Nullable<System.DateTime> DOC_DATE { get; set; }
        public int ITEM_ID { get; set; }
        public int WHS_ID { get; set; }
        public string BATCH_NO { get; set; }
        public string SERIAL_NO { get; set; }
        public Nullable<decimal> REC_QTY { get; set; }
        public Nullable<decimal> ISS_QTY { get; set; }
        public decimal ID { get; set; }
    
        public virtual Inv_MaterialMaster Inv_MaterialMaster { get; set; }
        public virtual Inv_WarehouseMaster Inv_WarehouseMaster { get; set; }
    }
}