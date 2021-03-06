﻿$(document).ready(function () {

    $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
    $('.datepicker').val(getCurrentDate());
    $('#Receipt').addClass('active');
    $('#Serial').addClass('inactive');

    LoadItems();
    LoadSerials();

    $('input:text:first').focus();
    var $inp = $('input:text');
    $inp.bind('keydown', function (e) {
        //var key = (e.keyCode ? e.keyCode : e.charCode);
        var key = e.which;
        if (key == 13) {
            e.preventDefault();
            var nxtIdx = $inp.index(this) + 1;
            $(":input:text:eq(" + nxtIdx + ")").focus();
        }
    });

    $('form').submit(function (evt) {
        evt.preventDefault();
        Issue_Save();
    });
});

function Issue_Save() {
    var Data = { "Data": "" };
    var ItemDetail = { "ItemCode": "", "ItemDesc": "", "ItemID": "", "WareHouseID": "", "WareHouse": "", "BatchNum": "", "Quantity": "", "Notes": "", "CurrentStock": "" };
    var SerialNoDetail = { "ItemID": "", "WareHouseID": "", "BatchNum": "", "SerialNo": "", "Quantity": "" };
    var Receipt = { "RefNum": "", "RefDate": "", "DocNum": "", "DocCode": "", "DocDate": "", "TransType": "", "ItemDetail": [], "SerialNoDetail": [] };

    Receipt.RefNum = $("#RefNum").val();
    Receipt.RefDate = $("#RefDate").val();
    Receipt.DocNum = $("#DocNum").val();
    Receipt.DocCode = $("#Stock_DOC_CODE").val();
    Receipt.DocDate = $("#DocDate").val();
    Receipt.TransType = "MiscIssues";

    var ItemTable = $('#ItemsTable').dataTable().fnGetData();

    //Item Detail
    for (var i = 0; i < ItemTable.length; i++) {
        ItemDetail.ItemCode = ItemTable[i][0];
        ItemDetail.ItemDesc = ItemTable[i][1];
        ItemDetail.ItemID = ItemTable[i][2];
        ItemDetail.WareHouseID = ItemTable[i][3];
        ItemDetail.WareHouse = ItemTable[i][4];
        ItemDetail.BatchNum = ItemTable[i][5];
        ItemDetail.Quantity = ItemTable[i][6];
        ItemDetail.Notes = ItemTable[i][7];

        Receipt.ItemDetail.push(ItemDetail);
        ItemDetail = { "ItemCode": "", "ItemDesc": "", "ItemID": "", "WareHouseID": "", "WareHouse": "", "BatchNum": "", "Quantity": "", "Notes": "" };
    }

    var SerialTable = $('#SerialTable').dataTable().fnGetData();

    //Serial Number Detail
    for (var i = 0; i < SerialTable.length; i++) {
        SerialNoDetail.ItemID = SerialTable[i][0];
        SerialNoDetail.WareHouseID = SerialTable[i][1];
        SerialNoDetail.BatchNum = SerialTable[i][2];
        SerialNoDetail.SerialNo = SerialTable[i][4];
        SerialNoDetail.Quantity = SerialTable[i][5];

        Receipt.SerialNoDetail.push(SerialNoDetail);
        SerialNoDetail = { "ItemID": "", "WareHouseID": "", "BatchNum": "", "SerialNo": "", "Quantity": "" };
    }

    Data.Data = Receipt;
    $.ajax({
        type: "POST",
        url: 'Issue_Save',
        data: ' { data: ' + JSON.stringify(Receipt) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (e) { alert(data.message); },
        success: function (data) {
            if (data.message == "success")
                window.location.href = "/Inventory/MiscIssue";
            else
                alert(data.message);
        }
    });
}

function getCurrentDate() {
    var fullDate = new Date();
    var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
    return fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
}

function fetchItemDetails(CtrlItemCode, CtrlItemDesc, CtrlItemId, CtrlBatchYN, CtrlSerialFlag) {
    var spareitemcode = $("#" + CtrlItemCode).val();
    if (spareitemcode == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemcode: spareitemcode }),
        error: function (e) { $('#' + CtrlItemCode).val(""); $('#' + CtrlItemCode).focus(); },
        success: function (data) {
            if (data.success == true) {
                $('#' + CtrlItemDesc).val(data.ItemDescription);
                $('#' + CtrlItemId).val(data.id);
                $('#' + CtrlItemCode).val(data.ItemCode);
                $('#' + CtrlSerialFlag).val(data.SerialFlag);
                var batch_flag = data.flag;
                if (batch_flag == 'True') {
                    $('#' + CtrlBatchYN).removeAttr("disabled")
                    $('#' + CtrlBatchYN).val("");
                }
                else if (batch_flag == 'False') {
                    $('#' + CtrlBatchYN).attr('disabled', 'disabled');
                    $('#' + CtrlBatchYN).val("Default Batch");
                }

            } else if (data.success == false) {
                alert(data.Message);
                $('#' + CtrlItemCode).focus();
            }
        },
        type: 'POST',
        url: 'FetchItemJSON'
    });
}

function fetchWarehouse(CtrlWrhCode, CtrlWrhID) {
    var warehousecode = $("#" + CtrlWrhCode).val();
    if (warehousecode == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ WarehouseCode: warehousecode }),
        error: function (e) { $('#' + CtrlWrhCode).val(""); $('#' + CtrlWrhCode).focus(); },
        success: function (data) {
            if (data.success == true) {
                $('#' + CtrlWrhID).val(data.id);
                $('#' + CtrlWrhCode).val(data.code);
            } else if (data.success == false) {
                alert(data.Message);
                $('#' + CtrlWrhCode).focus();
            }
        },
        type: 'POST',
        url: 'FetchWarehouseJSON'
    });
}

function fetchQuantity(CtrlItemID, CtrlWrhID, CtrlBatchNum, CtrlQuantity, CtrlNegativestock) {
    var itemid = $("#" + CtrlItemID).val();
    var warehouseid = $("#" + CtrlWrhID).val();
    var batchnum = $("#" + CtrlBatchNum).val();
    if (itemid == '' || warehouseid == '' || batchnum == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemid: itemid, warehouseid: warehouseid, batchnum: batchnum }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#' + CtrlQuantity).val(data.quantity);
                $('#' + CtrlNegativestock).val(data.NegativeStock);
            } else if (data.success == false) {
                alert(data.Message);
                $('#Quantity').val('');
            }
        },
        type: 'POST',
        url: 'FetchQuantity'
    });
}

function LoadItems() {
    ItemsTable = $('#ItemsTable').DataTable({
        "bPaginate": false,
        "bFilter": false,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "columnDefs": [
                          {
                              "targets": [2],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [3],
                              "visible": false,
                              "searchable": false
                          }
        ],
        "oTableTools": {
            "sSwfPath": "~/Content/DataTables-1.10.1/swf/copy_csv_xls.swf",
            "sRowSelect": "single",
            "sSelectedClass": "row_selected",
            "sAutoWidth": "false",

        }
    });

    $('#ItemsTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#ItemsTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = ItemsTable.$('tr.selected');
            var oTable = $('#ItemsTable').dataTable().fnGetData(sRow);
            $("#ItemCode").val((oTable[0]).toString());
            $("#ItemDesc").val(oTable[1].toString());
            $("#ItemID").val(oTable[2].toString());
            $("#WareHouseID").val(oTable[3].toString());
            $("#WareHouse").val(oTable[4].toString());
            $("#BatchNum").val(oTable[5].toString());
            $("#Quantity").val(oTable[6].toString());
            $("#Notes").val(oTable[7].toString());

            $('#ItemsTable').dataTable().fnDeleteRow(sRow[0]);
            $("#delItem").show("slow");
        }
    });

    $("#delItem").hide("slow");
}

function clearItem() {
    $("#delItem").hide("slow");
    $("#ItemCode").val("");
    $("#ItemDesc").val("");
    $("#ItemID").val("");
    $("#WareHouseID").val("");
    $("#WareHouse").val("");
    $("#BatchNum").val("");
    $("#Quantity").val("");
    $("#Notes").val("");
}

function deleteItem() {
    $('#SerialTable').dataTable().fnFilter($("#ItemCode").val());
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;

    for (j = 0; j <= i - 1; j++) {
        var itemid = $('#SerialTable').dataTable().fnGetData(j, 0);
        var warehouseid = $('#SerialTable').dataTable().fnGetData(j, 1);
        var batchnum = $('#SerialTable').dataTable().fnGetData(j, 2);

        console.log(itemid + ':' + $("#ItemID").val());
        console.log(warehouseid + ':' + $("#WareHouseID").val());
        console.log(batchnum + ':' + $("#BatchNum").val());
        console.log('row:' + j);
        console.log('serial:' + $('#SerialTable').dataTable().fnGetData(j, 4));

        $('#SerialTable').dataTable().fnDeleteRow(0);
    }

    $("#delItem").hide("slow");
    $("#ItemCode").val("");
    $("#ItemDesc").val("");
    $("#ItemID").val("");
    $("#WareHouseID").val("");
    $("#WareHouse").val("");
    $("#BatchNum").val("");
    $("#Quantity").val("");
    $("#Notes").val("");
}

function validate() {
    var i = document.getElementById("ItemsTable").getElementsByTagName("tr").length;
    var i = i - 1;
    var status = true;

    for (j = 0; j <= i - 1; j++) {
        var itemid = $('#ItemsTable').dataTable().fnGetData(j, 2);
        var warehouseid = $('#ItemsTable').dataTable().fnGetData(j, 3);
        var batchnum = $('#ItemsTable').dataTable().fnGetData(j, 5);

        if (itemid === undefined) {
            status = true;
        }
        else {
            if (itemid === $('#ItemID').val() && warehouseid === $('#WareHouseID').val() && batchnum === $('#BatchNum').val()) {
                alert("Item and batch number already added for this warehouse");
                status = false;
                break;
            }
            else {
                status = true;
            }
        }
    }
    return status;
}

function AddItem() {

    if ($('#ItemCode').val() == '') {
        alert("Enter a valid Item Code");
        $('#ItemCode').focus();
        return false;
    }
    else if ($('#ItemDesc').val() == '') {
        alert("Enter a valid Item description");
        $('#ItemDesc').focus();
        return false;
    }
    else if ($('#WareHouse').val() == '') {
        alert("Enter a valid Ware House");
        $('#WareHouse').focus();
        return false;
    }
    else if ($('#BatchNum').val() == '') {
        alert("Enter a valid Batch Number");
        $('#BatchNum').focus();
        return false;
    }
    else if ($('#Quantity').val() == '' || isNaN($('#Quantity').val()) == true) {
        alert("Enter a valid quantity");
        $('#Quantity').focus();
        return false;
    }

    if ($('#NegativeStock').val() == "False") {
        var currentstock = $('#CurrentStock').val();
        var quantity = $('#Quantity').val();
        var cbqty = currentstock - quantity;
        if (cbqty < 0) {
            alert("Quantity should not greater than current stock");
            $('#Quantity').focus();
            return false;
        }
    }

    if (validate() === true) {

        var serial_flag = $("#SerialNoFlag").val();             // Check whether serial flag is true or false
        var rows = 0;                                           // Current no. of rows in serial table
        var quantity = $('#Quantity').val();                    // Current no. of quantities entered
        var i = 0;                                              // Contains no. of items to be add or remove in serial Table
        var j = 0;                                              // Iteration variable

        $('#selItem').text($("#ItemCode").val());
        $('#SerialTable').dataTable().fnFilter($("#ItemCode").val());

        rows = document.getElementById("SerialTable").getElementsByTagName("tr").length - 2;

        if (rows == 0) {
            if (serial_flag == 'True') {
                for (j = 0; j <= quantity - 1; j++) {
                    $('#SerialTable').dataTable().fnAddData([$("#ItemID").val(), $("#WareHouseID").val(), $("#BatchNum").val(), "<input type='text' value='' alt=" + $("#ItemCode").val() + ">", "", $("#Quantity").val()]);
                    $('#Receipt').removeClass('active');
                    $('#Serial').removeClass('inactive');
                    $('#Receipt').addClass('inactive');
                    $('#Serial').addClass('active');
                }
            }
            else if (serial_flag == 'False') {
                $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val(), $("#CurrentStock").val(), $("#CurrentStock").val()]);
                for (j = 0; j <= quantity - 1; j++) {
                    $('#SerialTable').dataTable().fnAddData([$("#ItemID").val(), $("#WareHouseID").val(), $("#BatchNum").val(), "<input type='text' disabled='disabled' value='Default Serial' alt=" + $("#ItemCode").val() + ">", "Default Serial", $("#Quantity").val()]);
                }
                clearItem();
            }
        }
        else if (rows > 0) {

            rows = rows + 1;
            i = quantity - rows;

            if (i < 0) {
                if (serial_flag == 'True') {
                    for (j = rows; j > quantity; j--) {
                        document.getElementById("SerialTable").deleteRow(j);
                    }
                    $('#Receipt').removeClass('active');
                    $('#Serial').removeClass('inactive');
                    $('#Receipt').addClass('inactive');
                    $('#Serial').addClass('active');
                }
                else if (serial_flag == 'False') {
                    $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val(), $("#CurrentStock").val()]);
                    for (j = rows; j > quantity; j--) {
                        document.getElementById("SerialTable").deleteRow(j);
                    }
                    clearItem();
                }
            }

            else if (i > 0) {
                if (serial_flag == 'True') {
                    for (j = 0; j <= i - 1; j++) {
                        $('#SerialTable').dataTable().fnAddData([$("#ItemID").val(), $("#WareHouseID").val(), $("#BatchNum").val(), "<input type='text' value='' alt=" + $("#ItemCode").val() + ">", "", $("#Quantity").val()]);
                        $('#Receipt').removeClass('active');
                        $('#Serial').removeClass('inactive');
                        $('#Receipt').addClass('inactive');
                        $('#Serial').addClass('active');
                    }
                }
                else if (serial_flag == 'False') {
                    $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val(), $("#CurrentStock").val(), $("#CurrentStock").val()]);
                    for (j = 0; j <= i - 1; j++) {
                        $('#SerialTable').dataTable().fnAddData([$("#ItemID").val(), $("#WareHouseID").val(), $("#BatchNum").val(), "<input type='text' disabled='disabled' value='Default Serial' alt=" + $("#ItemCode").val() + ">", "Default Serial", $("#Quantity").val()]);
                    }
                    clearItem();
                }
            }

            else if (i == 0) {
                $('#Receipt').removeClass('active');
                $('#Serial').removeClass('inactive');
                $('#Receipt').addClass('inactive');
                $('#Serial').addClass('active');
            }

        }

        $(function () {
            $('input:text:first').focus();
            var $inp = $('input:text');
            $inp.bind('keydown', function (e) {
                var key = e.which;
                if (key == 13) {
                    e.preventDefault();
                    var nxtIdx = $inp.index(this) + 1;
                    $(":input:text:eq(" + nxtIdx + ")").focus();
                }
            });
        });
    }
}

function Addserials() {

    $('#SerialTable').dataTable().fnFilter();

    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;

    for (j = 0; j <= i - 1; j++) {
        var serialno = $('#SerialTable tbody tr td input[type=text]:eq(' + j + ')').val();
        if (serialno == '') {
            alert("Serial number is empty. Please fill all the serial numbers");
            return false;
        }
        else {
            if (/^[a-zA-Z0-9- ]*$/.test(serialno) == false) {
                alert("Invalid serial number");
                return false;
            }
        }
    }

    for (j = 0; j <= i - 1; j++) {
        var serialno = $('#SerialTable tbody tr td input[type=text]:eq(' + j + ')').val();
        $('#SerialTable').dataTable().fnUpdate(serialno, j, 4);
        $('#SerialTable tbody tr td input[type=text]:eq(' + j + ')').val(serialno);
    }

    $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val(), $("#CurrentStock").val()]);
    clearItem();
    $('#Receipt').removeClass('inactive');
    $('#Serial').removeClass('active');
    $('#Receipt').addClass('active');
    $('#Serial').addClass('inactive');
    $('#SerialTable').dataTable().fnFilter();
}

function Clrserials() {
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#ItemCode").val() + ">", j, 3);
        $('#SerialTable').dataTable().fnUpdate('', j, 4);
    }
}

function Cancelserials() {
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#ItemCode").val() + ">", j, 3);
        $('#SerialTable').dataTable().fnUpdate('', j, 4);
    }
    $('#Receipt').removeClass('inactive');
    $('#Serial').removeClass('active');
    $('#Receipt').addClass('active');
    $('#Serial').addClass('inactive');
}

function LoadSerials() {
    SerialTable = $('#SerialTable').DataTable({
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
                              "targets": [1],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [2],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [4],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [5],
                              "visible": false,
                              "searchable": false
                          },
        ],
        "oTableTools": {
            "sSwfPath": "~/Content/DataTables-1.10.1/swf/copy_csv_xls.swf",
            "sRowSelect": "single",
            "sSelectedClass": "row_selected",
            "sAutoWidth": "false",

        }
    });
}

function fetchDocNo(CtrlDocDesc, CtrlDocno, TransType) {
    var doccode = $("#" + CtrlDocDesc).val();
    var transtype = TransType;

    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ doccode: doccode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $("#" + CtrlDocno).val(data.currno);
            }
        },
        type: 'POST',
        url: 'FetchDocnoJSON'
    });
}