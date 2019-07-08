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
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>日志管理</title>
	
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	 <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" /> 
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" /> 
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <!-- <nav> 标签定义导航链接的部分。 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<%-- <a class="navbar-brand" href="<%=basePath%>student/list.action">学生信息管理</a> --%>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	  
	 <li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li>
				      <a href="${pageContext.request.contextPath }/daily/list.action"  class="active">
				      <i class="fa fa-edit fa-fw"></i> 查询日志
				    </a>
				   
				</li>
				
			</ul> 
		</li>
	
	
	
	    <li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				
				<li>								    
				    <a href="#"  data-toggle="modal"  data-target="#newDaily"  class="active" 
				    onclick="clearDaily()">
				      <i class="fa fa-edit fa-fw"></i> 新日志
				    </a>
				   
				</li>
			</ul> 
		</li>

			
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.user_name}
				    </a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		
	</ul>
	
	
	
	<!-- 左侧显示列表部分 start-->
  <div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				
				<br><br><br>
				<li>
				     <a href="${pageContext.request.contextPath }/friend/list.action"  class="active">
				      <i class="fa fa-edit fa-fw"></i> 查询好友列表
				    </a>
				</li>
				
				
				
			</ul>

			
		</div>
	</div>  
	<!-- 左侧显示列表部分 end--> 

  </nav>
  
 
  
    <!--列表查询部分  start-->
	<div id="page-wrapper">
		
		<br><br>
          
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading">日志列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>							
								<th>内容</th>								
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="daily">
								<tr>
									<td>${daily.daily_id}</td>
									<td>${daily.daily_details}</td>
									<td>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteDaily(${daily.daily_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		
		
		
		<%-- <br><br>
          
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading">好友列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>	
								<th>好友name</th>								
								<th>操作</th>
							</tr>
						</thead>
						 <tbody>
							<c:forEach items="${list}" var="user">
								<tr>
									<td>${user.user_id}</td>
									<td>${user.user_name}</td>
									<td>
										<a href="#" class="btn btn-danger btn-xs" onclick="addFriend(${user.user_id})">添加</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div> --%>


		
		
	</div>
	<!-- 学生列表查询部分  end-->


</div>





<!-- 录入日志模态框 -->
 <div class="modal fade" id="newDaily" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">录入日志信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_daily_form">
					
					<!-- <div class="form-group">
						<label for="new_titile" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_title" placeholder="标题" name="no_title" />
						</div>
					</div> --> <!-- <tr>
                  <td height="30" align="right" class="STYLE2">身份：</td>
                  <td align="left"><select name="Type" id="Type">
                    <option value="">请选择</option>
                    <option value="系统管理员">系统管理员</option>
                    <option value="楼宇管理员">楼宇管理员</option>
                    <option value="学生">学生</option>
                  </select></td>
                  </tr> -->
				
				<div class="form-group">
						<label for="new_details" class="col-sm-2 control-label">内容</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_details" placeholder="内容" name="daily_details" />
						</div>
					</div>
					
					
				<div class="form-group">
						<label for="new_titile" class="col-sm-2 control-label">状态：</label>
						<div class="col-sm-10">
							<tr>
		                <!--   <td height="30" align="right" class="STYLE2">身份：</td> -->
		                  <td align="left">
		                     <select name="Type" id="Type">
			                    <!-- <option value="">请选择</option> -->
			                    <option value="公开">公开</option>
			                    <option value="存为草稿">存为草稿</option>
			                    <option value="私密">私密</option>
		                    </select>
		                 </td>
                            </tr>
						</div>
					</div>		
					

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createDaily()">确认录入</button>
			</div>
		</div>
	</div>
</div>









<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>

<script type="text/javascript">



/* //清空新建学生窗口中的数据
	function clearStudent() {
	    $("#new_studentName").val("");
	    $("#new_studentClass").val("")
	    $("#new_stuSex").val("")
	    $("#new_no").val("");
	    $("#new_times").val("");
	} */
	
	function clearDaily() {
	    $("#new_details").val("")
	}
	
	function createDaily() {
		$.post("<%=basePath%>daily/create.action",
				$("#new_daily_form").serialize(),function(data){
				        if(data =="OK"){
				            alert("信息录入成功！");
				            window.location.reload();
				        }else{
				            alert("信息录入失败！");
				            window.location.reload();
				        }
				    });
				}
	
	
	
	
	<%-- // 创建学生
	function createStudent() {
	$.post("<%=basePath%>student/create.action",
	$("#new_student_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("信息录入成功！");
	            window.location.reload();
	        }else{
	            alert("信息录入失败！");
	            window.location.reload();
	        }
	    });
	} --%>
	
	
	<%-- // 通过id获取修改的信息
	function editStudent(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>student/getStudentById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_stu_id").val(data.stu_id);
	            $("#edit_studentName").val(data.stu_name);
	            $("#edit_studentClass").val(data.stu_class)   
	            $("#edit_stuSex").val(data.stu_sex)
	            $("#edit_no").val(data.stu_no);
	            $("#edit_times").val(data.stu_times);
	          
	        }
	    });
	} --%>
	
	
    <%-- // 执行修改操作
	function updateStudent() {
		$.post("<%=basePath%>student/update.action",$("#edit_student_form").serialize(),function(data){
/* 		serialize()	常用于将表单内容序列化，以便用于AJAX提交。该函数主要根据用于提交的有效表单控件的name和value，将它们拼接为一个可直接用于表单提交的文本字符串，该字符串已经过标准的URL编码处理(字符集编码为UTF-8)。 */
			if(data =="OK"){
				alert("信息更新成功！");
				window.location.reload();
			}else{
				alert("信息更新失败！");
				window.location.reload();
			}
		});
	} --%>
	
	
	<%-- // 删除学生
	function deleteStudent(id) {
	    if(confirm('确实要删除吗?')) {
	$.post("<%=basePath%>student/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除学生失败！");
	                window.location.reload();
	            }
	        });
	    }
	} --%>
	
	
	// 删除公告
	function deleteDaily(id) {
	    if(confirm('确实要删除吗?')) {
	$.post("<%=basePath%>daily/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除公告失败！");
	                window.location.reload();
	            }
	        });
	    }
	} 
	
	
	
</script>
</body>
</html>