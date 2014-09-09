function LoadSpecification() {
    specTable = $('#SpecificationTable').DataTable({
        "bPaginate": false,
        "bFilter": true,
        "bInfo": false,
        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "columnDefs": [
                          {
                              "targets": [4],
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
    $('#SpecificationTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#SpecificationTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = specTable.$('tr.selected');
            var oTable = $('#SpecificationTable').dataTable().fnGetData(sRow);
            $("#SpecGroup").val((oTable[0]).toString())
            $("#SpecBatchNumber").val((oTable[1]).toString());
            $("#Specifications").append(new Option(oTable[2].toString(), oTable[4].toString(), false, true));
            $("#SpecValue").val((oTable[3]).toString());            
            $('#SpecificationTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divSpecDelete").show("slow");
        }
    });

    $("#divSpecDelete").hide("slow");
}
function ClearSpecification() {
    $("#SpecBatchNumber").val("");
    $("#SpecGroup").val("");
    $("#SpecValue").val("");
}
function AddSpecification() {
    if ($('#Specifications').val() == null) {
        alert("Enter a valid Specification");
        $('#Specifications').focus();
        return false;
    }
    else if ($('#SpecValue').val() == '') {
        alert("Enter a valid Specification value");
        $('#SpecValue').focus();
        return false;
    }    
    $('#SpecificationTable').dataTable().fnAddData([$("#SpecGroup").val(), $("#SpecBatchNumber").val(), $("#Specifications option:selected").text(), $("#SpecValue").val(), $("#Specifications").val()]);
    ClearSpecification();
    $("#Specifications option:selected").remove();
    $("#divSpecDelete").hide("slow");
}

//function fetchSpecGroup()
//{
//    var specGroup = $("#SpecGroup").val();
//    if (specGroup == '') return;
//    $.ajax({
//        context: document.body,
//        data: addAntiForgeryToken({ specgroup: specGroup }),
//        error: function (e) { alert(e.Message); },
//        success: function (data) {
//            if (data.success == true) {
//                $('#SpecGroup').val(data.SpecGroupDescription)
//                $('#SpecGroupId').val(data.SpecGroupId);
//            } else if (data.success == false) {
//                alert(data.Message);
//                $('#SpecGroup').focus();
//            }
//        },
//        type: 'POST',
//        url: 'fetchSpecGroupJSON'
//    });
//}
function fetchSpec() {
    if ($("#Specifications option").length <= 0) return;
    var specId = $("#Specifications").val();            
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ specid: specId }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#SpecGroup').val(data.SpecGroup)                
            } else if (data.success == false) {
                alert(data.Message);
                $('#Specifications').focus();
            }
        },
        type: 'POST',
        url: 'fetchSpecJSON'
    });
}

