$(function() {
    $("#submit").click(function() {
        $('#spinner').show();
        $('#view').hide();
        var q = $("input#q").val();
        var dataString = 'q='+ q;
        $.ajax({
            type: "POST",
            url: "search",
            data: dataString,
            //dataType: "json",
            success: function(response) {
                alert(response);
                $('#view').show().html(response);
                $('#spinner').hide();
            }
        });
        return false;
    });
});
