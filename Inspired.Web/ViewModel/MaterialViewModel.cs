using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inspired.Data;
using System.ComponentModel.DataAnnotations;
using Inspired.Repository;
using Inspired.Data.Validation;

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

        #region Supplier details
        [Display(Name="Supplier Code")]
        public String Supplier_Code { get; set; }
        [Display(Name = "Supplier Name")]
        public String Supplier_Name { get; set; }
        public Int32 Supplier_Id { get; set; }
        [Display(Name = "Supplier Item Reference")]
        public String Supplier_RefNumber { get; set; }
        [Display(Name = "Minimum order quantity")]
        public Int32 Supplier_MinOrder { get; set; }
        public Int32 Supplier_CurrencyId { get; set; }
        [Display(Name = "Currency")]
        public SelectList ListCurrency { get; set; }
        [Display(Name = "Notes")]
        public String Supplier_Notes { get; set; }
        [Display(Name = "Cost")]
        public double Supplier_Cost { get; set; }

        #endregion


        #region Item Notes
        [Display(Name = "Supplier/Customer Code")]
        public String SuppCust_Code { get; set; }

        [Display(Name = "Supplier/Customer Name")]
        public String SuppCust_Name { get; set; }
        public Int32 SuppCust_Id { get; set; }

        [Display(Name = "Taken by")]
        public String User_Code { get; set; }
        public Int32 User_Id { get; set; }

        [DataType(DataType.Date)]
        public DateTime Notes_EntryDate { get; set; }
        public String Item_Notes { get; set; }

        public DateTime? Notes_ExpiryDate { get; set; }
        
        [Display(Name="To be Actioned by")]
        public String Action_UserCode { get; set; }
        public Int32 Action_UserId { get; set; }

        [Display(Name = "Notes type")]
        public SelectList NotesType { get; set; }

        [Display(Name = "Priority")]
        public SelectList NotesPriority { get; set; }
        


        #endregion

        #region Constructor
        public MaterialViewModel()
        { 
        }        
        public MaterialViewModel(IEnumerable<Gen_LookupItem> listLookupItems,
            Inv_MaterialMaster material)
        {
            CategoryTypes = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_Category).ToList(), "Id", "Description");
            Statuses = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_Status).ToList(), "Id", "Description");
            Specifications = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_Specification).ToList(), "Id", "Description");
            ListRelativeAlternate = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_AlternateRelative).ToList(), "Id", "Description");
            ListCurrency = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_Currency).ToList(), "Id", "Description");
            NotesType = new SelectList(listLookupItems.Where(u=>u.LookupType_Id==Core.Global.LookupType_NotesType).ToList(),"Id","Description");
            NotesPriority = new SelectList(listLookupItems.Where(u => u.LookupType_Id == Core.Global.LookupType_NotesPriority).ToList(), "Id", "Description");

            if (CategoryTypes == null || CategoryTypes.Count() < 0) throw new ArgumentNullException("Categories");
            if (Statuses == null || Statuses.Count() <= 0) throw new ArgumentNullException("Statuses");            
            ListYesNo = new SelectList(new[] { new SelectListItem { Text = "Yes", Value = "true" }, new SelectListItem { Text = "No", Value = "false" } }, "Value", "Text");            
            Material = material;
        }
        #endregion

    }
}