<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- <!DOCTYPE html> -->

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="robots" content="noimageindex, noarchive">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="theme-color" content="#000000">
        <title>私信
        </title>

        <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=basePath%>static/vendor/css/style.css" rel="stylesheet"/>
        <link href="<%=basePath%>static/vendor/css/letter.css" rel="stylesheet"/>
        <script src="<%=basePath%>static/vendor/js/jquery-3.4.1.min.js"></script>
        <script src="<%=basePath%>static/vendor/bootstrap/js/bootstrap.min.js"></script>

        <style>
          body{
            background-color: #ecf0f1;
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
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/daily/list.action"><button class="btn btn-outline-success ">&nbsp;   <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;    </button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success">&nbsp;   <span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;    </button></a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success "id="comment1">&nbsp;   <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;<span class="badge badge-light" id="send_number"></span></button></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success active">&nbsp;   <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;    </button></a>
                  </li>
                  </ul>
                <form class="form-inline m-auto">
                  <input class="form-control mr-sm-2" type="text" placeholder="请输入..."id="friend_id">
                  <button class="btn btn-success" type="button"  data-toggle="modal" data-target="#search" onclick="mysearch()">搜索</button>
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
                          
                          <span class="text-primary" id="ssname"></span>
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
            
            <div class="container m-auto">
                <div class="row">
                    <div class="col-lg-5 left ">
                      <div class="mylist themeColor">
                          <div class="row" >
                              <div class="col-lg-4 text-center hand " id="current">消息</div>
                              <div class="col-lg-4 text-center hand" id="friend">好友</div>
                              <div class="col-lg-4 text-center hand" id="moment">动态</div>
                          </div>
                          <div class="currentBody" id="currentBody">
                          <!-- 
                          		<div class="current hand">
                                <div class="current_list">
                                    <img class="middlePicture " src="static/img/user2.jpg"/>
                                </div>
                                <div>
                                    <span class="row text-primary">solariusyang</span>
                                    <span class="row text-secondary">计算机专业出身的金融从业者</span>
                                </div>
                              </div>
    
                              <div class="current hand">
                                <div class="current_list">
                                    <img class="middlePicture " src="static/img/胡言乱语.jpg"/>
                                </div>
                                <div>
                                    <span class="row text-primary">胡言乱语</span>
                                    <span class="row text-secondary"></span>
                                </div>
                              </div>
    
                              <div class="current hand">
                                <div class="current_list">
                                    <img class="middlePicture " src="static/img/逍遥居士.jpg"/>
                                </div>
                                <div>
                                    <span class="row text-primary">逍遥居士</span>
                                    <span class="row text-secondary">系统工程师</span>
                                </div>
                              </div>
                              <div class="current hand">
                                <div class="current_list">
                                    <img class="middlePicture" src="static/img/清霜白月.jpg"/>
                                </div>
                                <div>
                                <a href="${pageContext.request.contextPath}/letter/message.action">
                                	<span class="row text-primary">清霜白月</span>
                                    <span class="row text-secondary">系统工程师</span>
                                </a>
                                     <span class="row text-primary">清霜白月</span>
                                    <span class="row text-secondary">系统工程师</span> 
                                </div>
                              </div>
                           	-->
                          </div>
                          
                          <c:forEach items="${friendList}" var="friend">
                          		<div class="friendBody" id="friendBody">
                            	<div class="friend hand">
                                	<div class="friend_list">
                                    	<img class="middlePicture " src="${pageContext.request.contextPath}/static/img/${friend.friendPicture}"/>
                                	</div>
                                <div>
                               		<a href="${pageContext.request.contextPath}/letter/${friend.friend_id }/message.action">
                               			<c:if test="${friend.friend_id==sendto}">
                               				<span class="row text-primary text-success">${friend.friendName}</span>
                               			</c:if>
                               			<c:if test="${friend.friend_id!=sendto}">
                               				<span class="row text-primary">${friend.friendName}</span>
                               			</c:if>
                                    	<!--  <span class="row text-secondary">计算机专业出身的金融从业者</span>-->
                               		</a>
                                    
                                </div>
                              </div>
    						</div>
                          </c:forEach>
                          
                      </div>
                      
                      
                    </div>

                    <div class="col-lg-6 right">
                        <div class="mycontent themeColor" id="contentBody">
                            <!-- Left -->
                            <c:forEach items="${messages }" var="message">
                            		<c:if test="${message.sender!=message.owner_id}">
                            			<div class="sender">
			                                <div>
			                                    <img src="${pageContext.request.contextPath}/static/img/${friendPicture}">
			                                </div>
			                                <div>
			                                <div class="left_triangle"></div>
			                                <span> ${message.details } </span>
			                                </div>
			                          </div>
                            		</c:if>
                            		<c:if test="${message.sender==message.owner_id}">
		                            	<div class="receiver">
			                                <div>
			                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
			                                </div>
			                                <div>
			                                <div class="right_triangle"></div>
			                                <span> ${message.details } </span>
			                                </div>
		                            </div>  
                            		</c:if>
                            </c:forEach>
                        <!-- 
                        
                        <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 不属于你！ </span>
                                </div>
                            </div>  

                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 你属狗的 </span>
                                </div>
                            </div> 
                            <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 啥？ </span>
                                </div>
                            </div>  
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 因为我属猪 </span>
                                </div>
                            </div> 
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 这样在十二生肖里面我就可以靠得最近 </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 猪狗不如说得就是我们俩是不是很亲切呀 </span>
                                </div>
                            </div>
                            <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 你好 </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> Hi,很高兴认识你，感觉我们能成为好朋友呢 </span>
                                </div>
                            </div> 
                            <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 你说这话认真的吗？ </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 特别是那衣服显得人很精神 </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 今天又是愉快的一天呢！ </span>
                                </div>
                            </div>
                            <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 是啊！我爱学习 </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 我爱敲代码！ </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 我是谷歌派去微软的卧底！ </span>
                                </div>
                            </div>
                            <div class="receiver">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}">
                                </div>
                                <div>
                                <div class="right_triangle"></div>
                                <span> 哈哈哈哈哈哈哈 </span>
                                </div>
                            </div>
                            <div class="sender">
                                <div>
                                    <img src="${pageContext.request.contextPath}/static/img/user2.jpg">
                                </div>
                                <div>
                                <div class="left_triangle"></div>
                                <span> 嘿嘿~ </span>
                                </div>
                            </div>
                        
                         -->
                        <!-- Right -->
                            
                        </div>
                        

                        <div class="navbar-fixed-bottom">
                            <div class="inputBody">
                                    <div class="left_input">
                                        <input type="text" class="form-control" id="details" aria-describedby="emailHelp" placeholder="请输入想发送的内容...">
                                    </div>
                                    <div>
                                        <button class="btn btn-success" onclick="send(${USER_SESSION.user_id},${sendto})">发送</button>
                                    </div>
                            </div>
                            
                            </div>
                        </div>
                    </div>
                </div>

            <script>
            $(document).ready(function(){
                $('#contentBody').scrollTop( $('#contentBody')[0].scrollHeight);
                //$('#scroll_div').scrollLeft( $('#scroll_div')[0].scrollWidth);
                $('#currentBody').hide();
              });
              $('#current').click(function(){
                  $('#currentBody').show();
                  $('#friendBody').hide();
              });
              $('#friend').click(function(){
                  $('#currentBody').hide();
                  $('#friendBody').show();
              });
              $(document).ready(function(){
                $('#commentPopup').hide();
              });
              $('#comment1').focus(function(){
                $('#commentPopup').show();
                $('#commentPopup').focus();
              });
              $('#commentPopup').blur(function(){
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
              
              function send(owner_id,sendto){
            	  var sender = owner_id;
            	  var receiver = sendto;
            	  var details =  $("#details").val();  
            	  var flag = false;
            	  var json = {"sender":sender,"receiver":receiver,"owner_id":owner_id,"details":details,"sendto":sendto};
            	  
            	  $.ajax({
            	        type : "post",
            	        url : "<%=basePath %>/letter/add.action",
            	        contentType : "application/json;charset=utf-8",
            	        dataType : "json",
            	        data: JSON.stringify(json),
            	        success : function(data){
            	            /*alert("username："+data.username+"   id："+data.id);*/
            	            messageShow();
            	        },
            	        error : function(){
            	            alert("请求失败");
            	        }
            	    })
              }
              
              function messageShow(){
            	  window.location.href = "<%=basePath %>letter/${sendto}/message.action";
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
	        	    })
	            };
	            function notice(data){
	            	console.log("wzs");
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
	        	    })
	            }
            </script>
    </body>
</html>