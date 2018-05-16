<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${show }/css/registerEmailValidae.css"/>
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
		<script src="${show }/js/registerEmailValidae.js"></script>
		<title></title>
	</head>
	<body  >
		<div class="zbg" style="background-image: url(${show}/photos/bg.jpg); height: 500px;">
		<div class="container" >
			<h2 class="page-header">注册页面</h2>
			<div class="z_nav" style="height: 30px;"></div>
			<form action="${show }/userControl/addUser?action=register" class='form-horizontal' method="post">
				<div class="form-group">
					<label for="" class='col-sm-2 control-label '>用户名:</label>	
					<div class="col-sm-6">
						<input type="text" name="username" class='form-control username' placeholder='username'>
						<p class="help-block">由字母、数字、下划线组成，字母开头，4-16位 </p>
					</div>
					<div class="col-sm-4">
						<s></s>
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'>密码:</label>	
					<div class="col-sm-6">
						<input type="password" name="password" class='form-control password'placeholder="password">
						<p class="help-block">由大小写字母、数字组成 </p>
					</div>
					<div class="col-sm-4">
						<s></s>
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'>邮箱:</label>	
					<div class="col-sm-6">
						<input type="text" name="email" class='form-control mail' placeholder='mail'>
						<p class="help-block">用户名（英文）@邮箱服务器名称 </p>
					</div>
					<div class="col-sm-4">
						<s></s>
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'>电话号码:</label>	
					<div class="col-sm-6">
						<input type="text" name="phone" class='form-control phonenum' placeholder='phonenumber'>
						<p class="help-block">长度为11位 </p>
					</div>
					<div class="col-sm-4">
						<s></s>
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'></label>	
					<div class="col-sm-2 col-sm-offset-1">
						<input type="submit" value="提交" class="btn btn-lg btn-warning" style="width: 150px;"/>
					</div>
					<div class="col-sm-offset-1">
						<input type="reset" value="重置" class="btn btn-lg btn-info" style="width: 150px;"/>
					</div>
				</div>
			</form>
			</div>	
		</div>
	</body>
</html>