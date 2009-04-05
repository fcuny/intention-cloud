$(function() {
    $("#submit").click(function() {
        $('#spinner').show();
        $('#view').hide();
        var q = $("input#q").val();
        var engine= $("select#engine").val();
        var dataString = 'q='+ q + '&engine=' + engine;
        $.ajax({
            type: "POST",
            url: "cloud/search",
            data: dataString,
            success: function(response) {
                alert(response);
                $('#view').show().html(response);
                $('#spinner').hide();
            }
        });
        return false;
    });
    $("#random_cloud").click(function(){
        $('#spinner').show();
        $.ajax({
            type: "GET",
            url: "cloud/random",
            success: function(response) {
                $('#view').show().html(response);
                $('#spinner').hide();
            }
        });
        return false;
    });

});
