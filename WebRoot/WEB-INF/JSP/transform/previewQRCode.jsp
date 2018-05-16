<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />
<c:set var="myname" value="${myuuid}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
<link rel="stylesheet" href="${show }/css/web_recode.css" />
<script src="${show }/tools/bs/js/jquery.min.js"></script>
<script type="text/javascript" src="${show}/tools/layer/2.1/layer.js"></script>
<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
<script src="${show }/tools/bs/js/holder.min.js"></script>
<title></title>
</head>
<body>
 <div class="container">

		<div  style="width:500px;margin: 0 auto;">
			<div>
				<div>
					<div class="modal-body">
							<img style="height:220px;width:220px" src="${show}/files/QRCode/${myname}.jpg" alt="">	
					</div>
					<div class="modal-footer">
						<!-- <button class='btn btn-info save'>保存</button>
						<button class='btn btn-default' >关闭</button> -->
							<a><button class="btn btn-default" onclick="downloadQRCode()">下载</button></a>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<script>
		//下载二维码
	function downloadQRCode() {	
		/*JQuery的ajax函数的返回类型只有xml、text、json、html等类型，
	 	 *没有“流”类型，所以我们要实现ajax下载，不能够使用相应的ajax函数进行文件下载。
		 *但可以用js生成一个form，用这个form提交参数，并返回“流”类型的数据。在实现过程中，页面也没有进行刷新。*/
		 
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","${show}/transformControl/download.action?fileName=${myname}");
		
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","uploadFile");
		input1.attr("value",(new Date()).getMilliseconds());
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		
		form.submit();//表单提交 
	}
	</script>
	</body>
</html>