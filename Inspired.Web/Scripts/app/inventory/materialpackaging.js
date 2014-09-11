function LoadPackaging() {
    boxTable = $('#PackagingTable').DataTable({
        "bPaginate": false,
        "bFilter": true,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "oTableTools": {
            "sSwfPath": "~/Content/DataTables-1.10.1/swf/copy_csv_xls.swf",
            "sRowSelect": "single",
            "sSelectedClass": "row_selected",
            "sAutoWidth": "false",

        }
    });
    $('#PackagingTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#PackagingTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = boxTable.$('tr.selected');
            var oTable = $('#PackagingTable').dataTable().fnGetData(sRow);
            $("#BoxNumber").val((oTable[0]).toString())
            $("#BoxLength").val((oTable[1]).toString());
            $("#BoxWidth").val((oTable[2]).toString());
            $("#BoxHeight").val((oTable[3]).toString());
            $("#BoxGrossWeight").val((oTable[4]).toString());
            $("#BoxNettWeight").val((oTable[5]).toString());
            $('#PackagingTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divPackDelete").show("slow");
        }
    });

    $("#divPackDelete").hide("slow");
}
function ClearPackaging() {
    $("#BoxNumber").val("0");
    $("#BoxLength").val("0");
    $("#BoxWidth").val("0");
    $("#BoxHeight").val("0");
    $("#BoxGrossWeight").val("0");
    $("#BoxNettWeight").val("0");
}
function AddBoxDetails() {
    if (CheckBoxDetails()) {
        $('#PackagingTable').dataTable().fnAddData([$("#BoxNumber").val(), $("#BoxLength").val(), $("#BoxWidth").val(), $("#BoxHeight").val(), $("#BoxGrossWeight").val(), $("#BoxNettWeight").val()]);
        ClearPackaging();
        $("#divPackDelete").hide("slow");
    }
}

function CheckBoxDetails()
{
    var msg = "";
    if (!$.isNumeric($("#BoxNumber").val()) || $("#BoxNumber").val() == "0")
        msg=msg + "Enter a valid Box Number \n";
    if ($("#BoxLength").val() !="" && !$.isNumeric($("#BoxLength").val())) 
        msg = msg + "Enter a valid Box Length \n";
    if ($("#BoxWidth").val() != "" && !$.isNumeric($("#BoxWidth").val()))
        msg = msg + "Enter a valid Box Width \n";
    if ($("#BoxHeight").val() != "" && !$.isNumeric($("#BoxHeight").val()))
        msg = msg + "Enter a valid Box Height \n";
    if ($("#BoxGrossWeight").val() != "" && !$.isNumeric($("#BoxGrossWeight").val()))
        msg = msg + "Enter a valid Box Gross Weight \n";
    if ($("#BoxNettWeight").val() != "" && !$.isNumeric($("#BoxNettWeight").val()))
        msg = msg + "Enter a valid Box Nett Weight \n";

    if (msg != "") {
        alert(msg);
        return false;
    }
    else
        return true;
}


