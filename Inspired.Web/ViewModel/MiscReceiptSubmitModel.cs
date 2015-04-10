using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class MiscReceiptSubmitModel
    {
        public string DocCode { get; set; }
        public decimal DocNum { get; set; }
        public DateTime DocDate { get; set; }
        public string TransType { get; set; }
        public string RefNum { get; set; }
        public DateTime RefDate { get; set; }
        public virtual ICollection<ItemDetails> ItemDetail { get; set; }
        public virtual ICollection<SerialNoDetails> SerialNoDetail { get; set; }

        public class ItemDetails
        {
            public Int32 ItemID { get; set; }
            public string ItemCode { get; set; }
            public string ItemDesc { get; set; }
            public Int32 WareHouseID { get; set; }
            public string WareHouse { get; set; }
            public string BatchNum { get; set; }
            public decimal Quantity { get; set; }
            public string Notes { get; set; }
            public virtual MiscReceiptSubmitModel Receipt { get; set; }
        }

        public class SerialNoDetails
        {
            public Int32 ItemID { get; set; }
            public Int32 WareHouseID { get; set; }
            public string BatchNum { get; set; }
            public string SerialNo { get; set; }
            public decimal Quantity { get; set; }
            public virtual MiscReceiptSubmitModel Receipt { get; set; }
        }

    }
}