<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="robots" content="noimageindex, noarchive">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="theme-color" content="#000000">
        <title>首页</title>

        <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=basePath%>static/vendor/css/style.css" rel="stylesheet"/>
        <link href="<%=basePath%>static/vendor/css/letter.css" rel="stylesheet"/>
        <script src="<%=basePath%>static/vendor/css/popper.min.js"></script>
        <script src="<%=basePath%>static/vendor/js/jquery-3.4.1.min.js"></script>
        <script src="<%=basePath%>static/vendor/bootstrap/js/bootstrap.min.js"></script>

        <style>
          body{
            background-color: #ecf0f1;
          }
          pre{
				white-space: pre-wrap; /* css-3 */
				white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
				white-space: -pre-wrap; /* Opera 4-6 */
				white-space: -o-pre-wrap; /* Opera 7 */
				word-wrap: break-word; /* Internet Explorer 5.5+ */
				font-family: "微软雅黑";
				font-size:15px;
			}
			p{
				font-family: "微软雅黑";
				font-size:15px;
			}
        </style>
    </head>
    <body>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
              <a class="navbar-brand" href="#"></a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                  
              <div class="collapse navbar-collapse m-auto" id="navbarColor03">
                <ul class="navbar-nav m-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success active">&nbsp;   <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success">&nbsp;   <span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success" type="button" id="comment1">&nbsp;   <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;<span class="badge badge-light" id="send_number"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/letter/list.action"><button class="btn btn-outline-success">&nbsp;   <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  </ul>
                <form class="form-inline m-auto" >
                  <input class="form-control mr-sm-2" type="text" placeholder="请输入..." id="friend_id">
                  <button class="btn btn-success" type="button" data-toggle="modal" data-target="#search" onclick="mysearch()">搜索</button>
                </form>

                <div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <!--<h5 class="modal-title" id="exampleModalLongTitle">日志</h5>-->
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body m-auto">
                        <div class="m-auto">
                            <img src="<%=basePath%>static/img/${sspicture}" class="headPicture" id="sspicture"/>
                        </div>
                          
                          <div class="m-auto text-center"><span class="text-primary text-center" id="ssname"></span></div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" onclick = "addfriend()">添加</button>
                      </div>
                    </div>
                  </div>
              </div>

              </div>
            </nav>
            <div class="commentPopup themeColor" id="commentPopup" tabindex='-1'>
            <!-- 
            		<div class=""><span class="text-info">缘是南柯一梦</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
		             <div class=""><span class="text-info">欲盖弥彰</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
		             <div class=""><span class="text-info">hbw</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
		             <div class=""><span class="text-info">世辞</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
             -->
              
            </div>

            <div class="container">
              <div class="row">
                <div class="col-lg-4" style="margin-top:7px">
                  <div class="row">
                    <div class="row m-auto bg" style="width:380px;height:110px;background: url('<%=basePath %>static/img/background.jpg')">
                      <img class="headPicture" src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}"/>
                    </div>

                    <div class="container-fluid bordeShadow">
                      <div class="row" style="margin-top:20px;margin-bottom:20px">
                        <div class="col-lg-4 m-auto hand" onclick="mylist()">
                          <div class="row m-auto"><span>日志</span></div>
                          <span class="text-center">${dailyCount }</span>
                        </div>

                        <div class="col-lg-4 m-auto hand"  onclick="dailyfriend()">
                            <div class="row m-auto">好友</div>
                            <span class="text-center">${friendCount}</span>
                        </div>
                        <div class="col-lg-4 m-auto hand">
                            <div class="row m-auto">访问记录</div>
                            <span class="text-center">3</span>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>


                <div class="col-lg-8" style="margin-top:7px;">

                  <div class="row themeColor hand" style="padding-top:12px;" data-toggle="modal" data-target="#logModal">
                    <div class="col-lg-1">
                        <img class="smallHeadPicture" src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}"/>
                    </div>

                    <div class="col-lg-8">
                          <div class="form-group">
                              <div class="row">
                              <input class="form-control form-control hand" type="text" placeholder="输入内容..." id="inputLarge">
                              </div>
                          </div>
                    </div>
                    <div class="col-lg-2">
                        <button class="btn btn-primary">发日志</button>
                    </div>

                  </div>

                  <div class="modal fade show" id="logModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">日志</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                              <div class="form-group">
                                  <textarea class="form-control" id="daily_details" rows="25"></textarea>
                                </div>
                          </div>
                          <div class="modal-footer">
                                <select class="btn" id="privacy" >
                                    <option selected="selected">公共</option>
                                    <option>私密</option>
                                  </select>
                              
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="sendDaily()">发送</button>
                                  
                          </div>
                        </div>
                      </div>
                  </div>
					<c:forEach items="${dailyList}" var="daily">
						<div class="message themeColor">
                    <div class="row">
                        <div class="col-lg-1">
                            <img class="middleHeadPicture" src="<%=basePath %>static/img/${daily.daily_picture}"/>
                        </div>
                        <div class="col-lg-11">
                        <div style="clear:both">
                        	<div style="width:84px;float:left">
                        	<span class="author" >
                              <strong>${daily.daily_author}</strong>
                          </span>
                        	</div>
                        	<div style="margin-left:610px">
	                        	<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
								</button>
								<div class="dropdown-menu">
								  <a class="dropdown-item" href="<%=basePath %>daily/${daily.daily_id}/delete.action" >删除</a>
								</div>
							</div>
                        	</div>
                        </div>
                          
                          	
                         <c:if test="${USER_SESSION.user_id== daily.user_id}">
                          <div class="logContext">
                              <p class="text-primary" contenteditable="plaintext-only" onblur="updateDaily(${daily.daily_id},${USER_SESSION.user_id},${daily.user_id })" id="detail${daily.daily_id}" >${daily.daily_details}</p>
                          </div>
                          </c:if>
                          <c:if test="${USER_SESSION.user_id!= daily.user_id }">
                          	<div class="logContext">
                              <pre class="text-primary" >${daily.daily_details}</pre>
                          </div>
                          </c:if>
                        </div>
                    </div>
                    
                    <div class="row text-right">
                        <div class="col-lg-2">
                            <button class="btn">
                                <span class="glyphicon glyphicon-comment" > </span> 
                                </button>
                        </div>

                        <div class="col-lg-2">
                            <button class="btn">
                                <span class="glyphicon glyphicon-share-alt"> </span> 
                            </button>
                        </div>

                        <div class="col-lg-2">
                            <button class="btn">
                                <span class="glyphicon glyphicon-thumbs-up"> </span> 
                            </button>
                        </div>
                    </div>
                  </div>
                  
                  	<div class="row themeColor commentBody" id="bc${daily.daily_id}">
                  	<c:forEach items="${daily.comments}"  var="comment">
                        <div class="commentDiv">
                            <span class="user hand">${comment.user_name}&nbsp;&nbsp;:&nbsp;&nbsp;</span>
                            <span class="comment hand">${comment.com_detail}</span>
                        </div>
                    </c:forEach>
                      </div>
                  
                      <div class=" input-group mb-3"style="margin-top:5px;">
                        <input type="text" class="form-control" aria-describedby="emailHelp" placeholder="请输入想发送的内容..." id="c${daily.daily_id}"/>
                    <div class = "input-group-append">
                        <button class="btn btn-success" type="button" onclick="sendComment(${daily.daily_id})" >发送</button>
                    </div>
                  </div>
					</c:forEach>

                </div>
              </div>
            </div>
            
            <script>
              $(document).ready(function(){
                $('#commentPopup').hide();
              });
              $('#comment1').focus(function(){
                $('#commentPopup').show();
                $('#commentPopup').focus();
              });
              $('#commentPopup').blur(function(){
            	  //console.log("消失");
            	  $.ajax({
	        	        type : "get",
	        	        url : "<%=basePath%>read.action",
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
              
            </script>
			<script>
					function sendDaily(){
		          	  var daily_details =  $("#daily_details").val(); 
		          	  var privacy = "0";
		          	  if($("#privacy").val()=="私密"){
		          		  privacy = "1";
		          	  }
		          	  var json = {"daily_details":daily_details,"privacy":privacy};
		          	  
		          	  $.ajax({
		        	        type : "post",
		        	        url : "<%=basePath %>daily/create.action",
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
		          	  window.location.href = "<%=basePath %>daily/list.action";
		            }
		            
		            function mysearch(){
		            	var friend_id = $("#friend_id").val();
		            	console.log(friend_id);
		            	var json = {"friend_id":friend_id};
		            	$.ajax({
		        	        type : "post",
		        	        url : "<%=basePath %>search.action",
		        	        dataType:"json",
		        	        data: {"friend_id":friend_id},
		        	        success : function(data){
		        	            /*alert("username："+data.username+"   id："+data.id);*/
		        	            /*showFriend();*/
		        	            /*addAttribute("ssname",data.user.user_name);
		        	            addAttribute("sspicture",data.user.daily_picture);*/
		        	            /*console.log(data.user_name);*/
		        	            showFriend(data.user_name,data.daily_picture);
		        	        },
		        	        error : function(){
		        	        	/*showFriend();*/
		        	        }
		        	    })
		            }
		            
		            function showFriend(user_name,daily_picture){
		            	document.getElementById('ssname').innerHTML=user_name;
		            	var path =  "<%=basePath%>static/img/";
		            	path = path+daily_picture;
		            	document.getElementById("sspicture").src = path;
		            }
		            
		            function addfriend(){
		            	var to_id = $("#friend_id").val();
		            	$.ajax({
		        	        type : "post",
		        	        url : "<%=basePath %>addFriend.action",
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
		        	        url : "<%=basePath%>notice.action",
		        	        dataType:"json",
		        	        success : function(data){
		        	        	notice(data);
		        	        },
		        	        error : function(){
		        	        	/*showFriend();*/
		        	        	/*document.getElementById('friend_id').value="";
		        	        	$('#search').modal('hide');*/
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
		        	        url : "<%=basePath%>agree.action",
		        	        dataType:"json",
		        	        data: {"friend_id":friend_id},
		        	        success : function(data){
		        	        	//notice(data);
		        	        },
		        	        error : function(){
		        	        	/*showFriend();*/
		        	        	/*document.getElementById('friend_id').value="";
		        	        	$('#search').modal('hide');*/
		        	        }
		        	    });
		            }      
			</script>
			<script>
				function sendComment(daily_id){
					var name = "c"+daily_id;
					var bc = "bc"+daily_id;
					
					//console.log(name);
					var com_detail = document.getElementById(name).value;
					document.getElementById(name).value = "";
					$.ajax({
	        	        type : "post",
	        	        url : "<%=basePath%>comment.action",
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
					window.location.href = "<%=basePath %>dailyFriend.action";
				}
				
				function mylist(){
					window.location.href = "<%=basePath %>mylist.action";
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
			</script>
    </body>
</html>