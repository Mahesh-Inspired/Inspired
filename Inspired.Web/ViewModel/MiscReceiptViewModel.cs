using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class MiscReceiptViewModel
    {
        //header

        public SelectList doc_code { get; set; }
        public string doc_num { get; set; }
        public string doc_date { get; set; }
        public string trans_type { get; set; }
        public string ref_num { get; set; }
        public string ref_date { get; set; }

        //detail

        public string item_code { get; set; }
        public string item_desc { get; set; }
        public string ware_house { get; set; }
        public string batch_num { get; set; }
        public string quantity { get; set; }
        public string notes { get; set; }

        public Inv_StockTran Stock { get; set; }

        #region constructor
        public MiscReceiptViewModel(IEnumerable<Inv_DocumentMaster> docs, Inv_StockTran stock)
        {
            doc_code = new SelectList(docs.Where(u=>u.TRANS_TYPE == "MiscReciept").ToList(), "DOC_CODE", "DOC_DESC");
            doc_date = DateTime.Now.Date.ToString();
            ref_date = DateTime.Now.Date.ToString();
            Stock = stock;
        }
        #endregion
    }
}