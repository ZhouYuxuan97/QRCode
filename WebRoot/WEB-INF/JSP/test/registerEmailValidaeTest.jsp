<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
	</head>
	<body>
   <h2>注册激活</h2>
    <form action="${show }/userControl/addUser?action=register" method="post">
        Email:<input type="text" id="email" name="email" value="" >
        <input type="submit" value="提交">
    </form>
    </body>