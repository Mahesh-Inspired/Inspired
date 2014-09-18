function LoadAlternates() {
    alternateTable = $('#AlternateTable').DataTable({
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
                              "targets": [5],
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
    $('#AlternateTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#AlternateTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = alternateTable.$('tr.selected');
            var oTable = $('#AlternateTable').dataTable().fnGetData(sRow);
            $("#AlternateItemCode").val((oTable[2]).toString());
            $("#AlternateItemDesc").val(oTable[3].toString());
            $("#AlternateItemId").val(oTable[0].toString());
            $("#ListRelativeAlternate").val(oTable[5].toString());            
            $("#AlternateOverview").val(oTable[4].toString());
            $('#AlternateTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divAlternateDelete").show("slow");
        }
    });
    
    $("#divAlternateDelete").hide("slow");
}
function ClearAlternate() {
    $("#AlternateItemCode").val("");
    $("#AlternateItemDesc").val("");
    $("#AlternateItemId").val("");
    $("#ListRelativeAlternate").val("");
    $("#AlternateOverview").val("");
    $("#divAlternateDelete").hide("slow");
}
function AddAlternate() {
    var strErr = '';
    if ($('#ListRelativeAlternate').val() == null) 
        strErr = "Enter a valid type \n" ;
    if ($('#AlternateItemCode').val() == '' || $('#AlternateItemId').val() == '')
        strErr += "Enter a valid Item Code \n";
    if ($('#AlternateItemCode').val() == $('#Material_Code').val())
        strErr += "Item cannot be same as Parent Code \n";
    if ($('#AlternateItemDesc').val() == '')
        strErr += "Enter a valid Item description \n";
    if ($('#AlternateItemCode').val() != '')
    {
        var altTable = $('#AlternateTable').dataTable().fnGetData();
        for (var i = 0; i < altTable.length; i++) {
            if (altTable[i][2] == $('#AlternateItemCode').val() && altTable[i][1] == $('#ListRelativeAlternate').val()) {
                strErr += "Item code already exist in the table \n";
                break;
            }
        }
    }
    if (strErr != '')
    {
        alert(strErr);
        return false;
    }
    $('#AlternateTable').dataTable().fnAddData([$("#AlternateItemId").val(), $("#ListRelativeAlternate option:selected").text(), $("#AlternateItemCode").val(), $("#AlternateItemDesc").val(), $("#AlternateOverview").val(), $("#ListRelativeAlternate").val()]);
    ClearAlternate();
    $("#divAlternateDelete").hide("slow");
}

