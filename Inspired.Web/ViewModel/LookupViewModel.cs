using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class LookupViewModel
    {
        public SelectList Types { get; set; }
        public SelectList Groups { get; set; }
        public Gen_LookupItem Category { get; set; }

        #region constructor
        public LookupViewModel(IEnumerable<Gen_LookupType> types, IEnumerable<Gen_LookupGroup> groups, Gen_LookupItem category)
        {
            if (types == null) throw new ArgumentNullException("types");
            Types = new SelectList(types.ToList(), "Id", "Description");
            Groups = new SelectList(groups.ToList(), "Id", "Description");
            Category = category;
        }
        #endregion
    }
}