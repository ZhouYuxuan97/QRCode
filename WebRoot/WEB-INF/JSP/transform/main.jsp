<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页面</title>
		<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css">
		<link rel="stylesheet" href="${show }/css/main.css">
		<link rel="stylesheet" href="${show }/tools/kd/themes/default/default.css" />
		
		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script type="text/javascript" src="${show }/js/jquery.form.js"></script> 
		<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
		<script src="${show }/tools/bs/js/holder.min.js"></script>
		<script charset="utf-8" type="text/javascript" src="${show }/tools/kd/kindeditor-min.js"></script>
		<script type="text/javascript" src="${show }/tools/kd/lang/zh_CN.js" ></script>
		<script type="text/javascript" src="${show }/js/main.js" ></script>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h4>欢迎使用</h4>
				<div class="header">
					<a href="${show }/userControl/register.action">注册</a><a href="${show }/userControl/jumpToLogin.action">|个人中心</a>
				</div>
				
					
			</div>
			<!--左边控制 导航栏-->		
			<div class="page_left">
				<ul class='nav nav-tabs'>
					<li class='active'><a href="#files" data-toggle='tab' style="border:none !important; background:ailceblue !important;"><button type="button" class="btn btn-info">文件码生成</button></a></li>
					<li><a href="#websites" data-toggle='tab' style="border:none !important; background:ailceblue !important;"><button type="button" class="btn btn-info">网址码生成</button></a></li>
				</ul>
			</div>
			
			
			<div class='tab-content'>
				
				
				<!--中间编辑框-->
				<div class="page_center tab-pane active fade in" id='files'>
						
						<!--文件上传前-->
						<div class="upload_before">
							<i class="upload-icon-file"></i>
							<h4 id="up">上传文件</h4>
							<form id="myform" action="${show }/transformControl/getFileQRCode.action" enctype="multipart/form-data" method="post">
							<input type="file" id='uploadFile' name="uploadFile" onchange="handleFile()">
							<input type="text" disabled="disabled" value="文件描述" id="fileDetail">
							<div class="underbutton">
							<p><button type="submit" onclick="getFile()" class="btn btn-info">点击生成文件码</button></p>
						</div>	
							</form>
						</div>
					
											
				</div>
						
					<!--网址编辑框-->
					<div class="webseit tab-pane fade" id="websites">
						<div class="webseit-input">
							<input type="text" name="toUrl" id="toUrl" placeholder=" http://" class="webseit-form" />
						</div>
						<!--网址上传时-->
						
						<div class="underbutton">
							<p><button type="button" onclick="getUrl()" class="btn btn-info">点击生成网址码</button></p>
						</div>
					</div>
			</div>
			
			
			
			<!--右边生成框-->
			<div class="page_right">
				<div class="result">
					<div id="hasimg" class="image">
						 <img src="holder.js/220x220">
					</div>
					<div class="download">
						<button onclick="downloadQRCode();" class="btn btn-info">下载二维码</button>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
	//文件描述
		var file = document.getElementById("uploadFile");  
		var fileName = document.getElementById("fileDetail");  
		function handleFile(){  
		    fileName.value = file.value;  
		}
	
	var name = "";   //全局变量，获取每次生成的二维码图片的名字

	//生成url二维码
	function getUrl() {	
		var myimg = document.getElementById("hasimg");
		if(myimg!=null) {
			if(myimg.getElementsByTagName("img").length)
				$("#hasimg img").remove();
		}
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
	
	//生成文件二维码
	function getFile() {
		$("#myform").ajaxForm({
			type:'post',
			url:'${show }/transformControl/getFileQRCode.action',
			data:$("#myform").serialize(),
			success: function(data) {
				if(data == "0"){
					alert("请选择文件");
					return false;
				}					
				name = data;
				if(document.getElementById("hasimg").getElementsByTagName("img").length)
				$("#hasimg img").remove();
				//var filename = document.getElementById("tid").value;
				//$("#imgid").attr('src','${show }/transformControl/getURLQRCode.action?toUrl=' + myurl);	
				//var fileimg = "<img style=\"height:220px;width:220px\" src=\"${show }/transformControl/getFileQRCode.action?uploadFile="+filename+"\"/>" ;
				var fileimg = "<img style=\"height:220px;width:220px\" src=\"${show }/files/QRCode/"+ data +".jpg\"/>" ;
				$("#hasimg").append(fileimg);
			},
			error: function() {
				alert("请选择文件");
			}		
		});
		
	}
	
	//下载二维码
	function downloadQRCode() {
	//alert(name);
	//var fileName = "${sessionScope.myuuid}";
		/*$.ajax({
			type:'get',
			//data:{fileName:name},
			//dataType:'text',
			url:"${show}/transformControl/download.action?fileName=" + name,
			success: function(data) {
				alert("下载成功了！！");
			}
		});*/
		
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

	</script>
</html>