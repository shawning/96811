<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>市内配送-上海大众运行物流股份有限公司</title>
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>


<div id="distributionCity" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/shineipeisong/1060x400/snps-banner.jpg" alt="">
			<div class="pa car-code-right">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li><a>配送服务</a></li>
			<li class="active"><a href="javascript:void(0)">市内配送</a></li>
		</ol>
	</div>

	<section class="middle-content">
		<div class="container">
			<div class="row text-center tc-icon">
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snpsico1.png" alt=""></div>
					<h4>配套定制</h4>
				</div>
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snpsico2.png" alt=""></div>
					<h4>丰富经验</h4>
				</div>
				<div class="col-xs-4">
					<div class="tc-img"><img src="${pageContext.request.contextPath}/img/snpsico3.png" alt=""></div>
					<h4>质量保证</h4>
				</div>
			</div>
			<div class="dist-banner">
				<img src="${pageContext.request.contextPath}/img/shineipeisong/1060x150(center)/1.jpg" alt="">	
			</div>
		</div>
	</section>

	<section style="background:#f3f3f3;" class="middle-content">
		<div class="container text-center">
			<div class="dist-text" style="font-size: 24px;">
				<p>大型活动配送配套的运输服务经验</p>
				<p>B2B、B2C配送以及020线下短驳服务</p>
			</div>
		</div>
	</section>

	<section class="middle-content">
		<div class="container">
			<h3 class="dz-title">合作伙伴<small>PARTNER</small></h3>
			<div class="partner">
				<ul>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/yiguo.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/md.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/leiyunshang.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/shunfeng.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/suning.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/f1.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/cj.png" alt=""></a></li>
					<li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/img/link/cainiao.png" alt=""></a></li>
				</ul>
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