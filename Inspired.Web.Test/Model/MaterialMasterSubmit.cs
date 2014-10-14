using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inspired.Web.ViewModel;

namespace Inspired.Web.Test.Model
{
    public static class MaterialMasterSubmit
    {

        public static MaterialSubmitModel BuildWithBlankData(Boolean isNew = false)
        {

            MaterialSubmitModel matlSubmit = new MaterialSubmitModel();
            if (!isNew)
                matlSubmit.Id = 1;
            else
                matlSubmit.Id = 0;
            matlSubmit.Code = "TEST";
            matlSubmit.Description = "TEST Description";
            matlSubmit.ItemCategory = new List<MaterialCategory>() { };
            matlSubmit.ItemSpecification = new List<MaterialSpecification>() { };
            matlSubmit.ItemPackaging = new List<MaterialPackaging>() { };
            matlSubmit.ItemSpare = new List<MaterialSpare>() { };
            matlSubmit.ItemAltRelative = new List<MaterialAltRelative>() { };
            matlSubmit.Suppliers = new List<MaterialSupplier>() { };
            matlSubmit.ItemNotes = new List<MaterialNotes>() { };
            return matlSubmit;
        }

        public static MaterialSubmitModel BuildWithMaterialMasterDetails(Boolean isNew = false)
        {
            MaterialSubmitModel material = BuildWithBlankData(isNew);

            material.SKU_Number = "2342134";

            material.Long_Description = "Long_Description";
            material.Overview = "Overview";
            material.UOM = null;
            material.Margin_Percent = 10;
            material.Batch_YN = "false";
            material.Serial_YN = "false";
            material.Location_YN = "false";
            material.Shelf_Life = 0;
            material.Barcode = "Barcode";
            material.Max_Level = 20;
            material.Min_Level = 5;
            material.Re_order_Level = 7;
            material.Lead_Time = 30;
            material.NETT_Price = 10;
            material.Sale_Price = 10;
            material.Cost_Price = 10;
            material.MCarton_Quantity = 6;
            material.MCarton_Length = 120;
            material.MCarton_Width = 120;
            material.MCarton_Height = 120;
            material.MCarton_Gross_Weight = 20;
            material.MCarton_NETT_Weight = 10;
            return material;
        }

        public static MaterialSubmitModel BuildWithItemCategory(Boolean isNew = false)
        {
            MaterialCategory matlCat = new MaterialCategory();
            matlCat.CatId = 1;
            matlCat.CategoryType = 1;
            matlCat.CategoryCode = "TESTCat";
            matlCat.CategoryDescription = "Test category desc";

            MaterialSubmitModel material = BuildWithMaterialMasterDetails(isNew);
            matlCat.ItemId = material.Id;
            material.ItemCategory.Add(matlCat);
            return material;
        }

        public static MaterialSubmitModel BuildWithItemSpecification(Boolean isNew = false)
        {
            MaterialSpecification matlSpec = new MaterialSpecification();
            matlSpec.BatchNumber = "";
            matlSpec.SpecId = 1;
            matlSpec.SpecValue = "20kgs";


            MaterialSubmitModel material = BuildWithItemCategory(isNew);
            matlSpec.ItemId = material.Id;
            material.ItemSpecification.Add(matlSpec);
            return material;
        }

        public static MaterialSubmitModel BuildWithItemPackaging(Boolean isNew = false)
        {
            MaterialPackaging matlPack = new MaterialPackaging();
            matlPack.BoxNumber = 1;
            matlPack.BoxWidth = 10;
            matlPack.BoxHeight = 10;
            matlPack.BoxLength = 10;
            matlPack.BoxGrossWeight = 20;
            matlPack.BoxNettWeight = 20;

            MaterialSubmitModel material = BuildWithItemSpecification(isNew);
            matlPack.ItemId = material.Id;
            material.ItemPackaging.Add(matlPack);
            return material;
        }
        public static MaterialSubmitModel BuildWithNewItemSpares(Boolean isNew = false)
        {
            MaterialSpare matlSpare = new MaterialSpare();
            matlSpare.SpareItemId = 0;
            matlSpare.SpareItemCode = "Test";
            matlSpare.SpareItemDesc = "TEST Spare";
            matlSpare.SpareQuantity = 1;
            matlSpare.SparePrice = 10;
            matlSpare.SpareOverview = "Spare Overview";

            MaterialSubmitModel material = BuildWithItemPackaging(isNew);
            matlSpare.ItemId = material.Id;
            matlSpare.material = material;
            material.ItemSpare.Add(matlSpare);
            return material;
        }
        public static MaterialSubmitModel BuildWithItemSpare(Boolean isNew = false)
        {
            MaterialSpare matlSpare = new MaterialSpare();
            matlSpare.SpareItemId = 2;
            matlSpare.SpareItemCode = "Test";
            matlSpare.SpareItemDesc = "TEST Spare";
            matlSpare.SpareQuantity = 1;
            matlSpare.SparePrice = 10;
            matlSpare.SpareOverview = "Spare Overview";

            MaterialSubmitModel material = BuildWithItemPackaging(isNew);
            matlSpare.ItemId = material.Id;
            matlSpare.material = material;
            material.ItemSpare.Add(matlSpare);
            return material;
        }

        public static MaterialSubmitModel BuildWithItemAlternateRelative(Boolean isNew = false)
        {
            MaterialAltRelative matlAlt = new MaterialAltRelative();
            matlAlt.AlternateItemId = 2;
            matlAlt.AlternateFlgId = 22;
            matlAlt.AlternateNotes = "Alternate notes";

            MaterialSubmitModel material = BuildWithItemSpare(isNew);
            matlAlt.ItemId = material.Id;
            material.ItemAltRelative.Add(matlAlt);
            return material;
        }

        public static MaterialSubmitModel BuildWithSuppliers(Boolean isNew=false)
        {
            MaterialSupplier matlSupp = new MaterialSupplier();
            matlSupp.SupplierId = 1;
            matlSupp.RefNumber = "Item Ref number";
            matlSupp.MinOrderQty = 0;
            matlSupp.CurrencyId = 2;
            matlSupp.Notes = "Test notes";
            matlSupp.Cost = 22;

            MaterialSubmitModel material = BuildWithItemAlternateRelative(isNew);
            matlSupp.ItemId = material.Id;
            material.Suppliers.Add(matlSupp);
            return material;
        }

        public static MaterialSubmitModel BuildWithItemNotes(Boolean isNew=false)
        {
            MaterialNotes matlNotes = new MaterialNotes()
            {
                SuppCustId = null,
                TakenById = 1,
                EntryDate = DateTime.Now,
                ExpiryDate = DateTime.Now,
                Notes = "TEST Notes",
                NotesTypeId = 2,
                PriorityFlagId = 1
            };

            MaterialSubmitModel material = BuildWithSuppliers(isNew);
            matlNotes.ItemId = material.Id;
            material.ItemNotes.Add(matlNotes);
            return material;
        }
    }

}