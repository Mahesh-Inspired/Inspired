var whsTable;
$(function () { LoadWarehouse();});
function LoadWarehouse() {
    whsTable = $('#WarehouseTable').DataTable({
        "bPaginate": false,
        "bFilter": true,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "columnDefs": [
                          {
                              "targets": [0],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [4],
                              "visible": false
                          },
                          {
                              "targets": [6],
                              "visible": false
                          }
        ],
        "oTableTools": {
            "sSwfPath": "~/Content/DataTables-1.10.1/swf/copy_csv_xls.swf",
            "sRowSelect": "single",
            "sSelectedClass": "row_selected",
            "sAutoWidth": "false",

        }
    });
    $('#WarehouseTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#WarehouseTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            //var tt = new $.fn.dataTable.TableTools(catTable);
            //var oTT = TableTools.fnGetInstance('CategoryTable');
            var sRow = whsTable.$('tr.selected');
            var oTable = $('#WarehouseTable').dataTable().fnGetData(sRow);
            $("#warehouseCode").val((oTable[1]).toString());
            $("#warehouseDescription").val(oTable[2].toString());
            $("#warehouseId").val(oTable[0].toString());
            $("#WarehouseTypes").val(oTable[4].toString());
            $("#Branches").val(oTable[6].toString() == "" ? "-1" : oTable[6].toString());
            $('#WarehouseTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divWhsDelete").show("slow");
        }
    });
    
    $("#divWhsDelete").hide("slow");
}
function AddWarehouse() {
    var errMsg = '';
    if ($('#warehouseCode').val() == null) {
        errMsg = "Enter a valid Warehouse code\n";
    }
    else if ($('#warehouseDescription').val() == '') {
        errMsg = errMsg + "Enter a valid Warehouse Description\n";
    }
    else if ($('#warehouseTypes').val() == '') {
        errMsg = errMsg + "Enter a valid warehouse type\n";
    }
    if (errMsg != '')
    {
        alert(errMsg);
        $('#warehouseCode').focus();
        return false;
    }
    UpdateWarehouse();   
}

function addWarehouseToTable()
{
    $('#WarehouseTable').dataTable().fnAddData([$("#warehouseId").val(), $("#warehouseCode").val(), $("#warehouseDescription").val(), $("#WarehouseTypes option:selected").text(), $("#WarehouseTypes option:selected").val(), $("#Branches option:selected").text(), $("#Branches option:selected").val()]);
    clearControls();
}

function clearControls()
{
    $("#warehouseCode").val("");
    $("#warehouseDescription").val("");
    $("#warehouseId").val("");

    $("#divWhsDelete").hide("slow");
}
function UpdateWarehouse() {
    
    if ($("#warehouseCode").val() == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({
            whsId: $("#warehouseId").val(),
            whsCode: $("#warehouseCode").val(),
            whsdesc: $("#warehouseDescription").val(),
            whsType: $("#WarehouseTypes option:selected").val(),
            branchId: $("#Branches option:selected").val()
        }),
        type: 'POST',
        url: 'AddUpdateWarehouse',
        error: function (e) { alert(e.Message); },
        success: function (data) {
            console.log("Inv");
            console.log(data.success);
            if (data.success == true) {
                console.log(data.id);
                $('#warehouseId').val(data.id);
                addWarehouseToTable();
            } else if (data.success == false) {
                alert(data.Message);
                $('#warehouseCode').focus();
            }
        }
    });

}

function DeleteWarehouse() {    
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({
            whsId: $("#warehouseId").val()
        }),
        type: 'POST',
        url: 'DeleteWarehouse',
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                clearControls();
            } else if (data.success == false) {
                alert(data.Message);
                $('#warehouseCode').focus();
            }
        }
    });

}

