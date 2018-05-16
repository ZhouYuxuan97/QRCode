window.onload = function() {
	var register = document.getElementsByClassName("container")[0];
	var regSpan = register.getElementsByTagName("span");//文字
	var regS = register.getElementsByTagName("s");//精灵图
	//获得焦点事件
	gainFocus(regSpan, regS);
	//失去焦点事件
	loseFocus(regSpan, regS);
};
//获得焦点事件
function gainFocus(objSpan, objS) {
	//用户名获得焦点
	var username = document.getElementsByClassName("username")[0];
	
	username.onfocus = function() {
		objSpan[0].innerHTML = "请输入用户名";
		objS[0].className = "warn";
	};
	//密码获得焦点事件
	var password = document.getElementsByClassName("password")[0];
	password.onfocus = function() {
		objSpan[1].innerHTML = "请输入密码";
		objS[1].className = "warn";
	};
	//邮箱获得焦点事件
	var mail=document.getElementsByClassName("mail")[0];
	mail.onfocus=function(){
		objSpan[2].innerHTML="请输入邮箱";
		objS[2].className="warn";
	};
	//手机号码获得焦点
	var phonenum=document.getElementsByClassName("phonenum")[0];
	phonenum.onfocus=function(){
		objSpan[3].innerHTML="请输入手机号码";
		objS[3].className="warn";
	};
}
	
//失去焦点事件
function loseFocus(objSpan, objS) {
	//用户名失去焦点事件
	usernameLoseFocus(objSpan[0], objS[0]);
	//密码失去焦点事件
	passwordLoseFocus(objSpan[1], objS[1]);
	//邮箱失去焦点事件
	mailLoseFocus(objSpan[2],objS[2]);
	//手机号码失去焦点事件
	phonenumLoseFocus(objSpan[3],objS[3]);
}

//用户名失去焦点事件
function usernameLoseFocus(obj1, obj2) {
	var Username = document.getElementsByClassName("username")[0];
	Username.onblur = function() {
		var flag=/^[a-zA-z]\w{3,15}$/.test(Username.value);
		if(Username.value!=""&&flag) {
				obj1.innerHTML = "";
				obj2.className = "correct";
		}
		else{
			obj1.innerHTML="用户名格式不正确";
			obj2.className="error";
		}
	};
}
//密码失去焦点事件
function passwordLoseFocus(obj1, obj2) {
	var password = document.getElementsByClassName("password")[0];
	password.onblur = function() {
		var flag = password.value.search(/\s/);//是否有空格
		if(password.value!=""&&flag==-1) {
			obj1.innerHTML = "";
			obj2.className = "correct";
		} 
		else {
			obj1.innerHTML = "密码只能为大小写字母和数字";
			obj2.className = "error";
		}
	};
}
//邮箱失去焦点事件
function mailLoseFocus(obj1,obj2){
	var mail=document.getElementsByClassName("mail")[0];
	mail.onblur = function() {
		var flag = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(mail.value);
		if(mail.value!=""&&flag) {
			obj1.innerHTML = "";
			obj2.className = "correct";
		} else {
			obj1.innerHTML = "邮箱格式不正确";
			obj2.className = "error";
		}
	};
}
//手机号码失去焦点事件
function phonenumLoseFocus(obj1,obj2){
	var phonenum=document.getElementsByClassName("phonenum")[0];
	phonenum.onblur=function(){
		var flag = /^1(3|4|5|7|8)\d{9}$/.test(phonenum.value);
		if(phonenum.value!=""&&flag){
			obj1.innerHTML="";
			obj2.className="correct";
		}else{
			obj1.innerHTML="手机号码格式不正确";
			obj2.className="error";
		}
	};
}
