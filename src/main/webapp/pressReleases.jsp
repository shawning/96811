<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<title>新闻公告-上海大众运行物流股份有限公司</title>
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
	$(function(){
		getNews();
    });
	
	/**
		新闻中心
	**/
	function getNews(){
		$.ajax({
		    url:'${pageContext.request.contextPath}/news/search',
		    type:'get', //GET
		    async:true,    //或false,是否异步
		    data:{
		        page:1,rows:100
		    },
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	if(data!=null){
		    		var obj = data.rows;
		    		var html = '';
		    		for(var i=0;i<obj.length;i++){
		    			//
		    			html+='<div class="col-xs-4" style="height:170px">'
						+'<a href="${pageContext.request.contextPath}/news/newsDetail?id='+obj[i].id+'"">'
						/* +'<div class="area-img"><img src="${pageContext.request.contextPath}/img/huoyun/1024x1024(yuan)/hycz-circle-5.jpg" alt=""></div>' */
						+'<h4 class="text-overflow">'+obj[i].title+'</h4>'
						+'<p>'+obj[i].body.substring(0,70)+'</p>'
						+'</a>'
						+'<span>'+formattime(obj[i].createDate)+'</span>'
						+'</div>';
		    			//
		    		}
		    		$("#news").empty().append(html);
		    	}
		    },
		    error:function(xhr,textStatus){
		    },
		})
	}
	function formattime(date) {
		if (date != null) {
			if (date == null) {
				return "";
			}
			date = new Date(date);
			var y = date.getFullYear();
			var M = date.getMonth() + 1;
			var d = date.getDate();
			var h = date.getHours();
			var m = date.getMinutes();
			var s = date.getSeconds();
			var html = y + "/";
			if (M < 10) {
				html += "0";
			}
			html += M + "/";

			if (d < 10) {
				html += "0";
			}
			html += d + " ";
			return html;
		}else {
			return "";
		}
	}
</script>
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>
<div id="pressReleases" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/kefu/1060x400/kefu-banner-4.jpg" alt="">
			<div class="pa car-code-right">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li>关于我们</li>
			<li class="active"><a href="javascript:void(0)">新闻公告</a></li>
		</ol>
	</div>

	<section class="middle-content">
		<div class="container text-center">
			<div class="row case text-left" id="news">
				<%-- <div class="col-xs-4">
					<a href="newsDetails.html"><div class="area-img"><img src="${pageContext.request.contextPath}/img/1.jpg" alt=""></div>
					<h4 class="text-overflow">新闻标题</h4>
					<p>大众运行物流股份有限公司成立于1999年上海市首批无车承运人试点单位ISO9001质量管理体系认证通过拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p>
					</a>
					<span>2016/12/12</span>
				</div>
				<div class="col-xs-4">
					<a href="#?"><div class="area-img"><img src="${pageContext.request.contextPath}/img/1.jpg" alt=""></div>
					<h4 class="text-overflow">新闻标题</h4>
					<p>大众运行物流股份有限公司成立于1999年上海市首批无车承运人试点单位ISO9001质量管理体系认证通过拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p></a>
					<span>2016/12/12</span>
				</div>
				<div class="col-xs-4">
					<a href="#?"><div class="area-img"><img src="${pageContext.request.contextPath}/img/1.jpg" alt=""></div>
					<h4 class="text-overflow">新闻标题</h4>
					<p>大众运行物流股份有限公司成立于1999年上海市首批无车承运人试点单位ISO9001质量管理体系认证通过拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p></a>
					<span>2016/12/12</span>
				</div>
				<div class="col-xs-4">
					<a href="#?"><div class="area-img"><img src="${pageContext.request.contextPath}/img/1.jpg" alt=""></div>
					<h4 class="text-overflow">新闻标题</h4>
					<p>大众运行物流股份有限公司成立于1999年上海市首批无车承运人试点单位ISO9001质量管理体系认证通过拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p></a>
					<span>2016/12/12</span>
				</div>
				<div class="col-xs-4">
					<a href="#?"><div class="area-img"><img src="${pageContext.request.contextPath}/img/1.jpg" alt=""></div>
					<h4 class="text-overflow">新闻标题</h4>
					<p>大众运行物流股份有限公司成立于1999年上海市首批无车承运人试点单位ISO9001质量管理体系认证通过拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p></a>
					<span>2016/12/12</span>
				</div> --%>
			</div>
		</div>
	</section>

</div>

<%@include file="footer.html"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slider.js"></script>
<script type="text/javascript">
	$(function(){
        $('li.dropdown').mouseover(function() {   
     		$(this).addClass('open');    
     	}).mouseout(function() {
     		$(this).removeClass('open');    
     	}); 
    });
</script>
</body>
</html>