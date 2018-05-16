<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${show }/css/activation.css"/>
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
		<title></title>
	</head>
	<body>
		<div class="z_bg">
			<div class="z_content">
			<a href="https://mail.qq.com/cgi-bin/loginpage " class="btn btn-info btn-lg">激活</a>
			<br/><br/><br/>
			<span id = "z_activation" style="color: black;">注册成功！<span id="sid">5</span>s后即将跳转到激活页面</span>
			</div>
		</div>
	</body>
	<script>
sidobj=document.getElementById('sid');
s=5;
sobj=setInterval(function(){
	sidobj.innerHTML=--s;

	if(s==1){
		location="https://mail.qq.com/cgi-bin/loginpage ";
	}
},1000);
</script>
</html>