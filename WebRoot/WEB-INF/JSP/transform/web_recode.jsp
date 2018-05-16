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
<script src="${show}/tools/layer/2.1/layer.js"></script>
<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
<script src="${show }/tools/bs/js/holder.min.js"></script>
<title></title>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="thumbnails">
					<c:forEach var="urllist" items="${urllist}">
						<li class="span4">
							<div class="thumbnail">
								<div class="row">
									<div class="z_img pull-left" style="margin-left: 30PX;">
										<img alt="100x100" src="${show }/photos/activation.jpg"
											class="img-circle">
									</div>
									<div class="caption">
										<div class="pull-left z_content" style="padding-left: 50PX; ">
											<h4>
												未命名活码<span class="glyphicon glyphicon-time">2017-07-25</span>
												</h4>
												网址：<span>${urllist.detail}</span>
										</div>
										<div class="pull-right">
											<div class="btn-group z_button">
												<button class="btn btn-default"
													onclick="previewQRCode(${urllist.id})">预览</button>
												<button class="btn btn-default"
													onclick="editData(${urllist.id})">编辑</button>
												<button class="btn btn-default"
													onclick="deleteData(${urllist.id})">删除</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--添加-->
		<p style="text-align: center;">
			<button class="btn btn-default" onclick="AddData()">
				<span class="glyphicon glyphicon-plus"></span> 添加网址码
			</button>
		</p>
		<!--添加-->

	</div>
	<script>
		
		//新增
		function AddData() {

			layer.open({
				type : 2,
				area : ['800px','500px'],
				content : "${show}/transformControl/jumpToAddQRCode.action?type=url"
			});
		}
		
		//预览
		function previewQRCode(id) {
			layer.open({
				type:2,
				area: ['530px','500px'],
				content:"${show}/transformControl/previewQRCode.action?id=" + id
			});
		}

		//编辑
		function editData(id) {

			layer.open({
				type : 2,
				area: ['600px','370px'],
				content : "${show}/transformControl/edit.action?id=" + id + "&type=url"
			});
		}

		//删除
		function deleteData(id) {
			layer.confirm('确认要删除吗？',function(index){
				var type = "url";
				$.ajax({
					type : 'get',
					url : '${show}/transformControl/deleteQRCode.action',
					data : {
						id : id,
						type : type
					},
					dataType:'json',
					success : function(data) {
						if(data == "success") {
							//$(this).parents("tr").remove();
							layer.msg('已删除!',{icon:1,time:1000},function() {
								window.location.reload();
							});						
						} else if (data == "error") {
							alert("错误");
						}
					},
					error : function() {
						alert("网络出现异常！");
					}
				});
			});
		}
	</script>
</body>
</html>