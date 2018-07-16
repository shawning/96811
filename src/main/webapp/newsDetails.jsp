<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>首页-上海大众运行物流股份有限公司</title>
<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/no-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/* 
	$(document).ready(function() {
		$(".top").load("header.html");
		$(".footer").load("footer.html");
	}); */
</script>
<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	<div id="home">
		<div class="top">
		<%@include file="header.html"%>
		</div>
<div id="pressReleases" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/shineibanchang/1060x400/snbc-banner-2.jpg" alt="">
			<div class="pa car-code-right">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="index.html">首页</a></li>
			<li>关于我们</li>
			<li class="active"><a href="${pageContext.request.contextPath}/in/pressReleases">新闻公告</a></li>
		</ol>
	</div>

	<section class="middle-content news-details">
		<div class="container text-center">
			<h3 class="de-title"><span id="title"></span>
			<small>发布日期:<span id="createDate"></span></small>
			</h3>	
			<div class="text-left" id="body">
				<!-- <p class="text-center"><img src="img/1.jpg" alt="" width="50%"></p> -->
			</div>
			<p class="text-center">
			<%-- <img src="${pageContext.request.contextPath}/img/1.jpg" alt="" width="50%"> --%>
			</p>
		</div>
	</section>
</div>
</div>
<footer>
		<%@include file="footer.html"%>
</footer>

<script type="text/javascript">
	function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]); return null;
	} 
	$(function(){
		getNewDetail();
	});
	/**
		新闻详细
	**/
	function getNewDetail(){
		var params = "{\"id\":"+getQueryString("id")+"}";
		$.ajax({
		    url:'${pageContext.request.contextPath}/news/newsDetail',
		    type:'post', //GET
		    async:true,    //或false,是否异步
		    data: params,
	        contentType : 'application/json',
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	if(data!=null){
		    		var obj = data.data;
		    		$("#title").html(obj.title);
		    		$("#createDate").html(formattime(obj.createDate));
		    		$("#body").html(obj.body);
		    		
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
			var html = y + "-";
			if (M < 10) {
				html += "0";
			}
			html += M + "-";

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
</body>
</html>