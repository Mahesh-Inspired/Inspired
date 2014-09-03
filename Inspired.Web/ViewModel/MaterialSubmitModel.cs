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
        public string SKU_Number { get; set; }
        public string Long_Description { get; set; }
        public string Overview { get; set; }
        public Nullable<int> UOM { get; set; }
        public Nullable<decimal> Margin_Percent { get; set; }
        public String Batch_YN { get; set; }
        public String Serial_YN { get; set; }
        public String Location_YN { get; set; }
        public Int32? Shelf_Life { get; set; }
        public string Barcode { get; set; }
        public Int32? Max_Level { get; set; }
        public Int32? Min_Level { get; set; }
        public Int32? Re_order_Level { get; set; }
        public Int32? Lead_Time { get; set; }
        public Decimal? NETT_Price { get; set; }
        public Decimal? Sale_Price { get; set; }
        public Decimal? Cost_Price { get; set; }
      public virtual ICollection<MaterialCategory> ItemCategory { get; set; }

    }


    public class MaterialCategory 
    {
        public Int32 ItemId { get; set; }
        public Int32 CategoryType { get; set; }
        public String CategoryCode { get; set; }
        public String CategoryDescription { get; set; }

        public Int32 CatId { get; set; }

        public virtual MaterialSubmitModel material { get; set; }
    }
}