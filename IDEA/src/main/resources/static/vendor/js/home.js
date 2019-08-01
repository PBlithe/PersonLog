$(document).ready(function(){
    $('#commentPopup').hide();
    //alert("弹框!")
});
$(document).ready(function() {

    $('#comment1').click(function(){
        $('#commentPopup').show();
        $('#commentPopup').focus();
        console.log("弹框!");
    });
    $('#commentPopup').blur(function(){
        //console.log("消失");
        $.ajax({
            type : "get",
            url : "/read.action",
            dataType:"json",
            success : function(data){
                $("#commentPopup").html("");
                $("#send_number").html("");
                $('#commentPopup').hide();
            },
            error : function(){
            }
        })
    });
    });


function sendDaily(){
    var daily_details =  $("#daily_details").val();
    var privacy = "0";
    if($("#privacy").val()=="私密"){
        privacy = "1";
    }
    var json = {"daily_details":daily_details,"privacy":privacy};

    $.ajax({
        type : "post",
        url : "daily/create.action",
        contentType : "application/json;charset=utf-8",
        dataType : "json",
        data: JSON.stringify(json),
        success : function(data){
            /*alert("username："+data.username+"   id："+data.id);*/
            showDaily();
        },
        error : function(){
            showDaily();
        }
    })
}

function showDaily(){
    document.getElementById('daily_details').innerHTML="";
    window.location.href = "dailylist";
}

function mysearch(){
    var friend_id = $("#friend_id").val();
    console.log(friend_id);
    var json = {"friend_id":friend_id};
    $.ajax({
        type : "post",
        url : "/search.action",
        dataType:"json",
        data: {"friend_id":friend_id},
        success : function(data){
            showFriend(data.user_name,data.daily_picture);
        },
        error : function(){
            /*showFriend();*/
        }
    })
}

function showFriend(user_name,daily_picture){
    document.getElementById('ssname').innerHTML=user_name;
    var path =  "/img/";
    path = path+daily_picture;
    document.getElementById("sspicture").src = path;
}

function addfriend(){
    var to_id = $("#friend_id").val();
    $.ajax({
        type : "post",
        url : "/addFriend.action",
        dataType:"json",
        data: {"to_id":to_id},
        success : function(data){

        },
        error : function(){
            document.getElementById('friend_id').value="";
            $('#search').modal('hide');
        }
    })
}
window.onload = function(){
    //console.log("wzs");
    $.ajax({
        type : "get",
        url : "/notice.action",
        dataType:"json",
        success : function(data){
            notice(data);
        },
        error : function(){
        }
    });
}
function notice(data){
    var i;
    var html = "";
    if(data.length!=0)
        $("#send_number").html(data.length);
    //console.log(html);
    for(i=0;i<data.length;i++){
        var msg = data[i].user_id;
        //console.log(msg);
        html += `<div class=""><span class="text-info hand">`+data[i].user_name+`</span><span>&nbsp;&nbsp;请求添加好友&nbsp;&nbsp;</span><span href="#" class="text-info hand" onclick=agree(`+msg+`)>同意</span><span style="display:none">`+data[i].user_id+`</span></div>`;
    }
    //console.log(html);
    $("#commentPopup").html(html);
}
function agree(friend_id){
    console.log(friend_id);
    $.ajax({
        type : "post",
        url : "/agree.action",
        dataType:"json",
        data: {"friend_id":friend_id},
        success : function(data){
        },
        error : function(){
        }
    });
}

function sendComment(daily_id){
    var name = "c"+daily_id;
    var bc = "bc"+daily_id;

    //console.log(name);
    var com_detail = document.getElementById(name).value;
    document.getElementById(name).value = "";
    $.ajax({
        type : "post",
        url : "comment.action",
        dataType:"json",
        data: {"daily_id":daily_id,"com_detail":com_detail},
        success : function(data){
            var html = "";
            html = document.getElementById(bc).innerHTML;
            html += `<div class="commentDiv"><span class="user hand">`+data.user_name+`:</span><span class="comment hand">`+com_detail+`</span></div>`;
            document.getElementById(bc).innerHTML=html;
        },
        error : function(){
        }
    });
}

function dailyfriend(){
    console.log("错误!!!!");
    window.location.href = "/dailyFriend.action";
}

function mylist(){
    console.log("我的日志!!!");
    window.location.href = "/mylist.action";
}

function updateDaily(daily_id,user,id){
    var d = "detail"+daily_id;
    if(user!=id){
        //document.getElementById(d).innerHTML = details;
        return;
    }
    //console.log(user);
    //console.log(id);
    var daily_details = document.getElementById(d).innerHTML;
    console.log(daily_details);
    $.ajax({
        type : "post",
        url : "<%=basePath%>daily/update.action",
        dataType:"json",
        data: {"daily_id":daily_id,"daily_details":daily_details},
        success : function(data){
        },
        error : function(){
        }
    });
}