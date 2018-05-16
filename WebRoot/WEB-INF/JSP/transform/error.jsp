<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<style>
		*{
			background-color: aliceblue;
		}
		.image{
			background: url(../photos/download.png);
			width: 50px;
			height: 150px;
			opacity: 1;
			overflow: hidden;
			position: absolute;
			top: 0;
			z-index: 2;
			margin-left: 370px;
			margin-top: 130px;
		}
		.words{
			margin-top: 277px;
			margin-left: 464px;
			font-size: 26px;
			font-family: "微软雅黑";
			font-weight: normal;
			color: #535353;
		}
	</style>
	<body>
		<div class="image">
			
		</div>
		<div class="words">
			<p>啊哦......网络连接失败 </p>
		</div>
	</body>
</html>
