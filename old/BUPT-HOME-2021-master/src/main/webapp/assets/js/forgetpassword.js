$("#sendBtn").click(function (){
    var user_id = $("#user_id").val();
    var user_name =$("#user_name").val();
    var user_TEL =$("#user_TEL").val();
    var user_nPassword =$("#user_nPassword").val();

    if(!user_id){
        $("#valid").html("User ID can't be null!");
        return false;
    }else {
        if (!user_name) {
            $("#valid").html("User Name can't be null!");
            return false;
        }else{
            if (!user_TEL) {
                $("#valid").html("Tel can't be null!");
                return false;
            }else{
                if(!user_nPassword){
                    $("#valid").html("New password can't be null!");
                    return false;
                }
            }
        }
    }
});