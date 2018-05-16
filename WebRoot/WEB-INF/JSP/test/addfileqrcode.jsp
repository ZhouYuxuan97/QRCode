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
 <form id="myform" action="${show}/transformControl/getFileQRCode.action" enctype="multipart/form-data" method="post">
  
  上传文件：<input type="file" id="uploadFile" name="uploadFile"><br/>
   <button type="submit" onclick="mybutton()">保存</button>
 
 </form>
 

</body>
<script src="${show }/tools/bs/js/jquery.min.js"></script>
 	<script type="text/javascript" src="${show }/js/jquery.form.js"></script> 
 	
 	<script>
 		function mybutton() {
		$("#myform").ajaxForm({
			type:'post',
			url:'${show }/transformControl/getFileQRCode.action',
			data:$("#myform").serialize(),
			success: function(data) {
				alert("提交成功了");
				if(data == "0"){
					alert("请选择文件");
					return false;
				}					
				self.location = "${show}/transformControl/getFileList.action";
			},
			error: function() {
				alert("请选择文件");
			}		
		});
		
	}
	</script>
</html>