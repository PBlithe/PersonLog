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
        <title>首页
        </title>

        <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=basePath%>static/vendor/css/style.css" rel="stylesheet"/>
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

            <div class="container">
              <div class="row">
                <div class="col-lg-4" style="margin-top:7px">
                  <div class="row">
                    <div class="row m-auto bg" style="width:380px;height:110px;background: url('<%=basePath %>static/img/background.jpg')">
                      <img class="headPicture" src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}"/>
                    </div>

                    <div class="container-fluid bordeShadow">
                      <div class="row" style="margin-top:20px;margin-bottom:20px">
                        <div class="col-lg-4 m-auto hand">
                          <div class="row m-auto"><span>日志</span></div>
                          <span class="text-center">10</span>
                        </div>

                        <div class="col-lg-4 m-auto hand">
                            <div class="row m-auto">好友</div>
                            <span class="text-center">25</span>
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
                          <span class="author">
                              <strong>${daily.daily_author}</strong>
                          </span>
                          <div class="logContext">
                              <p class="text-primary">
                                ${daily.daily_details}
                                </p>
                          </div>
                        </div>
                    </div>
                    
                    <div class="row text-right">
                        <div class="col-lg-2">
                            <button class="btn">
                                <span class="glyphicon glyphicon-comment"> </span> 
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
                  <div class="row themeColor commentBody">
                        <div class="commentDiv">
                            <span class="user hand">Agin!:</span>
                            <span class="comment hand">骚啊！</span>
                        </div>
                        <div class="commentDiv">
                            <span class="user hand">月:</span>
                            <span class="comment hand">懂很多啊！</span>
                        </div>
                        <div class="commentDiv">
                            <span class="user hand">芳华:</span>
                            <span class="comment hand">必须点赞啊！</span>
                        </div>
                        <div class="commentDiv">
                            <span class="user hand">Showyan:</span>
                            <span class="comment hand">这两张图完美的说明了安卓和苹果手机的区别。现实的确就是图里的内容。</span>
                        </div>
                      </div>
                      
					</c:forEach>
                  
					<!-- 
							<div class="message themeColor">
                      <div class="row">
                          <div class="col-lg-1">
                              <img class="middleHeadPicture" src="static/img/user1.jpg"/>
                          </div>
                          <div class="col-lg-11">
                            <span class="author">
                                <strong>2号用户</strong>
                            </span>
                            <div class="logContext">
                                <p class="text-primary">
                                    苹果细节比所有手机都好。
                                    比如震动反馈，用久了苹果以为现在所有大厂旗舰机震动都差不多，但是上周试了下我爸才买的华为p30，发现震动不是一个层面的感觉，华为的震动是散开的，震动的重心一直在手机中央，而苹果震动是清脆集中的，震动的重心就是在你操作的地方。而且苹果的震动无处不在又自然，比如知乎点赞就可以感觉到。
                                    天，才注意到居然快两千赞了！！！！知乎用户不是姿势水平很高吗？
                                    怎么这么一个没营养的问题下无聊的回答关注度这么大？
                                    我的妈妈呀，一万一千个赞，760条评论，就这么一个问题这么一个回答。大家是有多空虚？？？╰ ╯╰ ╯╰ ╯非常感谢
                                     @天才少女阿福 的提醒，我这个回答居然还被人抄袭了，太令人震惊了。
                                     但更震惊的是山寨版居然也有八千赞。我不打算花精力维权投诉，毕竟这只是花了两分钟写的一个很水的回答。
                                     只是觉得太好笑了，想当年我的另一个号分享自己的人生巅峰—两个月逆袭考上985的考研经验，写了上千字，用心满满，干货满满，到头来不过百余赞。
                                     看到现在这样的回答三万赞还被山寨真的觉得好笑又讽刺。<br>
                                  
                                  苹果细节比所有手机都好。
                                  比如震动反馈，用久了苹果以为现在所有大厂旗舰机震动都差不多，但是上周试了下我爸才买的华为p30，发现震动不是一个层面的感觉，华为的震动是散开的，震动的重心一直在手机中央，而苹果震动是清脆集中的，震动的重心就是在你操作的地方。而且苹果的震动无处不在又自然，比如知乎点赞就可以感觉到。
                                  天，才注意到居然快两千赞了！！！！知乎用户不是姿势水平很高吗？
                                  怎么这么一个没营养的问题下无聊的回答关注度这么大？
                                  我的妈妈呀，一万一千个赞，760条评论，就这么一个问题这么一个回答。大家是有多空虚？？？╰ ╯╰ ╯╰ ╯非常感谢
                                   @天才少女阿福 的提醒，我这个回答居然还被人抄袭了，太令人震惊了。
                                   但更震惊的是山寨版居然也有八千赞。我不打算花精力维权投诉，毕竟这只是花了两分钟写的一个很水的回答。
                                   只是觉得太好笑了，想当年我的另一个号分享自己的人生巅峰—两个月逆袭考上985的考研经验，写了上千字，用心满满，干货满满，到头来不过百余赞。
                                   看到现在这样的回答三万赞还被山寨真的觉得好笑又讽刺。

                                    作者：江户川柯南
                                    链接：https://www.zhihu.com/question/318051785/answer/674099625
                                    来源：知乎
                                    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>
                            </div>
                          </div>
                      </div>
                      
                      <div class="row text-right">
                          <div class="col-lg-2">
                              <button class="btn">
                                  <span class="glyphicon glyphicon-comment"> </span> 
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
                    <div class="row  themeColor commentBody">
                            <div class="commentDiv">
                                <span class="user hand">Agin!:</span>
                                <span class="comment hand">骚啊！</span>
                            </div>
                            <div class="commentDiv">
                                <span class="user hand">月:</span>
                                <span class="comment">懂很多啊！</span>
                            </div>
                            <div class="commentDiv">
                                <span class="user hand">芳华:</span>
                                <span class="comment hand">必须点赞啊！</span>
                            </div>
                            <div class="commentDiv">
                                <span class="user hand">Showyan:</span>
                                <span class="comment hand">这两张图完美的说明了安卓和苹果手机的区别。现实的确就是图里的内容。</span>
                            </div>
                          </div>
					 -->
                  

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
		        	            /*alert("username："+data.username+"   id："+data.id);*/
		        	            /*showFriend();*/
		        	            /*addAttribute("ssname",data.user.user_name);
		        	            addAttribute("sspicture",data.user.daily_picture);*/
		        	            /*console.log(data.user_name);*/
		        	            /*showFriend(data.user_name,data.daily_picture);*/
		        	        },
		        	        error : function(){
		        	        	/*showFriend();*/
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
		        	    })
		            }
			</script>
    </body>
</html>