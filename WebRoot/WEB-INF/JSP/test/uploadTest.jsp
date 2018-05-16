<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE HTML>
<html>
<head>
 <title>文件上传</title>
</head>
 
<body>
 <form action="${show }/transformControl/getFileQRCode.action" enctype="multipart/form-data" method="post">
  
  上传文件：<input type="file" name="uploadFile"><br/>
  <input type="submit" value="提交">
 </form>
</body>
</html>