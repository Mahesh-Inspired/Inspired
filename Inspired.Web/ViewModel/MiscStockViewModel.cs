using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Inspired.Web.ViewModel
{
    public class MiscStockViewModel
    {
        //header
        public SelectList ReceiptDocCode { get; set; }
        public SelectList IssueDocCode { get; set; }
        public string DocNum { get; set; }
        public string DocDate { get; set; }
        public string TransType { get; set; }
        public string RefNum { get; set; }
        public string RefDate { get; set; }

        //detail
        public Int32 ItemID { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string WareHouseID { get; set; }
        public string WareHouse { get; set; }
        public string BatchNum { get; set; }
        public Int32 CurrentStock { get; set; }
        public string NegativeStock { get; set; }
        public decimal Quantity { get; set; }
        public string Notes { get; set; }

        public string SerialNo { get; set; }
        public string SerialNoFlag { get; set; }

        public Inv_StockTran Stock { get; set; }

        #region constructor
        public MiscStockViewModel(IEnumerable<Inv_DocumentMaster> docs, Inv_StockTran stock)
        {
            ReceiptDocCode = new SelectList(docs.Where(u => u.TRANS_TYPE == "MiscReciept").ToList(), "DOC_CODE", "DOC_CODE");
            IssueDocCode = new SelectList(docs.Where(u => u.TRANS_TYPE == "MiscIssues").ToList(), "DOC_CODE", "DOC_CODE");
            DocDate = DateTime.Now.Date.ToString();
            RefDate = DateTime.Now.Date.ToString();
            Stock = stock;
        }
        #endregion
    }
}