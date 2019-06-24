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
        <title>好友日志
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
                  <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/daily/list.action"><button class="btn btn-outline-success active">&nbsp;   <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success">&nbsp;   <span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><button class="btn btn-outline-success" type="button" id="comment1">&nbsp;   <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/letter/list.action"><button class="btn btn-outline-success">&nbsp;   <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;<span class="badge badge-light"></span></button></a>
                  </li>
                  </ul>
                <form class="form-inline m-auto">
                  <input class="form-control mr-sm-2" type="text" placeholder="请输入...">
                  <button class="btn btn-success" type="button" data-toggle="modal" data-target="#search">搜索</button>
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
                            <img src="static/img/user6.jpg" class="headPicture"/>
                        </div>
                          
                          <span class="text-primary">清霜白月</span>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">添加</button>
                      </div>
                    </div>
                  </div>
              </div>

              </div>
            </nav>
            <div class="commentPopup themeColor" id="commentPopup">
              <div class=""><span class="text-info">缘是南柯一梦</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
              <div class=""><span class="text-info">欲盖弥彰</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
              <div class=""><span class="text-info">hbw</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
              <div class=""><span class="text-info">世辞</span><span>请求添加好友</span><a href="#" class="text-info">同意</a><span>/</span><a href="#" class="text-info">不同意</a></div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-4" style="margin-top:7px">
                  <div class="row">
                    <div class="row m-auto bg" style="width:380px;height:110px;background: url('<%=basePath%>static/img/background.jpg')">
                      <img class="headPicture" src="${pageContext.request.contextPath}/static/img/${USER_SESSION.daily_picture}"/>
                    </div>

                    <div class="container-fluid bordeShadow">
                      <div class="row" style="margin-top:20px;margin-bottom:20px">
                        <div class="col-lg-4 m-auto hand">
                          <div class="row m-auto"><span>日志</span></div>
                          <span class="text-center">${dailyCount }</span>
                        </div>

                        <div class="col-lg-4 m-auto hand" onclick="dailyfriend()">
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

                  <c:forEach items = "${dailyList}" var = "daily">
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
              });
              $('#comment1').blur(function(){
                $('#commentPopup').hide();
              });
              
              function dailyfriend(){
					window.location.href = "<%=basePath %>dailyFriend.action";
				}
            </script>
    </body>
</html>