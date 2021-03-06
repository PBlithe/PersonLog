<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="robots" content="noimageindex, noarchive">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="theme-color" content="#000000">
        <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover">
        <title>登录</title>

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
		// 判断是登录账号和密码是否为空
		function check(){
		    var usercode = $("#usercode").val();
		    var password = $("#password").val();
		    if(usercode=="" || password==""){
		    	$("#message").text("账号或密码不能为空！");
		        return false;
		    }  
		    return true;
		}
		</script>
</head>
<body class="text-center" background="static/img/bg6.jpg">
        <form class="form-signin" action="${pageContext.request.contextPath }/login.action" 
			                       method="post" onsubmit="return check()">
            <h1 class="h3 mb-3 font-weight-normal">常联系</h1>
            <p><img class="logo" src="static/img/logo.jpg"/></p>
            <div class="form-group">
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="text" id="usercode" class="form-control" placeholder="请输入账号..." name="usercode">
            </div>
            <div class="form-group">
                <label for="inputPassword" class="sr-only col-sm-2 col-form-label">Password</label>
                <input type="password" id="password" class="form-control" placeholder="请输入密码..." name="password">
            </div>
                    
                <p class="text-right"><a href="#" class="alert-link text-primary">忘记密码</a></p>
                <button class="btn btn-success btn-block" type="submit">登录</button>
                <p></p>
                <hr/>
                <div>
                <p class="text-primary">需要注册?</p>
                <button class="btn btn-danger btn-block btn-sm" type="button" onclick="register()">注册</button>
            </div>
        </form>
        
        <script>
        	function register(){
        		window.location.href = "<%=basePath%>register.action";
        	}
        </script>
    </body>
</body>
</html>
