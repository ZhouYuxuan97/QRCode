<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css" />
<link rel="stylesheet" href="${show }/css/web_recode.css" />
<script src="${show }/tools/bs/js/jquery.min.js"></script>
<script src="${show }/js/jquery.form.js"></script> 
<script src="${show}/tools/layer/2.1/layer.js"></script>
<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
<script src="${show }/tools/bs/js/holder.min.js"></script>
<title></title>
</head>
<body>

<!--编辑-->				
				<div class="container" style="margin-top:10px">		
						<!-- <h3 align="center" class='page-header'>编辑</h3>		 -->	
					<!-- 表单 -->
						<form action="${show}/transformControl/saveFileEdit.action" id="editForm" class='form-horizontal'>
							<div class="form-group" style="display: none;">
								<label for="" class='col-sm-2 control-label'>ID:</label>	
								<div class="col-sm-10">
									<input type="text"class='form-control'>
								</div>
							</div>
							<div class="form-group" style="display: none;">
								<label for="" class='col-sm-2 control-label'>UserId:</label>	
								<div class="col-sm-10">
									<input type="text"class='form-control'>
								</div>
							</div>
							<div class="form-group" style="display: none;">
								<label for="" class='col-sm-2 control-label'>UUID:</label>	
								<div class="col-sm-10">
									<input type="text"class='form-control' id="uuid" name="uuid" value="${transform.uuid}">
								</div>
							</div>
							<div class="form-group">
								<label for="" class='col-sm-2 control-label'>原文件名:</label>	
								<div class="col-sm-10">
									<input type="text"class='form-control' disabled="disabled" value="${transform.detail}">
								</div>
							</div>
							<div class="form-group">
								<label for="" class='col-sm-2 control-label'>文件名:</label>	
								<div class="col-sm-10">
									<input type="text"class='form-control' placeholder='文件描述' id="fileDetail">
								</div>
							</div>
							<div class="form-group">
								<label for="" class='col-sm-2 control-label'>选择文件:</label>	
								<div class="col-sm-10">
									<!--<input type="file"class='form-control'>-->
								<div class="upload_before" style="overflow: hidden;">
								<i class="upload-icon-file"></i>
								<h4 id="up">上传文件</h4>
								<input type="file" id='uploadFile' name="uploadFile" onchange="handleFile()">
							 <!--   <p  type="text" value="文件描述" id="fileName" style="background-color: yellow;"/></p>-->
							     </div>
								</div>
							</div>
							<div class="modal-footer">
									<button class='btn btn-info btn-lg'onclick="saveEdit();">保存</button>		
							</div>
						</form>
					<!-- 表单 -->
					
			<!--编辑-->
			</div>
		<script>
		
		function saveEdit(){
			//var index = parent.getFrameIndex(window.name);
				$("#editForm").ajaxForm({
					type : 'post',
					//async:false,
					//contentType : false,
					dataType:'json',
					data:$('#editForm').serialize(),
					url:'${show}/transformControl/saveFileEdit.action',  
					success:function(data){				
						if(data == "error") {
							alert("信息不完整,编辑失败！");
							return;
						}else if(data == "success") {
							layer.msg('已保存!',{icon:1,time:1000},function() {
								window.parent.location.reload();													
								//parent.layer.close(index);	
							});																	
						}								
					},
					error:function() {
						alert("网络出现异常！");
					}
				});
			/*var formElement = document.getElementById("editForm");
			formElement.action = "${pageContext.request.contextPath }/comments/saveEditComment?commentId="+${comment.id};
			formElement.submit();*/
		}
		
		//文件描述
		var file = document.getElementById("uploadFile");  
		var fileName = document.getElementById("fileDetail");  
		function handleFile(){  
		    fileName.value = file.value;  
		}
	//上传文件
	//点击A 相当于点击B
		tidobj=document.getElementById('uploadFile');
		upobj=document.getElementById('up');
		upobj.onclick=function(){
			tidobj.click();
		};
</script>
</body>
</html>