$(document).ready(function () {
    $('#lookupcontainer').jtable({
        title: 'Lookup List',
        paging: true,
        columnResizable: true,
        sorting: true,
        defaultSorting: 'Description ASC',
        actions: {
            listAction: 'lupList'
        },
        fields: {
            Id:
                {
                    key: true,
                    create: false,
                    edit: false,
                    list: false
                },
            Type:
                {
                    title: "Type",
                    width: '25%'
                },
            Group:
                {
                    title: 'Group',
                    width: '15%'
                },
            Description:
                {
                    title: 'Description',
                    width: '25%'
                },
            Other: {
                title: '',
                sorting: false,
                display: function (data) { return "<a href=\"EditLookup\\" + data.record.Id + "\">edit</a>" }
            }
        }
    });
    //Load lookup list from server
    $('#lookupcontainer').jtable('load');
});
