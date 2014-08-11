$(document).ready(function () {
    $('#CategoryContainer').jtable({
        title: 'Category List',
        paging: true,
        columnResizable: true,
        sorting: true,
        defaultSorting: 'Description ASC',
        actions: {
            listAction: 'CatList'
        },
        fields: {
            Id:
                {
                    key: true,
                    create: false,
                    edit: false,
                    list: false
                },
            TypeDescription:
                {
                    title: "Type",
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
                display: function (data) { return "<a href=\"EditCategory\\" + data.record.Id + "\">edit</a>" }
            }
        }
    });
    //Load category list from server
    $('#CategoryContainer').jtable('load');
});
