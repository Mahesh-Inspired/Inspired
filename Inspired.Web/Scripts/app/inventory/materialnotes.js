function LoadNotes() {
   notesTable = $('#NotesTable').DataTable({
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
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [11],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [12],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [13],
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
    $('#NotesTable tbody').on('click', 'tr',
    function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            $('#NotesTable').dataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            var sRow = notesTable.$('tr.selected');
            var oTable = $('#NotesTable').dataTable().fnGetData(sRow);
            $("#SuppCust_Id").val((oTable[0]).toString());
            $("#SuppCust_Code").val((oTable[1]).toString());
            $("#SuppCust_Name").val((oTable[2]).toString());
            $("#User_Code").val((oTable[3]).toString());
            $("#User_Id").val((oTable[4]).toString());
            $("#Notes_EntryDate").val((oTable[5]).toString());
            //$("#NotesType").val((oTable[6]).toString());
            $("#Item_Notes").val((oTable[7]).toString());
            $("#Notes_ExpiryDate").val((oTable[8]).toString());
            //$("#NotesPriority").val((oTable[9]).toString());
            $("#Action_UserCode").val((oTable[10]).toString());
            $("#Action_UserId").val((oTable[11]).toString());
            $("#NotesType").val((oTable[12]).toString());
            $("#NotesPriority").val((oTable[13]).toString());

            $('#NotesTable').dataTable().fnDeleteRow(sRow[0]);
            $("#divNotesDelete").show("slow");
        }
    });
    
    $("#divNotesDelete").hide("slow");
}
function ClearItemNotes() {
    $("#SuppCust_Id").val("0");
    $("#SuppCust_Code").val("");
    $("#SuppCust_Name").val("");
    $("#User_Code").val("");
    $("#User_Id").val("0");
    $("#Notes_EntryDate").val("");
   // $("#NotesType").val("");
    $("#Item_Notes").val("");
    $("#Notes_ExpiryDate").val("");
    
    $("#Action_UserCode").val("");
    $("#Action_UserId").val("0");
    $("#divNotesDelete").hide("slow");
    $('#NotesType option:first-child').attr("selected", "selected");
    $('#NotesPriority option:first-child').attr("selected", "selected");
}

function AddItemNotes() {
    var strErr = '';
    if (($('#SuppCust_Id').val() == null || $('#Supplier_Id').val() <= 0) && ($('#SuppCust_Code').val() != "" || $('#SuppCust_Name').val()!=""))
        strErr = "Enter a valid supplier \n" ;
    if ($('#User_Id').val() <= 0)
        strErr += "Enter a valid Taken by \n";
    if (!CheckDate($('#Notes_EntryDate').val()))
        strErr += "Enter a valid Entry date \n";
    if ($('#Notes_ExpiryDate').val() != "" && !CheckDate($('#Notes_ExpiryDate').val()))
        strErr += "Enter a valid Expiry date \n";
    if ($('#Item_Notes').val() == "")
        strErr += "Enter a valid Item Notes \n";
    if (($('#User_Id').val() == null || $('#User_Id').val() <= 0) && $('#User_Code').val() != "")
        strErr += "Enter a valid taken by \n";
    if (($('#Action_UserId').val() == null || $('#Action_UserId').val() <= 0) && $('#Action_UserCode').val() != "")
        strErr += "Enter a valid To be actioned by \n";
    if (strErr != '')
    {
        alert(strErr);
        return false;
    }
    $('#NotesTable').dataTable().fnAddData([$("#SuppCust_Id").val(), $("#SuppCust_Code").val(), $("#SuppCust_Name").val(),
        $("#User_Code").val(), $("#User_Id").val(), $("#Notes_EntryDate").val(), $("#NotesType option:selected").text(),
        $("#Item_Notes").val(), $("#Notes_ExpiryDate").val(), $("#NotesPriority option:selected").text(),
        $("#Action_UserCode").val(), $("#Action_UserId").val(), $("#NotesType option:selected").val(), $("#NotesPriority option:selected").val()]);
    ClearItemNotes();
    $("#divNotesDelete").hide("slow");
}


function FetchUserDetails(txtUserCode, txtUserId)
{
    var userCd = $('#' + txtUserCode).val();    
    if (userCd == '')
    {        
        $('#' + txtUserId).val('0');
        return;
    }
    $.ajax({
        context: document.body,
        data: addAntiForgeryToken({ Code: userCd }),
        error: function (e) { alert(e.Message); },
        success: function (data) {
            if (data.success == true) {
                $('#' + txtUserCode).val(data.code);                
                $('#' + txtUserId).val(data.id);
            } else if (data.success == false) {
                alert(data.Message);
                $('#' + txtUserCode).focus();
            }
        },
        type: 'POST',
        url: 'FetchUserDetails'
    });


}