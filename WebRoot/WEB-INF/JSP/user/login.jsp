<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css">
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
		<title>欢迎登录</title>
	</head>
	<body>
		<div class="container" style="width: 400px;margin:0 auto;margin-top: 150px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<h3 align="center">登录</h3>
						</div>
					</div>
					<div class="panel-body">
		<!-- 表单 -->
			<form action="${show }/userControl/jumpToCenter.action" class='form-horizontal' method="post">
				<div class="form-group">
					<label for="" class='col-sm-3 control-label'>用户名:</label>	
					<div class="col-sm-7">
						<input type="text" name="username" id="username" class='form-control' placeholder='username'>
					</div>
				</div>

				<div class="form-group">
					<label for="" class='col-sm-3 control-label'>密码:</label>	
					<div class="col-sm-7">
						<input type="password" name="password" id="password" class='form-control' placeholder='password'>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="" class='col-sm-1 control-label'></label>
					<div class="col-md-7">
						<input type="button" onclick="mysubmit();" class="btn btn-info" value="登录" style="width: 250px;"/>
					</div>
				</div>				
			</form>
			</div>	
			</div>		
		</div>
		<script>
			function mysubmit() {
				$.ajax({
					type:'post',
					url:'${show}/userControl/login.action',
					data: $("form").serializeArray(),
					dataType:'json',
					success: function(result){
						if(result == "error") {
							alert("用户名或密码错误！");
							return false;
						}
						if(result == "noactivate") {
							alert("请先激活！");
							return false;
						}
						$("form").submit();
					}
				});
			}
		</script>
	</body>
</html>