$("#registerBtn").click(function () {
    var user_id = $("#user_id").val();
    var user_name = $("#user_name").val();
    var password = $("#passWord").val();
    var age = $("#age").val();
    var user_email = $("#user_email").val();
    var user_tel = $("#user_tel").val();
    var user_room_id = $("#user_room_id").val();
    var user_check = $("input[name='user_check']:checked").val();
    if (!user_id) {
        $("#valid").html("User ID can't be null!");
        return false;
    } else {
        if (!isNum(user_id)) {
            $("#valid").html("User ID format is incorrect!");
            return false;
        }
        if (!user_name) {
            $("#valid").html("User Name can't be null!");
            return false;
        } else {
            if (!password) {
                $("#valid").html("Password can't be null!");
                return false;
            } else {
                if (!age) {
                    $("#valid").html("Age can't be null!");
                    return false;
                } else {
                    if (!isNum(age)) {
                        $("#valid").html("Age format is incorrect!");
                        return false;
                    }
                    if (!user_email) {
                        $("#valid").html("E-mail can't be null!");
                        return false;
                    } else {
                        if (!isEmail(user_email)) {
                            $("#valid").html("E-mail format is incorrect!");
                            return false;
                        }
                        if (!user_tel) {
                            $("#valid").html("Tel can't be null!");
                            return false;
                        } else {
                            if (!isTel(user_tel) && !isPhone(user_tel)) {
                                $("#valid").html("Tel format is incorrect!");
                                return false;
                            }
                            if (!user_room_id) {
                                $("#valid").html("Room ID can't be null!");
                                return false;
                            }
                            if (!user_check) {
                                $("#valid").html("Have you checked our user agreement?");
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
});