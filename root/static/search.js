$(function() {
    $("#submit").click(function() {
        $('#spinner').show();
        var q = $("input#q").val();
        var dataString = 'q='+ q;
        $.ajax({
            type: "POST",
            url: "search",
            data: dataString,
            success: function() {
                $('#view').html("<div id='message'>blah!</div>");
                $('#spinner').hide();
            }
        });
        return false;
    });
});
