<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>url列表</title>
  </head>
  <body>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<!--  tr>
				<th scope="col" colspan="11">评价列表</th>
			</tr>-->
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="selectAll" value="1"></th>
			
  	  			<th width="80">id</th>
  	  			<th width="200">type</th>
  	  			<th width="100">detail</th>
  	  			<th width="100">userid</th>
  	  			<th width="100">uuid</th>
  	  			<th width="100">图片</th>
  	  			<th width="200">操作</th>
			</tr>
		</thead>
		<c:forEach var="urllist" items="${urllist}">
		<tbody>
			<tr class="text-c">
				<td><input type="checkbox" value="${urllist.id}" name="selectOne"></td>
  	  				<td>${urllist.id}</td>
  	  				<td>${urllist.type }</td>
  	  				<td>${urllist.detail}</td>
  	  				<td>${urllist.userid }</td>
  	  				<td>${urllist.uuid}</td>
  	  				<td><img src="${show}/files/QRCode/${urllist.uuid}.jpg" alt="暂无图片" style="width:220px;height:220px;"/></td>
  	  							
				<!--评论管理操作 -->
				<td class="td-manage">
					<!-- a style="text-decoration:none" onclick="admin_stop(this,'10001')" href="javascript:;" title="停用">
						<i class="Hui-iconfont">查看反馈</i></a>  -->
					<a title="编辑" href="javascript:;" onclick="editData()" 
						class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">编辑</i></a> 
					<a title="删除" href="javascript:;" onclick="deleteData()" class="ml-5" style="text-decoration:none">
						<i class="Hui-iconfont">删除</i></a>
					<a title="删除" href="javascript:;" onclick="AddData()" class="ml-5" style="text-decoration:none">
						<i class="Hui-iconfont">添加</i></a>
				</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	<script src="${show }/tools/bs/js/jquery.min.js"></script>
	<script>
	
		function AddData() {
			self.location = "${show}/transformControl/jumpToAddQRCode.action?type=url";
		}
		
		function editData() {
			/*
			$.ajax({
				url : '${show}/transformControl/edit.action?id=10&type=url',
				type : 'get',
				async: false,
				success: function() {
					
				},
				error:function() {
					alert("网络出现异常！");
				}
			});*/
			self.location = "${show}/transformControl/edit.action?id=10&type=url";
		}
		
		function deleteData() {
			var id = "9";
			var type = "url";
			$.ajax ({
			type:'get',
			url:'${show}/transformControl/deleteQRCode.action',
			data:{
				id : id,
				type : type
			},
			dataType:'text',
			success: function(data){	
				if(data == "success") {
					$(this).parents("tr").remove();
					window.location.reload();
				}	
				else if(data == "error") {
					alert("错误");
				}				
			},
			error:function() {
					alert("网络出现异常！");
				}
		});
		}
	</script>
	</body>
</html>