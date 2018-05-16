window.onload = function (){
	//点击某个对象 将一组属性添加上去
	var aLi = document.getElementsByClassName("tab_sep");
	var i = 0;
	for (i = 0; i < 2; i++){
		aLi[i].onclick = function (){
			for (i = 0; i < aLi.length; i++)  aLi[i].className = aLi[i].className.replace(/\s?on/,"");
			this.className += " on";
		};
	}
	
	//上传文件
	//点击A 相当于点击B
	tidobj=document.getElementById('tid');
		upobj=document.getElementById('up');
		upobj.onclick=function(){
			tidobj.click();
		}
	
};
