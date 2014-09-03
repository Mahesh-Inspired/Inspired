var catTable;
$(function () {
    $('#Material').addClass('active');
    $('#Category').addClass('inactive');
    $("#divCatDelete").hide("slow");
    LoadCategory();
    $('form').submit(function (evt) {
        evt.preventDefault();
        var $form = $(this);
        if ($form.valid()) {
            Item_Save();
        }
    });
});


function Item_Save() {
    var Material = { "Item": "" };
    var ItemCategory = { "ItemId": "", "CatId": "", "CategoryType": "", "CategoryCode": "", "CategoryDescription": "" };
    var Item = {
        "Id": "", "Code": "", "Description": "", "SKU_Number": "", "Long_Description": "", "Overview": "", "UOM": "",
        "Margin_Percent": "", "Batch_YN": "", "Serial_YN": "", "Location_YN": "", "Shelf_Life": "", "Barcode": "",
        "Max_Level":"","Min_Level":"","Re_order_level":"","Lead_Time":"","NETT_Price":"","Sale_Price":"","Cost_Price":"",
        "ItemCategory": []
    };
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