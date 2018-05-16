window.onload=function(){
	$('#mymodal').modal('show');
	
	sidobj=document.getElementById('sid');
	s=5;
	sobj=setInterval(function(){
		sidobj.innerHTML=--s;
		if(s==0){
			location='http://www.baidu.com';
		}
	},1000);
};
$('#mymodal').on('shown.bs.modal', function (e) {
	$('body').css({'background':'#999999'});
})

$('#mymodal').on('hidden.bs.modal', function (e) {
	$('body').css({'background':'white'});
})
