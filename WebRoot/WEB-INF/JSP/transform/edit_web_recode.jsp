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
<div class="container">
		<div id="mymodal1" style="width:500px;margin: 0 auto;">
			<div>
				<div>
					<div class="modal-body">
		<!-- 表单 -->
			<form action="${show}/transformControl/saveURLEdit.action" id="editForm" class='form-horizontal' method="post">
				<div class="form-group" style="display: none;">
					<label for="" class='col-sm-2 control-label'>ID:</label>	
					<div class="col-sm-10">
						<input type="text"class='form-control' id="id" name="id" />
					</div>
				</div>
				<div class="form-group" style="display: none;">
					<label for="" class='col-sm-2 control-label'>UserId:</label>	
					<div class="col-sm-10">
						<input type="text"class='form-control' id="userid" name="userid" />
					</div>
				</div>
				<div class="form-group" style="display: none;">
					<label for="" class='col-sm-2 control-label'>UUID:</label>	
					<div class="col-sm-10">
						<input type="text"class='form-control' id="uuid" name="uuid" value="${transform.uuid}"/>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'>原网址:</label>	
					<div class="col-sm-10">
						<input type="text"class='form-control' disabled="disabled" value="${transform.detail}" placeholder="http://localhost:8080/qrcode/userControl/jumpToCenter.action"/>
					</div>
				</div>
				<div class="form-group">
					<label for="" class='col-sm-2 control-label'>请输入新网址:</label>	
					<div class="col-sm-10">
						<input type="text"class='form-control' id="detail" name="detail" placeholder='https:'/>
					</div>
					<div class="modal-footer">
						<button class='btn btn-info save' onclick="saveEdit();">保存</button>

					</div>
				</div>
			</form>
		<!-- 表单 -->
					</div>
					
				</div>
			</div>	
		</div>
	</div>
<!--编辑-->

<script type="text/javascript">
		function saveEdit(){
			//var index = parent.layer.getFrameIndex(window.name);
				$("#editForm").ajaxForm({
					type : 'post',
					//async:false,
					//contentType : false,
					dataType:'json',
					data:$('#editForm').serialize(),
					url:'${show}/transformControl/saveURLEdit.action',  
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
	
	</script>
</body>
</html>
