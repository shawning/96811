<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>货运出租-上海大众运行物流股份有限公司</title>
	<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
	<!--[if lt IE 9]>
	<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="top">
	<%@include file="header.html"%>
</div>

<div id="cargoRental" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/huoyun/1060x250(banner)/hycz-banner-6.jpg" alt="">
			<div class="pa car-code-left">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}">首页</a></li>
			<li class="active"><a href="javascript:void(0)">货运出租</a></li>
		</ol>
	</div>

	<section>
		<div class="container">
			<div class="row car-icon">
				<div class="col-xs-6 text-right">
					<div class="media">
						<div class="media-body">
							<h4 class="media-heading">安全</h4>
							<p>严格监督</p>
						</div>
						<div class="media-right">
							<div class="car-ico text-center">
								<img src="${pageContext.request.contextPath}/img/hyico1.png">
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="media">
						<div class="media-left">
							<div class="car-ico text-center">
								<img src="${pageContext.request.contextPath}/img/hyico2.png">
							</div>
						</div>
						<div class="media-body">
							<h4 class="media-heading">快速</h4>
							<p>APP、微信、电话多种方式一键叫车<br/>司机遍布上海各区县</p>
						</div>
					</div>
				</div>
				<div class="col-xs-6 text-right">
					<div class="media">
						<div class="media-body">
							<h4 class="media-heading">专业</h4>
							<p>国内领先货的平台</p>
						</div>
						<div class="media-right">
							<div class="car-ico text-center">
								<img src="${pageContext.request.contextPath}/img/hyico3.png">
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="media">
						<div class="media-left">
							<div class="car-ico text-center">
								<img src="${pageContext.request.contextPath}/img/hyico4.png">
							</div>
						</div>
						<div class="media-body">
							<h4 class="media-heading">省钱</h4>
							<p>标准计价<br/>告别乱计费</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section style="background:#f3f3f3;" class="middle-content">
		<div class="container">
			<div class="liuc">
				<!-- <h3 class="dz-title">大众物流使用步骤<small>DAZHONG STEPS FOR USAGE</small></h3> -->
				<div class="liuc-slider">
					<div class="liuc-line">
						<ul>
							<li class="thumb active" id="btn-img0"><span class="l1"></span>注册</li>
							<li class="thumb" id="btn-img1"><span class="l2"></span>下单</li>
							<li class="thumb" id="btn-img2"><span class="l3"></span>支付</li>
							<li class="thumb" id="btn-img3"><span class="l4"></span>评价</li>
						</ul>
					</div>
					<div class="liuc-content">
						<div class="content">
							<div class="imgbox">
								<img alt="Danx" src="${pageContext.request.contextPath}/img/danx1.jpg" width="230" height="407" />
								<img alt="Danx" src="${pageContext.request.contextPath}/img/danx2.jpg" width="230" height="407" />
								<img alt="Danx" src="${pageContext.request.contextPath}/img/danx3.jpg" width="230" height="407" />
								<img alt="Danx" src="${pageContext.request.contextPath}/img/danx4.jpg" width="230" height="407" />
							</div>
						</div>

						<div class="png"></div>

						<a id="hi-btn0" class="hi_btn"></a>
						<a id="hi-btn1" class="hi_btn"></a>
						<a id="hi-btn2" class="hi_btn"></a>
						<a id="hi-btn3" class="hi_btn"></a>

						<div class="prev"></div>
						<div class="next"></div>

						<div class="slider-p">

							<div id="slider-p0" class="slider-p-div"><img src="${pageContext.request.contextPath}/img/word-6.png" alt=""></div>

							<div id="slider-p1" class="slider-p-div"><img src="${pageContext.request.contextPath}/img/word-7.png" alt=""></div>

							<div id="slider-p2" class="slider-p-div"><img src="${pageContext.request.contextPath}/img/word-8.png" alt=""></div>

							<div id="slider-p3" class="slider-p-div"><img src="${pageContext.request.contextPath}/img/word-9.png" alt=""></div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="middle-content">
		<div class="container">
			<h3 class="dz-title">计费标准<small>CHARGING STANDARD</small></h3>
			<div class="row text-center cost">
				<button type="button" onclick="changeType('hycz','hyczwyc')" id="hyczBtn" class="btn btn-warning">货运出租</button>
				<button type="button" onclick="changeType('hyczwyc','hycz')" id="hyczwycBtn" class="btn btn-default">货运出租网约车</button>
			</div>

			<div class="row text-center cost" id="hycz" >
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-5.png" alt="">
						<p>0.6T长安</p>
					</div>
					<div class="cost-price">
						￥40（5公里）
					</div>
					<div class="cost-text">
						运价：3.5元/公里<br/>
						尺寸：3000*1600*1200
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-3.png" alt="">
						<p>0.9T</p>
					</div>
					<div class="cost-price">
						￥50（5公里）
					</div>
					<div class="cost-text">
						运价：4.0元/公里<br/>
						尺寸：3060*1760*1730
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-1.png" alt="">
						<p>依维柯</p>
					</div>
					<div class="cost-price">
						￥50（5公里）
					</div>
					<div class="cost-text">
						运价：5.0元/公里<br/>
						尺寸：2450*1770*1710
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-4.png" alt="">
						<p>1.75T</p>
					</div>
					<div class="cost-price">
						￥60（5公里）
					</div>
					<div class="cost-text">
						运价：4.5元/公里<br/>
						尺寸：4210*1760*1730
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-4.png" alt="">
						<p>1.75T(尾板)</p>
					</div>
					<div class="cost-price">
						￥160（5公里）
					</div>
					<div class="cost-text">
						运价：4.5元/公里<br/>
						尺寸：4210*1760*1730
					</div>
				</div>
				<div class="col-xs-3" style="width:98%;height:112px">
					<div class="cost-icon">
						等候时间：每5分钟折1公里计费；<br/>
						装卸搬运费：托运前由客户与承运方协商支付；<br/>
						放空费：由于客户的原因不能履约的，客户应当支付起步费；<br/>
						其他费用：运输过程中产生的路桥（境）费、高速费、停车费等费用，由客户自理，承运方代收代付。
					</div>
				</div>

			</div>
			<div class="row text-center cost" id="hyczwyc" style="display:none">
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-5.png" alt="">
						<p>0.6T长安</p>
					</div>
					<div class="cost-price">
						￥68（5公里）
					</div>
					<div class="cost-text">
						运价：3.5元/公里<br/>
						尺寸：3000*1600*1200<br/>
						免费等候时间：40分钟
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-3.png" alt="">
						<p>0.9T</p>
					</div>
					<div class="cost-price">
						￥78（5公里）
					</div>
					<div class="cost-text">
						运价：4.0元/公里<br/>
						尺寸：3060*1760*1730<br/>
						免费等候时间：50分钟
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-1.png" alt="">
						<p>依维柯</p>
					</div>
					<div class="cost-price">
						￥78（5公里）
					</div>
					<div class="cost-text">
						运价：4.0元/公里<br/>
						尺寸：2450*1770*1710<br/>
						免费等候时间：50分钟
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-4.png" alt="">
						<p>1.75T</p>
					</div>
					<div class="cost-price">
						￥98（5公里）
					</div>
					<div class="cost-text">
						运价：4.5元/公里<br/>
						尺寸：4210*1760*1730<br/>
						免费等候时间：60分钟
					</div>
				</div>
				<div class="col-xs-3">
					<div class="cost-icon">
						<img src="${pageContext.request.contextPath}/img/cost-icon-4.png" alt="">
						<p>1.75T(尾板)</p>
					</div>
					<div class="cost-price">
						￥198（5公里）
					</div>
					<div class="cost-text">
						运价：4.5元/公里<br/>
						尺寸：4210*1760*1730<br/>
						免费等候时间：60分钟
					</div>
				</div>
				<div class="col-xs-3" style="width:98%;height:112px">
					<div class="cost-icon">
						等候费：超过免费等候时间后，每五分钟折一公里计费；<br/>
						装卸搬运费：运输前由客户与承运方协商支付；<br/>
						放空费：由于客户的原因不能履约的，客户应当支付50%的起步费；<br/>
						其他费用：运输过程中产生的路桥（境）费、高速费、停车费等费用，由客户自理，承运方代收代付。
					</div>
					<!-- <div class="cost-price">

                    </div>
                    <div class="cost-text">
                    </div> -->
				</div>
			</div>
	</section>

</div>

<%@include file="onfooter.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slider.js"></script>
<script type="text/javascript">
    $(function(){
        $('li.dropdown').mouseover(function() {
            $(this).addClass('open');
        }).mouseout(function() {
            $(this).removeClass('open');
        });
    });
    function changeType(showId,hideId) {
        $("#"+showId).show();
        $("#"+hideId).hide();
        $("#"+showId+"Btn").removeClass("btn-default").addClass("btn-warning");
        $("#"+hideId+"Btn").removeClass("btn-warning").addClass("btn-default");
    }
</script>
</body>
</html>