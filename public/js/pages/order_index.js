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
                    let btnShow = `<button type="button" class="btn btn-show"
                                        style="background-color: #007bff!important; color: #fff">
                                    <ion-icon name="enter-outline"></ion-icon>
                                 </button>`;
                    return btnShow;
                }
            },
        ],
        processing: true,
        serverSide: true,
        searching: true,
        lengthChange: false,
        bPaginate: false,
        ordering: false,
    });
});

$("#table_orders").on("click", ".btn-show", function () {
    let row = $(this).closest('tr');
    let id = table_orders.row(row).data().id;

    window.location.href = url.index + id;
});
