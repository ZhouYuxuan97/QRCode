<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>二维码生成器</title>
<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
<link rel="stylesheet" href="${show }/css/add_file_recode.css" />
<script src="${show }/tools/bs/js/jquery.min.js"></script>
<script src="${show }/js/jquery.form.js"></script> 
<script src="${show}/tools/layer/2.1/layer.js"></script>
<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
<script src="${show }/tools/bs/js/holder.min.js"></script>
	</head>
	<body>	
		<div class="container">
			<div class="page_left pull-left">

				<form id="myform" action="${show}/transformControl/getFileQRCode.action" enctype="multipart/form-data" method="post">
				<!--文件上传前-->
					<div class="upload_before">
						<i class="upload-icon-file"></i>
						<h4 id="up">上传文件</h4>
						<input type="file" id='uploadFile' name="uploadFile" onchange="handleFile()">
						<!-- <input type="text" disabled="disabled" value="文件描述" id="fileDetail"> -->
						<p id="fileDetail"></p>
					</div>
					<div class="underbutton">
						<button type="submit" class="btn btn-success" onclick="getFileQRCode()">点击生成活码</button>
					</div>
				</form>
				<!--输入框-->
				<!--<form>
					<textarea name="content" style="width: 666px; margin-top: 20px;">给文件添加描述......</textarea>
				</form>			--> 
		</div>
					
			<!--右边生成框-->
			<div class="page_right pull-right">
				<div class="result">
					<div id="hasimg"class="image">
						 <img src="holder.js/220x220">
					</div>
					<div class="download">
						<button class="btn btn-info" onclick="downloadQRCode()">下载二维码</button>
					</div>
					
					
				</div>
			</div>
			
		</div>	
		<hr/>
		<div class="z_button">
			<button class='btn btn-default save btn-lg z_btn'  onclick="saveAdd()">保存</button>
			</div>	
	</body>
<script>

		var name = "";  //记录二维码图片的文件名字
		//文件描述
		var file = document.getElementById("uploadFile");  
		var fileName = document.getElementById("fileDetail");  
		function handleFile(){  
		    fileName.innerHTML = file.value;  
		}
		
		//上传文件
	//点击A 相当于点击B
		tidobj=document.getElementById('uploadFile');
		upobj=document.getElementById('up');
		upobj.onclick=function(){
			tidobj.click();
		};


		//获取二维码
		function getFileQRCode() {
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
</html>