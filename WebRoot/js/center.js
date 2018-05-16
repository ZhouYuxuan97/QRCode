$('button').click(function(){
	$(this).addClass('active');
	$('button').not($(this)).removeClass('active');

	idx=$(this).index('button');
	$('.navs').eq(idx).stop().show(1000);
	$('.navs').not($('.navs').eq(idx)).stop().hide(100);
});
$('.navs').eq(0).show(10);
