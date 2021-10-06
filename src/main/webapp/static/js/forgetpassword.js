$("#sendBtn").click(function (){
    var user_id = $("#user_id").val();
    var user_name =$("#user_name").val();
    var user_TEL =$("#user_TEL").val();
    var user_nPassword =$("#user_nPassword").val();

    if(!user_id){
        $("#valid").html("User ID can't be null!");
        return false;
    }else {
        if (!isNum(user_id)) {
            $("#valid").html("User ID format is incorrect!");
            return false;
        }
        if (!user_name) {
            $("#valid").html("User Name can't be null!");
            return false;
        }else{
            if (!user_TEL) {
                $("#valid").html("Tel can't be null!");
                return false;
            }else{
                if (!isTel(user_TEL) && !isPhone(user_TEL)) {
                    $("#valid").html("Tel format is incorrect!");
                    return false;
                }
                if(!user_nPassword){
                    $("#valid").html("New password can't be null!");
                    return false;
                }
            }
        }
    }
});