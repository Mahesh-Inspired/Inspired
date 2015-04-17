using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class DownloadViewModel
    {
        public SelectList Description { get; set; }
        public Inv_MaterialDocument Documents { get; set; }

        public DownloadViewModel(IEnumerable<Inv_MaterialDocument> items, Inv_MaterialDocument documents)
        {
            Description = new SelectList(items.ToList(), "Document_Path", "Description");
            Documents = documents;
        }
    }
}