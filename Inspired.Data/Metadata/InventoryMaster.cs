using Inspired.Data.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Inspired.Data
{
  

    [MetadataType(typeof(Inv_MaterialMaster.Metadata))]
    public partial class Inv_MaterialMaster
    {
        private sealed class Metadata
        {
            //TODO Regular Expression parameter to use resource file values
            [Required(ErrorMessage="Enter a valid Item code")]
            [RegularExpression(@"^([A-Z0-9]{4}\-[A-Z0-9.]+)$",ErrorMessage="Please enter a valid item code")]
            [StringLength(50,ErrorMessage="Item code is too long")]
            [Display(Name="Item Code")]
            public string Code { get; set; }

            [Required(ErrorMessage = "Enter a valid Item description")]
            [StringLength(500, ErrorMessage = "Item description is too long")]
            [Display(Name = "Item description")]
            public string Description { get; set; }

            [StringLength(100,ErrorMessage="SKU Number is too long")]
            [Display(Name="SKU Number")]
            public string SKU_Number { get; set; }

            [StringLength(1500, ErrorMessage = "Long description is too long")]
            [Display(Name = "Long description")]
            public string Long_Description { get; set; }
            
            [Display(Name = "Item Overview")]
            public string Overview { get; set; }
            
            [Display(Name = "Unit of Measurement")]
            [Range(0,99, ErrorMessage="Enter a valid Unit of Measurement")]
            public Nullable<int> UOM { get; set; }
            
            [RegularExpression(@"^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$",ErrorMessage = "Margin Percentage is invalid.")]
            [Range(0,100,ErrorMessage="Enter a valid Margin percentage")]  
            public Nullable<decimal> Margin_Percent { get; set; }
            
            [Display(Name = "Stock by Batch")]            
            public Nullable<bool> Batch_YN { get; set; }
            
            [Display(Name = "Stock by Serial No.")]
            public Nullable<bool> Serial_YN { get; set; }
            
            [Display(Name = "Stock by location")]
            public Nullable<bool> Location_YN { get; set; }
            
            [Display(Name = "Allow negative stock")]
            public Nullable<bool> Negative_Stock { get; set; }
            
            [Display(Name = "Shelf life")]
            public Nullable<int> Shelf_Life { get; set; }
            
            [StringLength(200, ErrorMessage = "Barcode is too long")]
            [Display(Name = "Barcode")]            
            public string Barcode { get; set; }

            [Display(Name = "Max Stock level")]
            [GenericCompare(CompareToPropertyName = "Min_Level", OperatorName = GenericCompareOperator.GreaterThan)]
            public Nullable<int> Max_Level { get; set; }
            //TODO custom validations for material master like (Minimum stock should be less than Max Stock) etc
            [Display(Name = "Min Stock level")]
            [GenericCompare(CompareToPropertyName = "Max_Level", OperatorName = GenericCompareOperator.LessThan)]
            public Nullable<int> Min_Level { get; set; }
            
            [Display(Name = "Re-order level")]
            [GenericCompare(CompareToPropertyName = "Max_Level", OperatorName = GenericCompareOperator.LessThan)]            
            public Nullable<int> Re_order_Level { get; set; }
            
            [Display(Name = "Lead time")]
            public Nullable<int> Lead_Time { get; set; }
            
            [Display(Name = "NETT Price")]
            public Nullable<decimal> NETT_Price { get; set; }
            
            [Display(Name = "Sale Price")]
            public Nullable<decimal> Sale_Price { get; set; }
            
            [Display(Name = "Cost Price")]
            public Nullable<decimal> Cost_Price { get; set; }

            [Display(Name="Quantity")]
            public Nullable<int> MCarton_Quantity { get; set; }
            [Display(Name = "Length")]
            public Nullable<decimal> MCarton_Length { get; set; }
            [Display(Name = "Width")]
            public Nullable<decimal> MCarton_Width { get; set; }
            [Display(Name = "Height")]
            public Nullable<decimal> MCarton_Height { get; set; }
            [Display(Name = "Gross Weight")]
            public Nullable<decimal> MCarton_Gross_Weight { get; set; }
            [Display(Name = "NETT Weight")]
            public Nullable<decimal> MCarton_NETT_Weight { get; set; }
        }
    }

    [MetadataType(typeof(Inv_CategoryMaster.Metadata))]
    public partial class Inv_CategoryMaster
    {
        private sealed class Metadata
        {
            [Required(ErrorMessage = "Enter a valid code")]
            public string Code { get; set; }

            [Required(ErrorMessage = "Enter a valid description")]
            public string Description { get; set; }
        }
    }

    [MetadataType(typeof(Gen_LookupItem.Metadata))]
    public partial class Gen_LookupItem
    {
        private sealed class Metadata
        {
            [Required(ErrorMessage = "Select a valid type")]
            [Range(1, 10000, ErrorMessage = "Select a valid type")]
            public string LookupType_Id { get; set; }

            [Required(ErrorMessage = "Enter a valid description")]
            public string Description { get; set; }
        }
    }
}
