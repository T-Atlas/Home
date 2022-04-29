$("#registerBtn").click(function (){
    var user_id = $("#user_id").val();
    var user_name =$("#user_name").val();
    var password =$("#passWord").val();
    var age =$("#age").val();
    var user_email =$("#user_email").val();
    var user_tel =$("#user_tel").val();
    var user_room_id =$("#user_room_id").val();
    var user_check =$("#user_check").val();
    if(!user_id){
        $("#valid").html("User ID can't be null!");
        return false;
    }else {
        if (!user_name) {
            $("#valid").html("User Name can't be null!");
            return false;
        }else{
            if (!password) {
                $("#valid").html("Password can't be null!");
                return false;
            }else{
                if (!age) {
                    $("#valid").html("Age can't be null!");
                    return false;
                }else{
                    if (!user_email) {
                        $("#valid").html("E-mail can't be null!");
                        return false;
                    }else{
                        if (!user_tel) {
                            $("#valid").html("Tel can't be null!");
                            return false;
                        }else{
                            if(!user_room_id){
                                $("#valid").html("Room ID can't be null!");
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
});