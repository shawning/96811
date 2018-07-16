<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>联系我们-上海大众运行物流股份有限公司</title>
<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>
<body>
	<div class="top">
		<%@include file="header.html"%>
	</div>

	<div id="contactUs" class="page">
		<div class="container">
			<div class="banner pr">
				<img
					src="${pageContext.request.contextPath}/img/kefu/1060x400/kefu-banner-1.jpg"
					alt="">
				<div class="pa car-code-right">
					<img src="${pageContext.request.contextPath}/img/wx-code.jpg"
						alt="">
				</div>
			</div>
			<ol class="breadcrumb">
				<li><i class="fa fa-truck" aria-hidden="true"></i></li>
				<li><a href="${pageContext.request.contextPath}/">首页</a></li>
				<li>关于我们</li>
				<li class="active"><a href="javascript:void(0)">联系我们</a></li>
			</ol>
		</div>

		<section class="middle-content">
		<div class="container">
			<div class="row">
				<div class="col-xs-9">
					<h4>联系方式</h4>
					<!-- <ul class="contact-list">
						<li>叫车电话：96811 </li>
						<li>投诉电话：021-62580780</li>
						<li>公司电话：021-31033333 </li>
						<li>官方网站：<a href="http://www.96811.com">www.96811.com</a></li>
						<li>官方微信：dzwl_96811</li>
						<li>官方新浪微博：<a href="http://weibo.com/dzwl96811">http://weibo.com/dzwl96811</a></li>
						<li>公司地址：上海市嘉定区曹安公路2020号</li>
					</ul> -->
					<div class="cu-ic">
						<h5>商务合作</h5>
						<p>
							邮箱：<a href="mailto:dzyx@96811.com">dzyx@96811.com</a>
						</p>
					</div>

					<div class="cu-ic" style="padding-left: 100px;">
						<h5>市场合作</h5>
						<p>
							邮箱：<a href="mailto:dzyx@96811.com">dzyx@96811.com</a>
						</p>
					</div>
					<br>
					<!-- <div class="cu-ic">
						<h5>大众搬场加盟合作</h5>
						<p>
							邮箱：<a href="mailto:dzyx@96811.com">dzyx@96811.com</a>
						</p>
					</div> -->
					<div class="cu-ic"><!--  style="padding-left: 100px;"> -->
						<h5>联系地址</h5>
						<p>
							<a href="javascript:void(0)">曹安公路2020号</a>
						</p>
					</div>
				</div>

				<%@include file="right.jsp"%>
				<div style="padding-left: 15px;">
					<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
					<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
}

.iw_poi_title {
	color: #CC5522;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	padding-right: 13px;
	white-space: nowrap
}

.iw_poi_content {
	font: 12px arial, sans-serif;
	overflow: visible;
	padding-top: 4px;
	white-space: -moz-pre-wrap;
	word-wrap: break-word
}
</style>

</head>

<body>
	<!--百度地图容器-->
	<div style="width: 730px; height: 300px; border: #ccc solid 1px;"
		id="dituContent"></div>
</body>
<script type="text/javascript">
	//创建和初始化地图函数：
	function initMap() {
		createMap();//创建地图
		setMapEvent();//设置地图事件
		addMapControl();//向地图添加控件
		addMarker();//向地图中添加marker
	}

	//创建地图函数：
	function createMap() {
		var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
		var point = new BMap.Point(121.355797, 31.264446);//定义一个中心点坐标
		map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
		window.map = map;//将map变量存储在全局
	}

	//地图事件设置函数：
	function setMapEvent() {
		map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
		map.enableScrollWheelZoom();//启用地图滚轮放大缩小
		map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
		map.enableKeyboard();//启用键盘上下左右键移动地图
	}

	//地图控件添加函数：
	function addMapControl() {
		//向地图中添加缩放控件
		var ctrl_nav = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			type : BMAP_NAVIGATION_CONTROL_LARGE
		});
		map.addControl(ctrl_nav);
		//向地图中添加缩略图控件
		var ctrl_ove = new BMap.OverviewMapControl({
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			isOpen : 1
		});
		map.addControl(ctrl_ove);
		//向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		map.addControl(ctrl_sca);
	}

	//标注点数组
	var markerArr = [ {
		title : "上海大众运行物流股份有限公司",
		content : "",
		point : "121.355932|31.26443",
		isOpen : 0,
		icon : {
			w : 21,
			h : 21,
			l : 0,
			t : 0,
			x : 6,
			lb : 5
		}
	} ];
	//创建marker
	function addMarker() {
		for (var i = 0; i < markerArr.length; i++) {
			var json = markerArr[i];
			var p0 = json.point.split("|")[0];
			var p1 = json.point.split("|")[1];
			var point = new BMap.Point(p0, p1);
			var iconImg = createIcon(json.icon);
			var marker = new BMap.Marker(point, {
				icon : iconImg
			});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title, {
				"offset" : new BMap.Size(json.icon.lb - json.icon.x + 10, -20)
			});
			marker.setLabel(label);
			map.addOverlay(marker);
			label.setStyle({
				borderColor : "#808080",
				color : "#333",
				cursor : "pointer"
			});

			(function() {
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click", function() {
					this.openInfoWindow(_iw);
				});
				_iw.addEventListener("open", function() {
					_marker.getLabel().hide();
				})
				_iw.addEventListener("close", function() {
					_marker.getLabel().show();
				})
				label.addEventListener("click", function() {
					_marker.openInfoWindow(_iw);
				})
				if (!!json.isOpen) {
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
		}
	}
	//创建InfoWindow
	function createInfoWindow(i) {
		var json = markerArr[i];
		var iw = new BMap.InfoWindow(
				"<b class='iw_poi_title' title='" + json.title + "'>"
						+ json.title + "</b><div class='iw_poi_content'>"
						+ json.content + "</div>");
		return iw;
	}
	//创建一个Icon
	function createIcon(json) {
		var icon = new BMap.Icon(
				"http://app.baidu.com/map/images/us_mk_icon.png",
				new BMap.Size(json.w, json.h), {
					imageOffset : new BMap.Size(-json.l, -json.t),
					infoWindowOffset : new BMap.Size(json.lb + 5, 1),
					offset : new BMap.Size(json.x, json.h)
				})
		return icon;
	}

	initMap();//创建和初始化地图
</script>
					</html>
				</div>
				<%-- <div class="col-xs-3 pull-right">
					<div class="page-news">
						<h5><i class="fa fa-bell-o"></i>新闻中心</h5>
						<ul>
							<li>
								<a href="newsDetails.html">
									<span>2016/12/12</span>
									<p>使用CSS3和jQuery制作的水平时间轴使用CSS3和jQuery制作的水平时间轴使用CSS3和jQuery制作的水平时间轴</p>
								</a>
							</li>
							<li>
								<a href="#?">
									<span>2016/12/12</span>
									<p>使用CSS3和jQuery制作的水平时间轴</p>
								</a>
							</li>
							<li>
								<a href="#?">
									<span>2016/12/12</span>
									<p>使用CSS3和jQuery制作的水平时间轴</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="page-yy">
						<h5><i class="fa fa-comments-o"></i>在线预约</h5>
						<div class="dz-code">
							<span>
								<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">
								<p>扫一扫 关注微信</p>
							</span>
							<span>
								<img src="${pageContext.request.contextPath}/img/app-code.jpg" alt="">
								<p>扫码下载APP</p>
							</span>
						</div>
					</div>
				</div> --%>
			</div>
		</div>
		</section>

		<%@include file="footer.html"%>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/slider.js"></script>
		<script type="text/javascript">
			$(function() {
				$('li.dropdown').mouseover(function() {
					$(this).addClass('open');
				}).mouseout(function() {
					$(this).removeClass('open');
				});
			});
		</script>
</body>
</html>