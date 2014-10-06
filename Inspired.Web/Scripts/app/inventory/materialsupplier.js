function LoadSupplier() {
    supplierTable = $('#SupplierTable').DataTable({
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
                              "targets": [6],
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
    $('#SupplierTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#SupplierTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = supplierTable.$('tr.selected');
            var oTable = $('#SupplierTable').dataTable().fnGetData(sRow);
            $("#Supplier_Id").val((oTable[0]).toString());
            $("#Supplier_Code").val(oTable[1].toString());
            $("#Supplier_Name").val(oTable[2].toString());
            $("#Supplier_RefNumber").val(oTable[3].toString());            
            $("#Supplier_MinOrder").val(oTable[4].toString());
            $("#ListCurrency").val(oTable[6].toString());            
            $("#Supplier_Cost").val(oTable[7].toString());
            $("#Supplier_Notes").val(oTable[8].toString());
            $('#SupplierTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divSupplierDelete").show("slow");
        }
    });
    
    $("#divSupplierDelete").hide("slow");
}
function ClearSupplier() {
    $("#Supplier_Id").val("");
    $("#Supplier_Code").val("");
    $("#Supplier_Name").val("");
    $("#Supplier_RefNumber").val("");
    $("#Supplier_MinOrder").val("0");
    $("#ListCurrency").val("");
    $("#Supplier_Notes").val("");
    $("#Supplier_Cost").val("0");
    $("#divSupplierDelete").hide("slow");
}
function AddSupplier() {
    var strErr = '';
    if ($('#Supplier_Id').val() == null || $('#Supplier_Id').val() <= 0)
        strErr = "Enter a valid supplier \n" ;
    if ($('#Supplier_Code').val() == '' || $('#Supplier_Name').val() == '')
        strErr += "Enter a valid supplier \n";
    if ($('#Supplier_MinOrder').val() <= 0)
        strErr += "Enter a valid Minimum order quantity \n";
    if ($('#Supplier_Cost').val() <= 0)
        strErr += "Enter a valid supplier cost \n";
    if (strErr != '')
    {
        alert(strErr);
        return false;
    }
    $('#SupplierTable').dataTable().fnAddData([$("#Supplier_Id").val(), $("#Supplier_Code").val(), $("#Supplier_Name").val(),
        $("#Supplier_RefNumber").val(), $("#Supplier_MinOrder").val(), $("#ListCurrency option:selected").text(), $("#ListCurrency").val(),
        $("#Supplier_Cost").val(), $("#Supplier_Notes").val()]);
    ClearSupplier();
    $("#divSupplierDelete").hide("slow");
}
function FetchAccountDetails(txtAccCd, txtAccNm, txtAccId)
{    
    var accCd = $('#' + txtAccCd).val();
    var accNm = $('#' + txtAccNm).val();
    if (accCd == '' && accNm == '') return;    
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ Name: accNm, Code: accCd}),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#' + txtAccCd).val(data.code);
                $('#' + txtAccNm).val(data.name);
                $('#' + txtAccId).val(data.id);
            } else if (data.success == false) {
                alert(data.Message);
                $('#' + txtAccCd).focus();
            }
        },
        type: 'POST',
        url: 'FetchAccountDetails'
    });

}
