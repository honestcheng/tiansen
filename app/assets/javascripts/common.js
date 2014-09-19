//页面显示预设置

$(document).ready(function() {


	//当存在可溢出层时重新定义这些层的高度

	var getObj = $('div.pdv_class');
	getObj.each(function(id) {
		
		var obj = this.id;
		
		if($("#s"+obj)[0].style.overflow=="visible"){
			
			
			//设置可溢出层的高度
			$("#"+obj)[0].style.height=$("#s"+obj)[0].offsetHeight +"px"; 
			
			var cha=0;
			var L=$("#"+obj)[0].offsetLeft;
			var T=$("#"+obj)[0].offsetTop;
			var R=$("#"+obj)[0].offsetLeft+$("#"+obj)[0].offsetWidth;
			var B=$("#"+obj)[0].offsetTop+$("#"+obj)[0].offsetHeight;
			

			var broObj=$("#"+obj).siblings(".pdv_class");  //找出可溢出层的兄弟元素
			broObj.each(function(id){
				var bro = this.id;
				var broL=$("#"+bro)[0].offsetLeft;
				var broT=$("#"+bro)[0].offsetTop;
				var broH=$("#"+bro)[0].offsetHeight;
				var broR=$("#"+bro)[0].offsetLeft+$("#"+bro)[0].offsetWidth;
				
				
				if(((broL<L && broR>L) || (broL>L && broL<R) || broL==L) && broT>T){
				
					$("#"+bro)[0].style.top= B + cha +10 +"px"; //设置可溢出层的top值
					cha=cha+broH+10;
				
				}
				
			});

		}else{
				
				//设置插件边框层的高度
				
				var borderH=$("#s"+obj)[0].offsetHeight;
				var bbw=$("#s"+obj).find(".pdv_border").css("borderWidth");
				var bbp=$("#s"+obj).find(".pdv_border").css("padding");
				var bbm=$("#s"+obj).find(".pdv_border").css("margin");

				if(bbm=="auto"){bbm=0}

				bbw ? borderH-=parseInt(bbw)*2 : borderH-=0 ;
				bbp ? borderH-=parseInt(bbp)*2 : borderH-=0 ;
				bbm ? borderH-=parseInt(bbm)*2 : borderH-=0 ;

				$("#s"+obj).children(".pdv_border")[0].style.height=borderH +"px";
			
				
		}
	});


	//计算三个容器的高度

	var getObj = $('div.pdv_top');
	var th=0,h=0;
	getObj.each(function(id) {
		var obj = this.id;
		h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
		th = th>h?th:h;
	});
	$("#top")[0].style.height = th + "px";
	

	var getObj = $('div.pdv_content');
	var ch=0,h=0;
	getObj.each(function(id) {
		var obj = this.id;

		h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
		ch = ch>h?ch:h;
	});
	$("#content")[0].style.height = ch + "px";


	var getObj = $('div.pdv_bottom');
	var bh=0,h=0;
	getObj.each(function(id) {
		var obj = this.id;
		h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
		bh = bh>h?bh:h;
	});
	
	$("#bottom")[0].style.height = bh + "px";
	
});

//
(function($){
	$.fn.setBg = function(){
		var getDrag = $('div.pdv_class');
		getDrag.each(function(id) {
			var obj = this.id;

			if($("#s"+obj)[0].style.overflow=="visible"){
				
				//设置可溢出层的高度
				$("#"+obj)[0].style.height=$("#s"+obj)[0].offsetHeight +"px"; 
			
				var cha=0;
				var L=$("#"+obj)[0].offsetLeft;
				var T=$("#"+obj)[0].offsetTop;
				var R=$("#"+obj)[0].offsetLeft+$("#"+obj)[0].offsetWidth;
				var B=$("#"+obj)[0].offsetTop+$("#"+obj)[0].offsetHeight;
				
				var broObj=$("#"+obj).siblings(".pdv_class");  //找出可溢出层的兄弟元素
				broObj.each(function(id){
					var bro = this.id;
					var broL=$("#"+bro)[0].offsetLeft;
					var broT=$("#"+bro)[0].offsetTop;
					var broH=$("#"+bro)[0].offsetHeight;
					var broR=$("#"+bro)[0].offsetLeft+$("#"+bro)[0].offsetWidth;
					
					
					if(((broL<L && broR>L) || (broL>L && broL<R) || broL==L) && broT>T){
					
						$("#"+bro)[0].style.top= B + cha +10 +"px"; //设置可溢出层的top值
						cha=cha+broH+10;
					
					}
					
				});
			}
		});


		//计算三个容器的高度

		var getObj = $('div.pdv_top');
		var th=0,h=0;
		getObj.each(function(id) {
			
			var obj = this.id;
			h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
			th = th>h?th:h;
		});
		$("#top")[0].style.height = th + "px";
		

		var getObj = $('div.pdv_content');
		var ch=0,h=0;
		getObj.each(function(id) {
			var obj = this.id;

			h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
			ch = ch>h?ch:h;
		});
		$("#content")[0].style.height = ch + "px";


		var getObj = $('div.pdv_bottom');
		var bh=0,h=0;
		getObj.each(function(id) {
			var obj = this.id;
			h=$("#"+obj).parents()[0].offsetTop + $("#"+obj).parents()[0].offsetHeight;
			bh = bh>h?bh:h;
		});
		
		$("#bottom")[0].style.height = bh + "px";
		
		

	};
})(jQuery);