<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>	 
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.css" />
		  <link rel="stylesheet" href="${show }/css/add_file_recode.css" />
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script src="${show}/tools/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="${show }/tools/bs/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${show }/tools/bs/js/holder.min.js" ></script>
	</head>
	<body>
	 <h3 class="page-herder"></h3>
	<div class="container">
	<form class="input-group">
					<input type="text" id="toUrl" placeholder=" http://" class="webseit-form form-control" />
					<div class="input-group-btn">
					<button type="button" onclick="getUrl()" class="btn btn-info">点击生成活码</button>
					</div>
			</form>
			<div class="page_left pull-left"> </div>
					
			<!--右边生成框-->
			<div class="page_right pull-left" style="margin-left:244px;">
				<div class="result">
					<div id="hasimg"class="image">
						 <img src="holder.js/220x220">
					</div>
					<div class="download">
						<button class="btn btn-default" onclick="downloadQRCode()">下载二维码</button>
					</div>				
				</div>
			</div>
			
		</div>	
		<hr/>
		<div class="z_button">
			<button class="btn btn-info" onclick="saveAdd()" style="width:160px">保存</button>	
			</div>	
	</body>
	<script>
		var name = "";
		//生成二维码
		function getUrl() {	
		if(document.getElementById("hasimg").getElementsByTagName("img").length)
				$("#hasimg img").remove();
		var url = document.getElementById("toUrl").value;	
		if(url == "http://") {
			alert("请输入网址");
			return false;
		}		
		$.ajax({
			type : 'GET',
			url : "${show }/transformControl/getURLQRCode.action",
			data:{toUrl : url},
			success : function(data) {
				if(data == "0") {
					alert("请输入网址");
					return false;
				}
				name  = data;				
				var urlimg = "<img style=\"height:220px;width:220px\" src=\"${show }/files/QRCode/"+ data +".jpg\"/>" ;
				$("#hasimg").append(urlimg);
			},
			error: function() {
				alert("请输入网址");
			}	
		});
	}
	
	//下载二维码
	function downloadQRCode() {	
		if(name == "") {
			alert("请先创建成二维码！");
			return false;
		}
		
		/*JQuery的ajax函数的返回类型只有xml、text、json、html等类型，
	 	 *没有“流”类型，所以我们要实现ajax下载，不能够使用相应的ajax函数进行文件下载。
		 *但可以用js生成一个form，用这个form提交参数，并返回“流”类型的数据。在实现过程中，页面也没有进行刷新。*/
		 
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","${show}/transformControl/download.action?fileName=" + name);
		
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","uploadFile");
		input1.attr("value",(new Date()).getMilliseconds());
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		
		form.submit();//表单提交 
	}
		
	//保存
	function saveAdd() {
		layer.msg('已保存',{icon:1,time:1000},function() {
			window.parent.location.reload();
		});
	}
	
	</script>
		
	</body>
</html>