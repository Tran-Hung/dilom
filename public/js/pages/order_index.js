let table_orders;

$(document).ready(function() {
    table_orders = $('#table_orders').DataTable({
        ajax: {
            url: url.data,
            data: function (d) {

            },
        },
        columns: [
            {
                data: "id",
            },
            {
                data: "travel.name",
            },
            {
                data: "quality",
            },
            {
                data: "price",
                render: function (data) {
                    return numeral(data).format('$0,0');
                }
            },
            {
                data: "amount",
                render: function (data) {
                    return numeral(data).format('$0,0');
                }
            },
            {
                data: "created_at",
                render: function (data) {
                    return moment(data, "YYYY-MM-DD").fromNow();
                },
            },
            {
                data: "id",
                render: function (data) {
                    let btnShow = `<button type="button" class="btn mr-2 btn-show"
                                        style="background-color: #007bff!important; color: #fff">
                                    <ion-icon name="enter-outline"></ion-icon>
                                 </button>`;
                    let btnDelete = `<button type="button" class="btn btn-download"
                                        style="background-color: #17a2b8!important; color: #fff">
                                    <ion-icon name="download-outline"></ion-icon>
                                 </button>`;

                    return btnShow + btnDelete;
                }
            },
        ],
        ordering:  [[ 0, 'asc' ]],
        processing: true,
        serverSide: true,
        searching: true,
        lengthChange: false,
        bPaginate: false,
    });
});

$("#table_orders").on("click", ".btn-show", function () {
    let row = $(this).closest('tr');
    let id = table_orders.row(row).data().id;

    window.location.href = "/orders/" + id;
});
