$(document).ready(function () {
    $('#MaterialContainer').jtable({
        title: 'Material List',
        paging: true,
        columnResizable: true,
        sorting: true,
        defaultSorting: 'Description ASC',
        actions: {
            listAction: 'MaterialMasterList'
        },
        fields: {
            Id:
                {
                    key: true,
                    create: false,
                    edit: false,
                    list: false
                },
            Category:
                {
                    title: "Category",
                    width: '25%'
                },
            Code:
                {
                    title: 'Code',
                    width: '15%'
                },
            Description:
                {
                    title: 'Description',
                    width: '25%'
                },
            Status:
                {
                    title: 'Status',
                    width: '15%'
                },
            Other: {
                title: '',
                sorting: false,
                display: function (data) { return "<a href=\"EditMaterial\\" + data.record.Id + "\">edit</a>" }
            }
        }
    });
    //Load category list from server
    $('#MaterialContainer').jtable('load');
});
