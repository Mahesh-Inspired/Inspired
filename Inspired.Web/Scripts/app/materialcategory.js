function LoadCategory() {
    catTable = $('#CategoryTable').DataTable({
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
                          }
        ],
        "oTableTools": {
            "sSwfPath": "~/Content/DataTables-1.10.1/swf/copy_csv_xls.swf",
            "sRowSelect": "single",
            "sSelectedClass": "row_selected",
            "sAutoWidth": "false",

        }
    });
    $('#CategoryTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#CategoryTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            //var tt = new $.fn.dataTable.TableTools(catTable);
            //var oTT = TableTools.fnGetInstance('CategoryTable');
            var sRow = catTable.$('tr.selected');
            var oTable = $('#CategoryTable').dataTable().fnGetData(sRow);
            $("#catCode").val((oTable[2]).toString());
            $("#catDescription").val(oTable[3].toString());
            $("#catId").val(oTable[4].toString());
            $("#Category_Type").append(new Option(oTable[1].toString(), oTable[0].toString(), false, true));
            $('#CategoryTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divCatDelete").show("slow");
        }
    });
    
    $("#divCatDelete").hide("slow");
}
function DeleteCategory() {
    $('#catCode').val('');
    $('#catDescription').val('');
    $("#divCatDelete").hide("slow");
}
function AddCategory() {
    if ($('#Category_Type').val() == null) {
        alert("Enter a valid Category Type");
        $('#Category_Type').focus();
        return false;
    }
    else if ($('#catCode').val() == '') {
        alert("Enter a valid Category code");
        $('#catCode').focus();
        return false;
    }
    else if ($('#catDescription').val() == '') {
        alert("Enter a valid Category Description");
        $('#catDescription').focus();
        return false;
    }

    $('#CategoryTable').dataTable().fnAddData([$("#Category_Type").val(), $("#Category_Type option:selected").text(), $("#catCode").val(), $("#catDescription").val(), $("#catId").val()]);
    $("#catCode").val("");
    $("#catDescription").val("");
    $("#catId").val("");
    $("#Category_Type option:selected").remove();
    $("#divCatDelete").hide("slow");
}

function fetchCategory() {
    var categoryType = $("#Category_Type").val();
    var categoryCode = $("#catCode").val();
    if (categoryCode == '') return;
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ catType: categoryType, catCode: categoryCode }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#catDescription').val(data.CategoryDescription)
                $('#catId').val(data.id);
            } else if (data.success == false) {
                alert(data.Message);
                $('#catCode').focus();
            }
        },
        type: 'POST',
        url: 'fetchCategoryJSON'
    });
}

