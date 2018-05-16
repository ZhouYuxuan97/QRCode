<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />


<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>激活失败</title>
	<link rel="stylesheet" href="bs/css/bootstrap.min.css">
	<script src="bs/js/jquery.min.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
	<script src="bs/js/holder.min.js"></script>
	<script type="text/javascript" src="js/fail.js" ></script>
</head>
<body>
	<div class="container">
		<h1 class='page-header'><span class="glyphicon glyphicon-info-sign" style="font-size: 30px;"></span>&nbsp;<i>404</i> 页面未找到!</h1>	
		
		<!--<button class='btn btn-primary btn-lg smodal'>button</button>-->

		<div id="mymodal" class='modal fade'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="close" data-dismiss='modal'>&times;</div>
						<h3><span class="glyphicon glyphicon-info-sign" style="font-size: 25px;"></span>&nbsp;页面未找到！</h3>		
					</div>
					<div class="modal-body">
						<h4>可能是以下原因：</h4>	
						<ul>
							<li>已经激活过</li>
							<li>网络连接出现问题</li>
							<li>......</li>
						</ul>
						<h4><span><span id='sid'>5</span>秒后跳转到<a href="http://www.baidu.com">注册</a>页面</span></h4>
					</div>
					<div class="modal-footer">
						<button class='btn btn-primary' data-dismiss='modal'>知道了</button>
						<button class='btn btn-default' data-dismiss='modal'>关闭</button>
					</div>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>