using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
namespace Inspired.Web.ViewModel
{
    public class MiscIssueViewModel
    {
        //header
        public SelectList DocCode { get; set; }
        public string DocNum { get; set; }

        [DataType(DataType.Date, ErrorMessage = "Enter Valid Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public string DocDate { get; set; }
        public string TransType { get; set; }

        [Required(ErrorMessage = "Description Required")]
        [MaxLength(250)]
        [RegularExpression(@"^([a-zA-Z0-9 \.\&\'\-]+)$", ErrorMessage = "Invalid Description")]
        public string RefNum { get; set; }

        [DataType(DataType.Date, ErrorMessage = "Enter Valid Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public string RefDate { get; set; }

        //detail
        public Int32 ItemID { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string WareHouseID { get; set; }
        public string WareHouse { get; set; }
        public string BatchNum { get; set; }
        public string CurrentStock { get; set; }
        public decimal Quantity { get; set; }
        public string Notes { get; set; }

        public string SerialNo { get; set; }
        public string SerialNoFlag { get; set; }

        public Inv_StockTran Stock { get; set; }

        #region constructor
        public MiscIssueViewModel(IEnumerable<Inv_DocumentMaster> docs, Inv_StockTran stock)
        {
            DocCode = new SelectList(docs.Where(u => u.TRANS_TYPE == "MiscIssues").ToList(), "DOC_CODE", "DOC_DESC");
            DocDate = DateTime.Now.Date.ToString();
            RefDate = DateTime.Now.Date.ToString();
            Stock = stock;
        }
        #endregion
    }
}