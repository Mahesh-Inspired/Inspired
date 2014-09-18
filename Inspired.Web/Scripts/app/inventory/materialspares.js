function LoadSpares() {
    spareTable = $('#SpareTable').DataTable({
        "bPaginate": false,
        "bFilter": true,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "columnDefs": [
                          {
                              "targets": [0],
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
    $('#SpareTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#SpareTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = spareTable.$('tr.selected');
            var oTable = $('#SpareTable').dataTable().fnGetData(sRow);
            $("#SpareItemCode").val((oTable[1]).toString());
            $("#SpareItemDesc").val(oTable[2].toString());
            $("#SpareItemId").val(oTable[0].toString());
            $("#SpareQuantity").val(oTable[3].toString());
            $("#SparePrice").val(oTable[4].toString());
            $("#SpareOverview").val(oTable[5].toString());
            $('#SpareTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divSpareDelete").show("slow");
        }
    });
    
    $("#divSpareDelete").hide("slow");
}
function ClearSpare() {
    $("#SpareItemCode").val("");
    $("#SpareItemDesc").val("");
    $("#SpareItemId").val("");
    $("#SpareQuantity").val("");
    $("#SparePrice").val("");
    $("#SpareOverview").val("");
    $("#divSpareDelete").hide("slow");
}
function AddSpare() {
    if ($('#SpareItemCode').val() == '') {
        alert("Enter a valid Spare Item Code");
        $('#SpareItemCode').focus();
        return false;
    }
    else if ($('#SpareItemCode').val() == $('#Material_Code').val())
    {
        alert("Spare Item cannot be same as Parent Code");
        $('#SpareItemCode').focus();
        return false;
    }
    else if ($('#SpareItemDesc').val() == '') {
        alert("Enter a valid Spare Item description");
        $('#SpareItemDesc').focus();
        return false;
    }
    else if ($('#SpareQuantity').val() == '') {
        alert("Enter a valid Spare quantity");
        $('#SpareQuantity').focus();
        return false;
    }
    else if ($('#SparePrice').val() == '')
    {
        alert("Enter a valid Spare price");
        $('#SparePrice').focus();
        return false;
    }
    if ($('#SpareItemCode').val() != '')
    {
        var spareTable = $('#SpareTable').dataTable().fnGetData();    
        for (var i = 0; i < spareTable.length; i++) {                        
            if (spareTable[i][1] == $('#SpareItemCode').val()) {
                alert("Spare item code already exist in the table");
                $('#SpareItemCode').focus();
                return false;
            }
        }
    }
    $('#SpareTable').dataTable().fnAddData([$("#SpareItemId").val(), $("#SpareItemCode").val(), $("#SpareItemDesc").val(), $("#SpareQuantity").val(), $("#SparePrice").val(), $("#SpareOverview").val()]);
    ClearSpare();
    $("#divSpareDelete").hide("slow");
}

function fetchItemDetails(CtrlItemCode, CtrlItemDesc, CtrlItemId) {
    var spareitemcode = $("#" + CtrlItemCode).val();    
    if (spareitemcode == '') return;
    if (spareitemcode == $("#Material_Code").val()) {
        alert("Item code cannot be same as the Parent code");
        $('#' + CtrlItemCode).focus();
        return false;
    }
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ itemcode: spareitemcode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#' + CtrlItemDesc).val(data.ItemDescription);
                $('#' + CtrlItemId).val(data.id);
            } else if (data.success == false) {
                alert(data.Message);
                $('#' + CtrlItemCode).focus();
            }
        },
        type: 'POST',
        url: 'fetchItemDescJSON'
    });
}

