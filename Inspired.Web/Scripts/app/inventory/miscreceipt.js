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

});

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
                var batch_flag = data.f;
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

function fetchWarehouse(CtrlWrhCode) {
    var Wrhcode = $("#" + CtrlWrhCode).val();
    var str = Wrhcode;
    var res = str.split("(");
    var res = res[1].split(")");
    var res = res[0];
    $("#" + CtrlWrhCode).val(res);
}

function LoadItems() {
    ItemsTable = $('#ItemsTable').DataTable({
        "bPaginate": false,
        "bFilter": false,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "columnDefs": [
                          {
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
            $("#item_code").val((oTable[0]).toString());
            $("#item_desc").val(oTable[1].toString());
            $("#ware_house").val(oTable[2].toString());
            $("#batch_num").val(oTable[3].toString());
            $("#quantity").val(oTable[4].toString());
            $("#notes").val(oTable[5].toString());

            $('#ItemsTable').dataTable().fnDeleteRow(sRow[0]);
            $("#delItem").show("slow");
        }
    });

    $("#delItem").hide("slow");
}

function clearItem()
{
    $("#delItem").hide("slow");
    $("#item_code").val("");
    $("#item_desc").val("");
    $("#ware_house").val("");
    $("#batch_num").val("");
    $("#quantity").val("");
    $("#notes").val("");
}

function AddItem() {

    if ($('#item_code').val() == '') {
        alert("Enter a valid Item Code");
        $('#SpareItemCode').focus();
        return false;
    }
    else if ($('#item_desc').val() == '') {
        alert("Enter a valid Item description");
        $('#SpareItemDesc').focus();
        return false;
    }
    else if ($('#ware_house').val() == '') {
        alert("Enter a valid Ware House");
        $('#SpareQuantity').focus();
        return false;
    }
    else if ($('#batch_num').val() == '') {
        alert("Enter a valid Batch Number");
        $('#SpareQuantity').focus();
        return false;
    }
    else if ($('#quantity').val() == '' || isNaN($('#quantity').val()) == true) {
        alert("Enter a valid quantity");
        $('#SpareQuantity').focus();
        return false;
    }

    spareitemcode = $("#item_code").val();

    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemcode: spareitemcode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {

                var serial_flag = data.f;               // check whether serial flag is true or false
                var rows = 0;                           // Current no. of rows in serial table
                var quantity = $('#quantity').val();    // Current no. of quantities entered
                var i = 0;                              // Contains no. of items to be add or remove in serial Table
                var j = 0;                              // Iteration variable

                $('#selItem').text($("#item_code").val());
                $('#SerialTable').dataTable().fnFilter($("#item_code").val());

                rows = document.getElementById("SerialTable").getElementsByTagName("tr").length - 2;

                if (rows == 0) {
                    if (serial_flag == 'True') {
                        for (j = 0; j <= quantity - 1; j++) {
                            $('#SerialTable').dataTable().fnAddData(["<input type='text' alt=" + $("#item_code").val() + ">"]);
                            $('#Receipt').removeClass('active');
                            $('#Serial').removeClass('inactive');
                            $('#Receipt').addClass('inactive');
                            $('#Serial').addClass('active');
                        }
                    }
                    else if (serial_flag == 'False') {
                        $('#ItemsTable').dataTable().fnAddData([$("#item_code").val(), $("#item_desc").val(), $("#ware_house").val(), $("#batch_num").val(), $("#quantity").val(), $("#notes").val()]);
                        for (j = 0; j <= quantity - 1; j++) {
                            $('#SerialTable').dataTable().fnAddData(["<input type='text' disabled='disabled' value='Default Serial' alt=" + $("#item_code").val() + ">"]);
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
                            $('#ItemsTable').dataTable().fnAddData([$("#item_code").val(), $("#item_desc").val(), $("#ware_house").val(), $("#batch_num").val(), $("#quantity").val(), $("#notes").val()]);
                            for (j = rows; j > quantity; j--) {
                                document.getElementById("SerialTable").deleteRow(j);
                            }
                            clearItem();
                        }
                    }

                    else if (i > 0) {
                        if (serial_flag == 'True') {
                            for (j = 0; j <= i - 1; j++) {
                                $('#SerialTable').dataTable().fnAddData(["<input type='text' alt=" + $("#item_code").val() + ">"]);
                                $('#Receipt').removeClass('active');
                                $('#Serial').removeClass('inactive');
                                $('#Receipt').addClass('inactive');
                                $('#Serial').addClass('active');
                            }
                        }
                        else if (serial_flag == 'False') {
                            $('#ItemsTable').dataTable().fnAddData([$("#item_code").val(), $("#item_desc").val(), $("#ware_house").val(), $("#batch_num").val(), $("#quantity").val(), $("#notes").val()]);
                            for (j = 0; j <= i - 1; j++) {
                                $('#SerialTable').dataTable().fnAddData(["<input type='text' disabled='disabled' value='Default Serial' alt=" + $("#item_code").val() + ">"]);
                            }
                            clearItem();
                        }
                    }

                    else if (i == 0) {
                        $('#ItemsTable').dataTable().fnAddData([$("#item_code").val(), $("#item_desc").val(), $("#ware_house").val(), $("#batch_num").val(), $("#quantity").val(), $("#notes").val()]);
                        clearItem();
                    }

                }

                $(function () {
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
    $('#ItemsTable').dataTable().fnAddData([$("#item_code").val(), $("#item_desc").val(), $("#ware_house").val(), $("#batch_num").val(), $("#quantity").val(), $("#notes").val()]);
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
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#item_code").val() + ">", j, 0);
    }
    $('#SerialTable').dataTable().fnFilter($("#item_code").val());
}

function Cancelserials() {
    var i = document.getElementById("SerialTable").getElementsByTagName("tr").length;
    var i = i - 1;
    for (j = 0; j <= i - 1; j++) {
        $('#SerialTable').dataTable().fnUpdate("<input type='text' alt=" + $("#item_code").val() + ">", j, 0);
    }
    $('#SerialTable').dataTable().fnFilter($("#item_code").val());
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
}

function fetchDocNo(CtrlDocDesc, CtrlDocno, TransType) {
    var doccode = $("#" + CtrlDocDesc).val();
    console.log(CtrlDocDesc);
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