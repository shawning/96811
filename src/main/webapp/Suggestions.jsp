<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>常见问题-上海大众运行物流股份有限公司</title>
<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
<script type="text/javascript">
	function add() {
		var param = new Object();
		var phone = $("#phone").val();
		var description = $("#description").val();
		if (phone != null && phone != "") {
			param.phone = phone;
		} else {
			alert("请输入联系电话");
			return;
		}
		param.description = description;
		var params = JSON.stringify(param);
		$.ajax({
			url : '${pageContext.request.contextPath}/suggestion/add',
			type : 'post', //GET
			data : params,
			async : true, //或false,是否异步
			timeout : 5000, //超时时间
			contentType : 'application/json',
			dataType : 'json', //返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data, textStatus, jqXHR) {
				if (data != null) {
					alert(data.msg);
				}
				if(data.code==200){
					$("#phone").val("");
					$("#description").val("");
				}
			},
			error : function(xhr, textStatus) {
			},
		})
	}
</script>
</head>
<body>
	<div class="top">
		<%@include file="header.html"%>
	</div>

	<div id="reserve" class="page">
		<div class="container">
			<div class="banner pr">
				<img
					src="${pageContext.request.contextPath}/img/kefu/1060x400/kefu-banner-6.jpg"
					alt="">
				<div class="pa car-code-left">
					<img src="${pageContext.request.contextPath}/img/wx-code.jpg"
						alt="">
				</div>
			</div>
			<ol class="breadcrumb">
				<li><i class="fa fa-truck" aria-hidden="true"></i></li>
				<li><a href="${pageContext.request.contextPath}/">首页</a></li>
				<li>关于我们</li>
				<li class="active"><a href="javascript:void(0)">投诉建议</a></li>
			</ol>
			<div class="reserve middle-content">
				<h3 class="dz-title">
					投诉建议<small>SUGGESTIONS</small>
				</h3>
				<p class="bg-warning">您好，请留下您的联系方式和反馈信息！</p>
				<div class="reserve-content">
					<form role="form">
								<div class="form-group" style="color: red;font-size: 16px">
									<label>投诉热线：96811</label>
									<label style="padding-left:20pt">行业投诉热线：12319</label>
								</div>
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label>联系方式</label> <input type="text" value=""
										class="form-control" placeholder="请输入您的联系方式" id="phone">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>反馈建议</label>
							<textarea class="form-control" rows="5" placeholder="请输入" id="description"></textarea>
						</div>
						<button type="button" onclick="add()" class="btn btn-warning">提交</button>
					</form>
				</div>
			</div>
		</div>

		<%@include file="onfooter.jsp"%>
		<script src="${pageContext.request.contextPath}/js/json.js"></script>
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