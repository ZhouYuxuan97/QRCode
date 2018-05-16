<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<!-- meta charset="utf-8"> -->
		<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>编辑url</title>


		<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

		<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	</head>

	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form role="form" method="post" id="editForm" action="${show}/transformControl/saveURLEdit.action" enctype="multipart/form-data">
						<div class="form-group" >
							<label for="price">ID</label>
							<input type="text" class="form-control" id="id" name="id" value="${tranform.id }" style="display:none;"/>
						</div>
						<div class="form-group">
							<label for="goodsName">type</label>
							<input type="text" class="form-control" id="type" name="type" value="${tranform.type }"/>
						</div>
						<div class="form-group">
							<label for="price">detail</label>
							<input type="text" class="form-control" id="detail" name="detail" value="${tranform.detail }" />
						</div>
						<div class="form-group">
							<label for="price">userid</label>
							<input type="text" class="form-control" id="userid" name="uerid" value="${tranform.userid}" />
						</div>

						<div class="form-group">
							<label for="intro">uuid</label>
							<textarea class="form-control" id="uuid" name="uuid" rows="3">${tranform.uuid}</textarea>
						</div>
						
						<button type="submit" class="btn btn-default" onclick="saveEdit();">保存</button>
					</form>
				</div>
			</div>
		</div>


		<script src="${show }/tools/bs/js/jquery.min.js"></script>
		<script type="text/javascript" src="${show }/js/jquery.form.js"></script> 
 	
	<script type="text/javascript">
		function saveEdit(){
			var index = parent.getFrameIndex(window.name);
				$("#editForm").ajaxForm({
					type : 'post',
					//async:false,
					//contentType : false,
					//dataType:'json',
					data:$('#editForm').serialize(),
					url:'${show}/transformControl/saveURLEdit.action',  
					success:function(data){				
						if(data == "error") {
							alert("信息不完整,编辑失败！");
							return;
						}else if(data == "success") {
							window.parent.location.reload();	
						//	parent.alert('已保存!');							
							this.close(index);																
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