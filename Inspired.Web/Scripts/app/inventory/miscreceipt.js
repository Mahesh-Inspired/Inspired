$(document).ready(function () {

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
        Receipt_Save();
    });
});

function Receipt_Save()
{
    var Data = { "Data": "" };
    var ItemDetail = { "ItemCode": "", "ItemDesc": "", "ItemID": "", "WareHouseID": "", "WareHouse": "", "BatchNum": "", "Quantity": "", "Notes": "" };
    var SerialNoDetail = { "ItemID": "", "WareHouseID": "", "BatchNum": "", "SerialNo": "", "Quantity": "" };
    var Receipt = { "RefNum": "", "RefDate": "", "DocNum": "", "DocCode": "", "DocDate": "", "TransType": "", "ItemDetail": [], "SerialNoDetail": [] };

    Receipt.RefNum = $("#RefNum").val();
    Receipt.RefDate = $("#RefDate").val();
    Receipt.DocNum = $("#DocNum").val();
    Receipt.DocCode = $("#Stock_DOC_CODE").val();
    Receipt.DocDate = $("#DocDate").val();
    Receipt.TransType = "misc";

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
        url: 'Receipt_Save',
        data: ' { data: ' + JSON.stringify(Receipt) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true)
                window.location.href = "/Inventory/MiscReceipt";
            else
                alert(data.Message);
        }
    });
}

function getCurrentDate() {
    var fullDate = new Date();
    var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
    return fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
}

function fetchItemDetails(CtrlItemCode, CtrlItemDesc, CtrlItemId, CtrlBatchYN) {
    var spareitemcode = $("#" + CtrlItemCode).val();
    if (spareitemcode == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemcode: spareitemcode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#' + CtrlItemDesc).val(data.ItemDescription);
                $('#' + CtrlItemId).val(data.id);
                $('#' + CtrlItemCode).val(data.ItemCode);
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
        error: function (e) { alert(e.Message); },
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

function clearItem()
{
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

    spareitemcode = $("#ItemCode").val();

    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemcode: spareitemcode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {

                var serial_flag = data.flag;            // check whether serial flag is true or false
                var rows = 0;                           // Current no. of rows in serial table
                var quantity = $('#Quantity').val();    // Current no. of quantities entered
                var i = 0;                              // Contains no. of items to be add or remove in serial Table
                var j = 0;                              // Iteration variable

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
                        $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val()]);
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
                            $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val()]);
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
                            $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val()]);
                            for (j = 0; j <= i - 1; j++) {
                                $('#SerialTable').dataTable().fnAddData([$("#ItemID").val(), $("#WareHouseID").val(), $("#BatchNum").val(), "<input type='text' disabled='disabled' value='Default Serial' alt=" + $("#ItemCode").val() + ">", "Default Serial", $("#Quantity").val()]);
                            }
                            clearItem();
                        }
                    }

                    else if (i == 0) {
                        $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val()]);
                        clearItem();
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

            } else if (data.success == false) {
                alert(data.Message);
            }
        },
        type: 'POST',
        url: 'FetchItemSNJSON'
    });
}

function Addserials() {

    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        var serialno = $('#SerialTable tbody tr td input[type=text]:eq(' + j + ')').val();
        $('#SerialTable').dataTable().fnUpdate(serialno, j, 4);
        $('#SerialTable tbody tr td input[type=text]:eq(' + j + ')').val(serialno);
    }

    $('#ItemsTable').dataTable().fnAddData([$("#ItemCode").val(), $("#ItemDesc").val(), $("#ItemID").val(), $("#WareHouseID").val(), $("#WareHouse").val(), $("#BatchNum").val(), $("#Quantity").val(), $("#Notes").val()]);
    clearItem();
    $('#Receipt').removeClass('inactive');
    $('#Serial').removeClass('active');
    $('#Receipt').addClass('active');
    $('#Serial').addClass('inactive');
}

function Clrserials() {
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#ItemCode").val() + ">", j, 3);
    }
    $('#SerialTable').dataTable().fnFilter($("#ItemCode").val());
}

function Cancelserials() {
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#ItemCode").val() + ">", j, 3);
    }
    $('#SerialTable').dataTable().fnFilter($("#ItemCode").val());
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
        data: addAntiForgeryToken({ doccode: doccode, trans_type: transtype }),
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