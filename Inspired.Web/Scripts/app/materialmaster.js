var catTable;
$(function () {
    LoadCategory();
});

function Item_Save() {
    var Material = { "Item": "" };
    var ItemCategory = { "ItemId": "", "CatId": "", "CategoryType": "", "CategoryCode": "", "CategoryDescription": "" };
    var Item = { "Id": "", "Code": "", "Description": "", "ItemCategory": [] };
    Item.Id = $("#Material_Id").val();
    Item.Code = $("#Material_Code").val();
    Item.Description = $("#Material_Description").val();

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