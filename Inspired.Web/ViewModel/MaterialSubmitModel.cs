using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;

namespace Inspired.Web.ViewModel
{
    public class MaterialSubmitModel
    {
        public Int32 Id { get; set; }
        public String Code { get; set; }
        public String Description { get; set; }

      public virtual ICollection<MaterialCategory> ItemCategory { get; set; }

    }


    public class MaterialCategory 
    {
        public Int32 ItemId { get; set; }
        public String CategoryType { get; set; }
        public String CategoryCode { get; set; }
        public String CategoryDescription { get; set; }

        public Int32 CatId { get; set; }

        public virtual MaterialSubmitModel material { get; set; }
    }
}