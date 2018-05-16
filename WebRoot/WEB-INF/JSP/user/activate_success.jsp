<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
		<title>跳转</title>
	</head>
	<body>
		<div class="clock btn btn-lg btn-info col-md-offset-3 col-md-6" style="margin-top: 200px;">
			<span id = "" style="color: black;">激活成功！<span id="sid">5</span>s后即将跳转到登录页面</span>
		</div>
	</body>
	<script>
sidobj=document.getElementById('sid');
s=5;

sobj=setInterval(function(){
	sidobj.innerHTML=--s;

	if(s==0){
		location="${show}/userControl/jumpToLogin.ation";
	}
},1000);
</script>
</html>