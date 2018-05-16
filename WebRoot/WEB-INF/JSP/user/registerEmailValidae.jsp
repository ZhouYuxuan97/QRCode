<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="show" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<link rel="stylesheet" href="${show }/css/registerEmailValidae.css"/>
	<link rel="stylesheet" href="${show }/tools/bs/css/bootstrap.min.css"/>
	<script src="${show }/tools/bs/js/jquery.min.js"></script>
	<script src="${show }/tools/bs/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<div class="z_blank">
		<h3 class="page-header">二维码注册页面</h3>
	</div>
	<!-- <div class="jumbotron"> -->
 	<div class="z_bg">
		<div class="z_content">
			<!--面板-->
		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="panel-title">
					二维码注册
				</div>
			</div>
			<div class="panel-body">
				<!--媒体对象-->
				<div class="media">
					
					<div class="media-body">
						<div class="media-heading">
								<form action="${show }/userControl/addUser?action=register" method='post'>
			
		<p><div class="z_name" >用户名:</div>
			<input type="text" name='username' class='auth'>
			<span class='error' >字母开头数字组成</span>
			<span class='right'></span>
		</p>
	
		<p><div class="z_name" >密码:</div>
			<input type="password" name="password" class='auth'>
			<span class='error'>为大小写字母和数字</span>
			<span class='right'></span>
		</p>
		<p><div   class="z_name">邮箱:</div>
			<input type="text" class="auth" name='email'>
			<span class='error'>邮箱格式不正确</span>
			<span class='right'></span>
		</p>
		<p><div class="z_name">手机号码:</div>
			<input type="text" class="auth" name='phone' maxlength='11'>
			<span class='error'>手机号码格式不正确</span>
			<span class='right'></span>
		</p>
		<p>
			<input type="submit" value="提交" class="z_submit btn-info">
			<input type="reset" value="重置"  class="z_reset btn-info">
		</p>
	</form>
</div>
	</div>		
</div>	
<!--媒体对象-->					
			</div>
		</div>
				</div>
     <!--面板-->
		</div><!--z_content-->
	</div><!--z_bg-->
<!-- </div>大屏幕 -->

	

</div>	<!--container-->
</body>
<script>
// 表单验证

$('input[name=username]').blur(function(){
	val=this.value;

	if(!val.match(/^[a-zA-z]\w{3,15}$/)){
		$(this).data({'s':0});
		$(this).next().show();	
		$(this).next().next().hide();
	}else{
		$(this).data({'s':1});
		$(this).next().hide();	
		$(this).next().next().show();
	}
});
$('input[name=password]').blur(function(){
	val=this.value;

	if(!val.match(/^[a-zA-Z0-9]{6,10}$/)){
		$(this).data({'s':0});
		$(this).next().show();	
		$(this).next().next().hide();
	}else{
		$(this).data({'s':1});
		$(this).next().hide();	
		$(this).next().next().show();
	}
});

$('input[name=email]').blur(function(){
	val=this.value;

	if(!val.match(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/)){
		$(this).data({'s':0});
		$(this).next().show();
		$(this).next().next().hide();
	}else{
		$(this).data({'s':1});
		$(this).next().hide();
		$(this).next().next().show();
	}
});

$('input[name=phone]').blur(function(){
	val=this.value;

	if(!val.match(/^1(3|4|5|7|8)\d{9}$/)){
		$(this).data({'s':0});
		$(this).next().show();
		$(this).next().next().hide();
	}else{
		$(this).data({'s':1});
		$(this).next().hide();
		$(this).next().next().show();
		
	}
});
$('form').submit(function(){
	$('.auth').blur();

	tot=0;

	$('.auth').each(function(){
		tot+=$(this).data('s');
	});

	if(tot!=4){
		return false;
	}
});
</script>
</html>