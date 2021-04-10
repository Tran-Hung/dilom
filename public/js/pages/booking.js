$(document).ready(function () {
    $("input[name='quality']").trigger('keyup');
    $("#modalError").modal('show');
});

$("input[name='quality']").on('keyup', function (e) {
    let qty = $(this).val();
    let amount = price * qty;

    $("input[name='amount']").val(amount);
});
