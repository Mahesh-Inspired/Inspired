using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class CategoryViewModel
    {
        public SelectList Types { get; set; }
        public Inv_CategoryMaster Category { get; set; }

        #region constructor
        public CategoryViewModel(IEnumerable<Gen_LookupItem> types, Inv_CategoryMaster category)
        {
            if (types == null) throw new ArgumentNullException("types");
            Types = new SelectList(types.ToList(), "Id", "Description");
            Category = category;
        }
        #endregion
    }
}