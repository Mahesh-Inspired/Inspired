using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Inspired.Web.ViewModel
{
    public class LookupViewModel
    {
        public SelectList Types { get; set; }
        public SelectList Groups { get; set; }
        public Gen_LookupItem Lookup { get; set; }

        [Required(ErrorMessage = "Description Required")]
        [MaxLength(500)]
        [RegularExpression(@"^([a-zA-Z0-9 \.\&\'\-]+)$", ErrorMessage = "Invalid Description")]
        public string Description { get; set; }

        #region constructor
        public LookupViewModel(IEnumerable<Gen_LookupType> types, IEnumerable<Gen_LookupGroup> groups, Gen_LookupItem lookup)
        {
            if (types == null) throw new ArgumentNullException("types");
            Types = new SelectList(types.ToList(), "Id", "Description");
            Groups = new SelectList(groups.ToList(), "Id", "Description");
            Lookup = lookup;
        }
        #endregion
    }
}