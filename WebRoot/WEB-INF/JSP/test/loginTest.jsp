<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<title>登录页面</title>
	</head>
	<body>
		<form action="${show }/userControl/login" method="post">
			用户名：<input type="text" name="username" >	
			密码：<input type="password" name="password" >
			<input type="submit" value="登录" >	
		</form>	
	</body>
</html>