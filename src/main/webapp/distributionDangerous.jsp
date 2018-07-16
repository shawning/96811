<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>危化品配送-上海大众运行物流股份有限公司</title>
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>


<div id="distributionDangerous" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/weixianpin/1060x400/whp-banner-1.jpg" alt="">
			<div class="pa car-code-right">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li><a>配送服务</a></li>
			<li class="active"><a href="javascript:void(0)">危化品配送</a></li>
		</ol>
	</div>

	<section class="middle-content">
		<div class="text-center">
			<div class="media dist-dan">
				<div class="container">
					<div class="media-body text-left">
						<div class="media-heading">液化气定点配送</div>
					</div>
					<div class="media-right"><img src="${pageContext.request.contextPath}/img/whpimg1.png" alt=""></div>
				</div>
			</div>
			<div class="lr-bg">
				<div class="media dist-dan">
					<div class="container">
						<div class="media-left"><img src="${pageContext.request.contextPath}/img/whpimg4.png" alt=""></div>
						<div class="media-body text-right">
							<div class="media-heading">随时定位</div>
							全部车辆均配备GPS定位系统行车记录仪<br/>
							车厢内货物装载情况监控等安全行车设备
						</div>
					</div>
				</div>
			</div>
			<div class="media dist-dan">
				<div class="container">
					<div class="media-body text-left">
						<div class="media-heading">持证上岗</div>
						<p>在岗人员均持证上岗，除必须具备危险品从业资格证书以外，另根据承运危险品的特殊性，相应人员必须取得与承运危险品相匹配的资格证书方可上岗。</p>
					</div>
					<div class="media-right"><img src="${pageContext.request.contextPath}/img/whpimg3.png" alt=""></div>
				</div>
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