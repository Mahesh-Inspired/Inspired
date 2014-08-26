using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;

namespace Inspired.Web.ViewModel
{
    public class MaterialViewModel
    {

        public Inv_MaterialMaster Material { get; set; }
        #region Category
            public SelectList CategoryTypes { get; set; }
            public Int32 catId { get; set; }
            public String catCode { get; set; }
            public String catDescription { get; set; }

        #endregion
        public SelectList Statuses { get; set; }


        #region Constructor
        public MaterialViewModel()
        { }
            public MaterialViewModel(IEnumerable<Gen_LookupItem> categoryTypes, IEnumerable<Gen_LookupItem> statuses, Inv_MaterialMaster material)
            {
                if (categoryTypes == null || categoryTypes.Count() <= 0) throw new ArgumentNullException("Categories");
                if (statuses == null || statuses.Count() <= 0) throw new ArgumentNullException("Statuses");
                CategoryTypes = new SelectList(categoryTypes.ToList(), "Id", "Description");
                Statuses = new SelectList(statuses.ToList(), "Id", "Description");
                Material = material;
            }
        #endregion

    }
}