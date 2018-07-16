<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>国际搬场-上海大众运行物流股份有限公司</title>
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>

<div id="trackbacksInternational" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/guojibanchang/1060x400/gjbc-banner.jpg" alt="">
			<div class="pa car-code-left">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
			<div class="pa banner-btn">
				<!-- <button type="button" class="btn btn-warning">预约用车</button> -->
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li><a>搬场服务</a></li>
			<li class="active"><a href="javascript:void(0)">国际搬场</a></li>
		</ol>
	</div>
	
	<section class="middle-content">
		<div class="text-center">
			<div class="media dist-dan">
				<div class="container">
					<div class="media-body text-left">
						<div class="media-heading">国际搬家&省际搬迁</div>
						免费上门勘验 量身定制计划<br/>
						专业拆装团队 货物全程跟踪
					</div>
					<div class="media-right"><img src="${pageContext.request.contextPath}/img/gjbcimg1.png" alt=""></div>
				</div>
			</div>
			<div class="lr-bg">
				<div class="media dist-dan">
					<div class="container">
						<div class="media-left"><img src="${pageContext.request.contextPath}/img/gjbcimg2.png" alt=""></div>
						<div class="media-body text-right">
							<div class="media-heading">企业大型搬迁</div>
							实地勘察项目 定制高效方案<br/>
							专业拆装团队 专用车辆运输
						</div>
					</div>
				</div>
			</div>
			<div class="media dist-dan">
				<div class="container">
					<div class="media-body text-left">
						<div class="media-heading">珍品运输</div>
						按需定制装箱方案 专车专人押运<br/>
						随时查看物品定位<br/>
						按需控制环境温、湿度<br/>
						全程负责审批报关 		
					</div>
					<div class="media-right"><img src="${pageContext.request.contextPath}/img/gjbcimg3.png" alt=""></div>
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