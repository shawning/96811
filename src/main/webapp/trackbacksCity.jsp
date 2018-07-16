<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>市内搬场-上海大众运行物流股份有限公司</title>
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>

<div id="trackbacksCity" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/shineibanchang/1060x400/snbc-banner.jpg" alt="">
			<div class="pa car-code-right">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
			<div class="pa banner-btn">
				<button type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/order/toOrder'" class="btn btn-warning">预约用车</button>
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li><a>搬场服务</a></li>
			<li class="active"><a href="javascript:void(0)">市内搬场</a></li>
		</ol>
	</div>

	<section class="middle-content">
		<div class="container">
			<div class="row text-center tc-icon">
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snbcico1.png" alt=""></div>
					<h4>专业服务</h4>
				</div>
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snbcico2.png" alt=""></div>
					<h4>安全快速</h4>
				</div>
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snbcico3.png" alt=""></div>
					<h4>安心保障</h4>
				</div>
			</div>
		</div>
	</section>

	<section style="background:#f3f3f3;" class="middle-content">
		<div class="container text-center">
			<strong>
				<p>上海市搬场行业五星企业</p>
				<p>上海市政府指定机要用车单位</p>
				<p>上海市政府外事办唯一指定涉外用车</p>
			</strong>
		</div>
	</section>

	<section class="middle-content">
		<div class="container text-center">
			<h3 class="dz-title">服务范围<small>SERVICE AREA</small></h3>
			<div class="row service-area">
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-1.jpg" alt=""></a></div>
					<h4>小件搬运</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-2.jpg" alt=""></a></div>
					<h4>家庭搬场</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-3.jpg" alt=""></a></div>
					<h4>企业搬迁</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-4.jpg" alt=""></a></div>
					<h4>工厂搬迁</h4>
				</div>
			</div>
		</div>
	</section>

	<section style="background:#f3f3f3;" class="middle-content">
		<div class="container text-center">
			<h3 class="dz-title">服务流程<small>SERVICE PROCESS</small></h3>
			<div class="row service-area">
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-5.jpg" alt=""></a></div>
					<h4>电话预约</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-6.jpg" alt=""></a></div>
					<h4>拆装防护</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-7.jpg" alt=""></a></div>
					<h4>贴心运输</h4>
				</div>
				<div class="col-xs-6">
					<div class="area-img"><a href="#?"><img src="${pageContext.request.contextPath}/img/shineibanchang/1024x631(info)/snbc-pic-8.jpg" alt=""></a></div>
					<h4>便捷付款</h4>
				</div>
			</div>
		</div>
	</section>

	<section class="news middle-content">
		<div class="container text-center ">
			<h2>服务用心,行动至诚</h2>	
			<a href="${pageContext.request.contextPath}/order/toOrder"><button type="button" class="btn btn-primary">预约用车</button></a>
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