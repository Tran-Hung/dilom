let btnCheckout = $("#btnCheckout");
let btnSubmit = $("#btnSubmit");

$(document).ready(function () {
    $("input[name='quality']").trigger('keyup');
});

$("input[name='quality']").on('keyup', function (e) {
    let qty = $(this).val();
    let amount = price * qty;

    $("input[name='amount']").val(amount);
});

btnSubmit.on("click", function (e) {
    e.preventDefault();

    $("#frmSubmit").submit();
});

btnCheckout.on("click", function (e) {
    e.preventDefault();

    $("#modalCheckout").modal('show');
});

$("#modalCheckout").on("shown.bs.modal", function () {
    let name = $("input[name='name']").val();
    let phone = $("input[name='phone']").val();
    let email = $("input[name='email']").val();
    let address = $("input[name='address']").val();
    let note = $("textarea[name='note']").val();
    let payment_method = $("select[name='payment_method'] option:selected").text();
    let quality = $("input[name='quality']").val();
    let amount = $("input[name='amount']").val();

    $(".p-name").html(name);
    $(".p-phone").html(phone);
    $(".p-email").html(email);
    $(".p-address").html(address);
    $(".p-note").html(note);
    $(".p-payment_method").html(payment_method);
    $(".p-quality").html(quality);
    $(".p-amount").html(amount);
});

