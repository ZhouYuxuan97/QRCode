window.onload = function (){
	//上传文件
	//点击A 相当于点击B
	tidobj=document.getElementById('uploadFile');
		upobj=document.getElementById('up');
		upobj.onclick=function(){
			tidobj.click();
		}

	//动态进度条
	s=0;
	v=10;
	sobj=setInterval(function(){
		s+=v;
		if(s>=100){
			clearInterval(sobj);
		}
		$('.progress-bar').html(s+'%').css({'width':s+'%'});
	},100);

};