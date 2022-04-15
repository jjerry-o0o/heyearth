
$(function () {
    $("#about").click(function () {
        $.ajax({
            type: 'POST',
            url: '/about',
            data: $("#word"),
            error: function (error) {
                alert("Error!");
            },
            success: function (result) {
                var e = $(result).find('#list-body');
                $("#list-body").html(e);
            }
        });
    });
})