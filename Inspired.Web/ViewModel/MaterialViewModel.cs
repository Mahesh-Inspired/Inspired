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
        public SelectList ListYesNo { get; set; }

        public Inv_MaterialMaster Material { get; set; }
        #region Category
        [Display(Name="Category Type")]
            public SelectList CategoryTypes { get; set; }
        
            public Int32 catId { get; set; }
            [Display(Name = "Category Code")]
            public String catCode { get; set; }
            [Display(Name = "Category Description")]
            public String catDescription { get; set; }

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
            public SelectList Statuses { get; set; }


        #region Constructor
        public MaterialViewModel()
        { }
            public MaterialViewModel(IEnumerable<Gen_LookupItem> categoryTypes, IEnumerable<Gen_LookupItem> statuses,Inv_MaterialMaster material)
            {
                if (categoryTypes == null || categoryTypes.Count() < 0) throw new ArgumentNullException("Categories");
                if (statuses == null || statuses.Count() <= 0) throw new ArgumentNullException("Statuses");                
                CategoryTypes = new SelectList(categoryTypes.ToList(), "Id", "Description");
                Statuses = new SelectList(statuses.ToList(), "Id", "Description");
                
                ListYesNo = new SelectList(new[] { new SelectListItem { Text = "Yes", Value = "true" }, new SelectListItem { Text = "No", Value = "false" } }, "Value", "Text");
                Material = material;
            }
        #endregion

    }
}