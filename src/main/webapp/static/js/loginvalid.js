$("#loginBtn").click(function () {
    var userId = $("#userId").val();
    var password = $("#passWord").val();
    var user_check = $("input[name='user_check']:checked").val();
    if (!userId) {
        $("#valid").html("User ID can't be null!");
        return false;
    } else {
        if (!password) {
            $("#valid").html("Password can't be null!");
            return false;
        } else {
            if (!user_check) {
                $("#valid").html("Have you checked our user agreement?");
                return false;
            } else {
                $("#loginForm").submit();
            }
        }
    }
});