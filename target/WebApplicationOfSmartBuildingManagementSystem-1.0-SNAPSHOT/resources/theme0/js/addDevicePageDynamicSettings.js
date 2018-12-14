
$(document).ready(function(){
    setUserName();
});

function setUserName() {
    var userLogin  = $("#userLogin").html();
    $("#userName").val(userLogin);
}