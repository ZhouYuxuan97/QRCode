<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人中心</title>
<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css">
<link rel="stylesheet" href="${show }/css/center.css"></link>
<script src="${show }/tools/bs/js/jquery.min.js"></script>
<script src="${show }/tools/bs/js/bootstrap.js"></script>
</head>
<body>
	<!--z_nav-->
	<div class="z_nav">
		 <div class="container"> 
			<div class="col-md-1">
				<img src="${show}/photos/nav.png" class="" />
			</div>
			<div class="col-md-3">
				<h3>
					<strong>二维码生成网</strong>					
				</h3>
			</div>
			<div class="col-md-2 pull-right">
			  <!--  <button onclick="logoff()" class="btn  z_btn btn-info">退出登录</button>  -->
			</div>
		</div>
</div> 
	<!--z_nav-->
	<div class="z_bg">
		<!-- <div class="container" style="padding-top: 10px;"> -->
		<div class="z_content">
			<div class="row">
				<div class="z_left nav nav-pills nav-stacked">
					<h4>
						<strong></strong>
					</h4>
					<hr />
					<div class="col-md-10">
						<button class="btn btn-default btn-block active">
							<a href="">文件码</a>
						</button>
						<button class="btn btn-default btn-block">
							<a href="">网址码</a>
						</button>
						<button class="btn btn-default btn-block">
							<a href="">文本码</a>
						</button>
						<button class="btn btn-default btn-block">
							<a href="">图片码</a>
						</button>
						<button class="btn btn-default btn-block">
							<a href="">产品码</a>
						</button>
						<button class="btn btn-default btn-block">
							<a href="">企业码</a>
						</button>
						 <button onclick="logoff()" class="btn  btn-danger btn-block">退出登录</button>  
					</div>
				</div>
				<div class="z_right">
					<h4></h4>
					<br />
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item"
								src="${show }/transformControl/getFileList.action"></iframe>
						</div>
					</div>
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item"
								src="${show }/transformControl/getURLList.action"></iframe>
						</div>
					</div>
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="" scrolling="no"></iframe>
						</div>
					</div>
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="" scrolling="no"></iframe>
						</div>
					</div>
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="" scrolling="no"></iframe>
						</div>
					</div>
					<div class="row navs">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="" scrolling="no"></iframe>
						</div>
					</div>
				</div>
			</div>
			<!--<div class="row">-->
		</div>
		<!--<div class="container">-->
	</div>
	<!--<div class="z_content">-->
	<!--<div class="z_bg">-->
</body>
<script src="${show }/js/center.js"></script>
<script>
	function logoff() {
		self.location = "${show}/userControl/logoff.action";
	}
</script>
</html>