using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class DocumentViewModel
    {
        public SelectList Items { get; set; }
        public Inv_MaterialDocument Documents { get; set; }

        #region constructor
        public DocumentViewModel(IEnumerable<Inv_MaterialMaster> items, Inv_MaterialDocument documents)
        {
            Items = new SelectList(items.ToList(), "Id", "Description");
            Documents = documents;
        }
        #endregion
    }
}