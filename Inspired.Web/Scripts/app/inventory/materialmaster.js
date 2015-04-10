var catTable, specTable, boxTable, spareTable, alternateTable,supplierTable, notesTable;
$(function () {
    $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
    $('.datepicker').val(getCurrentDate());
    $('#Material').addClass('active');
    $('#Category').addClass('inactive');
    $('#Specification').addClass('inactive');    
    LoadCategory();
    LoadSpecification();
    LoadPackaging();
    LoadSpares();
    LoadAlternates();
    LoadSupplier();
    LoadNotes();
    $('form').submit(function (evt) {
        evt.preventDefault();
            Item_Save();
    });
});

function getCurrentDate()
{
    var fullDate = new Date();
    console.log(fullDate);
    //Thu May 19 2011 17:25:38 GMT+1000 {}
  
    //convert month to 2 digits
    var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  
    return fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

}

function Item_Save() {
    alert("IN");
    var Material = { "Item": "" };
    var ItemCategory = { "ItemId": "", "CatId": "", "CategoryType": "", "CategoryCode": "", "CategoryDescription": "" };
    var ItemSpecification = { "ItemId": "", "BatchNumber": "", "SpecId": "", "SpecValue": "" };
    var ItemBoxDetails = { "ItemId": "", "BoxNumber": "", "BoxLength": "", "BoxWidth": "", "BoxHeight": "", "BoxGrossWeight": "", "BoxNettWeight": "" };
    var ItemSpares = { "ItemId": "", "SpareItemId": "", "SpareItemCode": "", "SpareItemDesc": "", "SpareQuantity": "", "SparePrice": "", "SpareOverview": "" };
    var ItemAltRelative = { "ItemId": "", "AlternateItemId": "", "AlternateFlgId": "", "AlternateNotes": "" };
    var Supplier = { "ItemId": "", "SupplierId": "", "RefNumber": "", "MinOrderQty": "", "CurrencyId": "", "Notes": "", "Cost": "" };
    var ItemNotes = { "ItemId": "", "SuppCustId": "", "TakenById": "", "EntryDate": "", "ExpiryDate": "", "Notes": "", "ActionById": "", "ActionByDate": "", "NotesTypeId": "", "PriorityFlagId": "" };
    var Item = {
        "Id": "", "Code": "", "Description": "", "SKU_Number": "", "Long_Description": "", "Overview": "", "UOM": "",
        "Margin_Percent": "", "Batch_YN": "", "Serial_YN": "", "Location_YN": "", "Shelf_Life": "", "Barcode": "",
        "Max_Level": "", "Min_Level": "", "Re_order_level": "", "Lead_Time": "", "NETT_Price": "", "Sale_Price": "", "Cost_Price": "",
        "MCarton_Quantity": "", "MCarton_Length": "", "MCarton_Width": "", "MCarton_Height": "",
        "MCarton_Gross_Weight": "", "MCarton_NETT_Weight": "",
        "ItemCategory": [],
        "ItemSpecification": [],
        "ItemPackaging": [],
        "ItemSpare": [],
        "ItemAltRelative": [],
        "Suppliers": [],
        "ItemNotes": []
    };
    // Material Master main details
    Item.Id = $("#Material_Id").val();
    Item.Code = $("#Material_Code").val();
    Item.Description = $("#Material_Description").val();
    Item.SKU_Number = $("#Material_SKU_Number").val();
    Item.Long_Description = $("#Material_Long_Description").val();
    Item.Overview = $("#Material_Overview").val();
    Item.UOM = $("#Material_UOM").val();
    Item.Margin_Percent = $("#Material_Margin_Percent").val();
    Item.Batch_YN = $("#Material_Batch_YN").val();
    Item.Serial_YN= $("#Material_Serial_YN").val();
    Item.Location_YN = $("#Material_Location_YN").val();
    Item.Shelf_Life = $("#Material_Shelf_Life").val();
    Item.Barcode = $("#Material_Barcode").val();
    Item.Max_Level = $("#Material_Max_Level").val();
    Item.Min_Level = $("#Material_Min_Level").val();
    Item.Re_order_level = $("#Material_Re_order_Level").val();
    Item.Lead_Time = $("#Material_Lead_Time").val();
    Item.NETT_Price = $("#Material_NETT_Price").val();
    Item.Sale_Price = $("#Material_Sale_Price").val();
    Item.Cost_Price = $("#Material_Cost_Price").val();
    Item.MCarton_Quantity = $("#Material_MCarton_Quantity").val();
    Item.MCarton_Length = $("#Material_MCarton_Length").val();
    Item.MCarton_Width = $("#Material_MCarton_Width").val();
    Item.MCarton_Height = $("#Material_MCarton_Height").val();
    Item.MCarton_Gross_Weight = $("#Material_MCarton_Gross_Weight").val();
    Item.MCarton_NETT_Weight = $("#Material_MCarton_NETT_Weight").val();


    // Category details
    var oTable = $('#CategoryTable').dataTable().fnGetData();

    for (var i = 0; i < oTable.length; i++) {
        ItemCategory.ItemId = Item.id;
        ItemCategory.CatId = oTable[i][4];
        ItemCategory.CategoryType = oTable[i][0];
        ItemCategory.CategoryCode = oTable[i][2];
        ItemCategory.CategoryDescription = oTable[i][3];

        Item.ItemCategory.push(ItemCategory);
        ItemCategory = { "ItemId": "", "CatId": "", "CategoryType": "", "CategoryCode": "", "CategoryDescription": "" };
    }


    // Specification Details
    var specTable = $('#SpecificationTable').dataTable().fnGetData();

    for (var i = 0; i < specTable.length; i++) {
        ItemSpecification.ItemId = Item.id;
        ItemSpecification.BatchNumber = specTable[i][1];
        ItemSpecification.SpecId = specTable[i][4];
        ItemSpecification.SpecValue = specTable[i][3];
        
        Item.ItemSpecification.push(ItemSpecification);
        ItemSpecification = { "ItemId": "", "BatchNumber": "", "SpecId": "", "SpecValue": "" };
    }

    // Box Packaging Details
    var boxTable = $('#PackagingTable').dataTable().fnGetData();

    for (var i = 0; i < boxTable.length; i++) {        
        ItemBoxDetails.ItemId = Item.id;
        ItemBoxDetails.BoxNumber = boxTable[i][0];
        ItemBoxDetails.BoxLength = boxTable[i][1];
        ItemBoxDetails.BoxWidth = boxTable[i][2];
        ItemBoxDetails.BoxHeight = boxTable[i][3];
        ItemBoxDetails.BoxGrossWeight = boxTable[i][4];
        ItemBoxDetails.BoxNettWeight = boxTable[i][5];
        
        Item.ItemPackaging.push(ItemBoxDetails);
        ItemBoxDetails = { "ItemId": "", "BoxNumber": "", "BoxLength": "", "BoxWidth": "", "BoxHeight": "", "BoxGrossWeight": "", "BoxNettWeight": "" };
    }

    // Spare Details
    var spareTable = $('#SpareTable').dataTable().fnGetData();    
    for (var i = 0; i < spareTable.length; i++) {
        ItemSpares.ItemId = Item.id;
        ItemSpares.SpareItemId = spareTable[i][0];
        ItemSpares.SpareItemCode = spareTable[i][1];
        ItemSpares.SpareItemDesc = spareTable[i][2];
        ItemSpares.SpareQuantity = spareTable[i][3];
        ItemSpares.SparePrice = spareTable[i][4];
        ItemSpares.SpareOverview = spareTable[i][5];        
        Item.ItemSpare.push(ItemSpares);
        ItemSpares = { "ItemId": "", "SpareItemId": "", "SpareItemCode": "", "SpareItemDesc": "", "SpareQuantity": "", "SparePrice": "", "SpareOverview": "" };
    }    
    // Alternate Relative Items
    var altTable = $('#AlternateTable').dataTable().fnGetData();
    for (var i = 0; i < altTable.length; i++) {
        ItemAltRelative.ItemId = Item.id;
        ItemAltRelative.AlternateItemId = altTable[i][0];
        ItemAltRelative.AlternateFlgId = altTable[i][5];
        ItemAltRelative.AlternateNotes = altTable[i][4];
        Item.ItemAltRelative.push(ItemAltRelative);
        ItemAltRelative = { "ItemId": "", "AlternateItemId": "", "AlternateFlgId": "", "AlternateNotes": "" };
    }
    // Supplier details
    var supplierTable = $('#SupplierTable').dataTable().fnGetData();
    for (var i = 0; i < supplierTable.length; i++) {
        Supplier.ItemId = Item.id;
        Supplier.SupplierId = supplierTable[i][0];
        Supplier.RefNumber = supplierTable[i][3];
        Supplier.MinOrderQty = supplierTable[i][4];
        Supplier.CurrencyId = supplierTable[i][6];        
        Supplier.Cost = supplierTable[i][7];
        Supplier.Notes = supplierTable[i][8];

        Item.Suppliers.push(Supplier);
        Supplier = { "ItemId": "", "SupplierId": "", "RefNumber": "", "MinOrderQty": "", "CurrencyId": "", "Notes": "", "Cost": "" };
    }
    // Item Notes Details
    var notesTable = $('#NotesTable').dataTable().fnGetData();
    alert(notesTable.length);
    for (var i = 0; i < notesTable.length; i++) {
        ItemNotes.ItemId = Item.id;
        alert(notesTable[i][0]);
        alert(notesTable[i][0] <= 0 ? null : notesTable[i][0]);
        ItemNotes.SuppCustId = notesTable[i][0] <= 0 ? null : notesTable[i][0];
        ItemNotes.TakenById = notesTable[i][4];
        ItemNotes.EntryDate = notesTable[i][5];
        ItemNotes.ExpiryDate = notesTable[i][8] == "" ? null : notesTable[i][8];
        ItemNotes.Notes = notesTable[i][7];
        ItemNotes.ActionById = notesTable[i][11] <= 0 ? null : notesTable[i][11];
        ItemNotes.NotesTypeId = notesTable[i][12];
        ItemNotes.PriorityFlagId = notesTable[i][13];

        Item.ItemNotes.push(ItemNotes);
        ItemNotes = { "ItemId": "", "SuppCustId": "", "TakenById": "", "EntryDate": "", "ExpiryDate": "", "Notes": "", "ActionById": "", "ActionByDate": "", "NotesTypeId": "", "PriorityFlagId": "" };
    }

    Material.Item = Item;
    $.ajax({
        type: "POST",
        url: 'SaveMaterial',
        data: ' { data: ' + JSON.stringify(Item) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true)
                window.location.href = "/Inventory/MaterialList";
            else
                alert(data.Message);
        }
    });
}