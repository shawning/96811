<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>公司简介-上海大众运行物流股份有限公司</title>
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
			<img src="${pageContext.request.contextPath}/img/1.jpg" alt="">
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
			<li><a>关于我们</a></li>
			<li class="active"><a href="javascript:void(0)">公司简介</a></li>
		</ol>
	</div>


	<section style="background:#f3f3f3;" class="middle-content">
		<div class="container text-center">
			<p>上海大众运行物流股份有限公司，成立于1999年，具有国家一级货运经营资质。</p>
			<p>是上海城市配送行业骨干企业、上海市搬场行业“五星级”企业、上海市交通港口行业AAA级诚信企业、</p>
			<p>国家经贸委确定的全国34家重点推荐企业和交通部确定的全国18家快运试点企业。</p>
			<p>2016年上海大众运行物流股份有限公司成为上海市首批无车承运人试点单位，</p>
			<p>并荣获“上海市名牌产品” 称号，通过了ISO9001的质量体系认证。</p>
			<p>2017年，公司再次获批无车承运人资格、通过ISO9001质量体系复审，并通过了安全生产标准化认证。</p>
			<p>公司拥有实力雄厚的车辆资源，各吨位的厢式货运车辆1100辆。</p>
			<p>公司的货运出租汽车服务与市内搬场服务这两大品牌在上海已家喻户晓。</p>
			<p>公司旗下拥有的“96811”调度中心每年为社会各界提供的“即时要车+门到门+搬场到位”服务量已达百万次级别水平，</p>
			<p>同时也是上海市政府在举办国内外各类重大活动中首选的货运配套保障服务商。</p>
			<p>“一切为大众”, 大众物流以客户至上、服务第一的原则严格要求自己，保证高质量、高效率的服务水平以满足各类客户的需求。</p>
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