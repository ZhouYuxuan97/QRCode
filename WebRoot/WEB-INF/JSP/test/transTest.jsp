<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>二维码</title>
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
	</head>
	<body>
	<form action="" method="post">
		<input type="text" name="toUrl" id="toUrl" />
	</form>
		<div id="d" style="height:300px;width=300px">
			
		</div>
		<input type="button"  onclick="mybutton();" value="提交" />
	
	</body>
	<script>
	function mybutton() {
		var myurl = document.getElementById("toUrl").value;
		//$("#imgid").attr('src','${show }/transformControl/getURLQRCode.action?toUrl=' + myurl);	
		var myimg = "<img style=\"height:200px;width:200px\" src=\"${show }/transformControl/getURLQRCode.action?toUrl="+myurl+"\"/>" ;
					$("#d").append(myimg);	
					return false;	
	}
		/*function getQRCode() {
			$.ajax({
				type:'post',
				url:'${show }/transformControl/getURLQRCode.action',
				data:$("form").serializeArray(),
				dataType:'json',
				success:function(data) {
					//var myimg = "<img style=\"height:200px;width:200px\" src=\"${show }/transformControl/getURLQRCode.action\"/>";
					//$("#d").append(myimg);
					$("#imgid").attr('src','${show }/transformControl/getURLQRCode.action');		
					return false;	
				}
			});
			
			<img id="imgid" style="height:200px;width:200px" src=""/>
			//$("#d img").attr("src","${show }/transformControl/getURLQRCode.action");
		}*/
	</script>
</html>