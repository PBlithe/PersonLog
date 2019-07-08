<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
        <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover">
        <title>注册</title>

        <link href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/static/vendor/css/signin.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/vendor/css/style.css" rel="stylesheet"/>
        <script src="${pageContext.request.contextPath}/static/vendor/js/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}static/vendor/bootstrap/js/bootstrap.min.js"></script>

        <style type="text/css">
            body{
                width: 100%;
                height: 100%;
                background-image: url("static/img/bg5.jpg");
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
            html,body{
                height:100%;
            }

        </style>
        <script>
		function mycheck(){
		    var ps1 = $("#ps1").val();
		    var ps2 = $("#ps2").val();
		    console.log(ps1);
		    console.log(ps2);
		    if(ps1!=ps2){
		    	alert("密码不一致!");
		        return false;
		    }  
		    return true;
		}
		</script>
    </head>
    <body class="text-center">
            <form class="form-signin" action="${pageContext.request.contextPath }/add/register.action" 
			                       method="post" onsubmit="return mycheck()">
                    <h1 class="h3 mb-3 font-weight-normal">常联系</h1>
                    <p><img class="logo" src="static/img/logo.jpg"/></p>
                    <div class="form-group">
                            <label for="inputEmail" class="sr-only">Email address</label>
                            <input type="text" id="inputEmail" class="form-control" placeholder="请输入账号..." name="usercode">
                    </div>
                    <div class="form-group">
                            <label for="inputPassword" class="sr-only col-sm-2 col-form-label">Please enter password</label>
                            <input type="password" id="ps1" class="form-control" placeholder="请输入密码..." name="password">
                    </div>
                    <div class="form-group">
                            <label for="inputPassword" class="sr-only col-sm-2 col-form-label">Enter password again</label>
                            <input type="password" id="ps2" class="form-control" placeholder="请再次输入密码..." required="">
                    </div>
                    <button class="btn btn-success btn-block" type=submit>注册</button>
                    <p></p>
                    <hr/>
                    <div>
                        <p class="text-primary">已有账号？</p>
                        <button class="btn btn-danger btn-block btn-sm" type="button" onclick="login()" >登录</button>
                    </div>
            </form>
            
            <script>
            	function login(){
            		window.location.href="login.action";
            	}
            </script>
    </body>
</html>