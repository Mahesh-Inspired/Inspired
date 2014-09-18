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
        public int? MCarton_Quantity { get; set; }
        public decimal? MCarton_Length { get; set; }
        public decimal? MCarton_Width { get; set; }
        public decimal? MCarton_Height { get; set; }
        public decimal? MCarton_Gross_Weight { get; set; }
        public decimal? MCarton_NETT_Weight { get; set; }
      public virtual ICollection<MaterialCategory> ItemCategory { get; set; }
      public virtual ICollection<MaterialSpecification> ItemSpecification { get; set; }
      public virtual ICollection<MaterialPackaging> ItemPackaging { get; set; }
      public virtual ICollection<MaterialSpare> ItemSpare { get; set; }
      public virtual ICollection<MaterialAltRelative> ItemAltRelative { get; set; }
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

    public class MaterialSpecification
    {
        public Int32 ItemId { get; set; }
        public String BatchNumber { get; set; }

        public Int32 SpecId { get; set; }

        public String SpecValue { get; set; }

        public virtual MaterialSubmitModel material { get; set; }
    }

    public class MaterialPackaging
    {
        public Int32 ItemId { get; set; }
        public Int32 BoxNumber { get; set; }        
        public Decimal? BoxLength { get; set; }        
        public Decimal? BoxWidth { get; set; }
        public Decimal? BoxHeight { get; set; }
        public Decimal? BoxGrossWeight { get; set; }
        public Decimal? BoxNettWeight { get; set; }
        public virtual MaterialSubmitModel material { get; set; }
    }

    public class MaterialSpare
    {
        public Int32 ItemId { get; set; }
        public Int32 SpareItemId { get; set; }
        public String SpareItemCode { get; set; }
        public String SpareItemDesc { get; set; }
        public Int32 SpareQuantity { get; set; }
        public decimal SparePrice { get; set; }
        public String SpareOverview { get; set; }
        public virtual MaterialSubmitModel material { get; set; }

    }

    public class MaterialAltRelative
    {
        public Int32 ItemId { get; set; }
        public Int32 AlternateItemId { get; set; }
        public Int32 AlternateFlgId { get; set; }
        public String AlternateNotes { get; set; }
        public virtual MaterialSubmitModel material { get; set; }
    }
}