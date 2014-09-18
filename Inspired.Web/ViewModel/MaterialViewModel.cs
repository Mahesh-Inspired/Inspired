using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;
using System.ComponentModel.DataAnnotations;

namespace Inspired.Web.ViewModel
{
    public class MaterialViewModel
    {
        public Inv_MaterialMaster Material { get; set; }

        public SelectList ListYesNo { get; set; }
        public SelectList Statuses { get; set; }
        public SelectList Specifications { get; set; }
        [Display(Name = "Alternate/Relative")]
        public SelectList ListRelativeAlternate { get; set; }

        #region Category
        [Display(Name = "Category Type")]
        public SelectList CategoryTypes { get; set; }

        public Int32 CatId { get; set; }
        [Display(Name = "Category Code")]
        public String CatCode { get; set; }
        [Display(Name = "Category Description")]
        public String CatDescription { get; set; }

        #endregion

        #region Specification
        [Display(Name = "Group")]
        public String SpecGroup { get; set; }

        [Display(Name = "Batch Number")]
        public String SpecBatchNumber { get; set; }

        public Int32 SpecId { get; set; }

        [Display(Name = "Description")]
        public String SpecDescription { get; set; }

        [Display(Name = "Value")]
        public String SpecValue { get; set; }
        #endregion

        #region Box Details
        [Display(Name = "Box#")]
        public Int32 BoxNumber { get; set; }
        [Display(Name = "Length")]
        public decimal? BoxLength { get; set; }
        [Display(Name = "Width")]
        public decimal? BoxWidth { get; set; }
        [Display(Name = "Height")]
        public decimal? BoxHeight { get; set; }
        [Display(Name = "Gross Weight")]
        public decimal? BoxGrossWeight { get; set; }
        [Display(Name = "NETT Weight")]
        public decimal? BoxNettWeight { get; set; }            
        #endregion

        #region Branches
        public Int32 BranchId { get; set; }

        [Display(Name = "Branch")]
        public String Branch { get; set; }

        [Display(Name = "Item Description")]
        public String BranchItemDescription { get; set; }

        [Display(Name = "Overview")]
        public String BranchItemOverview { get; set; }

        [Display(Name = "Stock by Location")]
        public bool BranchStockByLocation { get; set; }

        [Display(Name = "Stock by Batch")]
        public bool BranchStockByBatch { get; set; }

        [Display(Name = "Stock by Serial")]
        public bool BranchStockBySerial { get; set; }

        [Display(Name = "Specification Code")]
        public String BranchSpecificationCode { get; set; }

        [Display(Name = "Specification Description")]
        public String BranchSpecificationDescription { get; set; }
        #endregion

        #region Spares

        public Int32 SpareItemId { get; set; }
        [RegularExpression(@"^([A-Z0-9]{4}\-[A-Z0-9.]+)$", ErrorMessage = "Please enter a valid item code")]
        [StringLength(50, ErrorMessage = "Item code is too long")]
        [Display(Name = "Item Code")]
        public String SpareItemCode { get; set; }
        
        [StringLength(500, ErrorMessage = "Item description is too long")]
        [Display(Name = "Item Description")]
        public string SpareItemDesc { get; set; }
        [Display(Name = "Quantity")]
        public int? SpareQuantity { get; set; }
        [Display(Name = "Price")]
        public decimal? SparePrice { get; set; }
        [Display(Name = "Overview")]
        public String SpareOverview { get; set; }

        #endregion
        #region Alternate

        public Int32 AlternateItemId { get; set; }
        
        [Display(Name = "Item Code")]
        public String AlternateItemCode { get; set; }

        [Display(Name = "Item Description")]
        public string AlternateItemDesc { get; set; }

        [Display(Name = "Overview")]
        public String AlternateOverview { get; set; }

        #endregion
        #region Constructor
        public MaterialViewModel()
        { }
        public MaterialViewModel(IEnumerable<Gen_LookupItem> categoryTypes, IEnumerable<Gen_LookupItem> statuses, IEnumerable<Gen_LookupItem> specifications, IEnumerable<Gen_LookupItem> alternateRelative, Inv_MaterialMaster material)
        {
            if (categoryTypes == null || categoryTypes.Count() < 0) throw new ArgumentNullException("Categories");
            if (statuses == null || statuses.Count() <= 0) throw new ArgumentNullException("Statuses");
            CategoryTypes = new SelectList(categoryTypes.ToList(), "Id", "Description");
            Statuses = new SelectList(statuses.ToList(), "Id", "Description");
            Specifications = new SelectList(specifications.ToList(), "Id", "Description");
            ListRelativeAlternate = new SelectList(alternateRelative.ToList(), "Id", "Description");

            ListYesNo = new SelectList(new[] { new SelectListItem { Text = "Yes", Value = "true" }, new SelectListItem { Text = "No", Value = "false" } }, "Value", "Text");            
            Material = material;
        }
        #endregion

    }
}