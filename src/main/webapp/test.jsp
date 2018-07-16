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
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/datetimepicker/build/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<div id="reserve" class="page">
	<section>
		<div class="container">
			<div class="banner">
				<img src="${pageContext.request.contextPath}/img/1.jpg" alt="">
			</div>
			<ol class="breadcrumb">
			  <li><i class="fa fa-truck" aria-hidden="true"></i></li>
			  <li><a href="${pageContext.request.contextPath}">首页</a></li>
			  <li class="active"><a href="javascript:void(0)">在线预约</a></li>
			</ol>
			<div class="reserve middle-content">
				<h3 class="dz-title">在线预约<small>ONLINE RESERVATIONS</small></h3>
				<div class="reserve-content">
					<form role="form">
						<div class="row">
							<div class="col-xs-6">
							  	<div class="form-group">
								    <label>预订时间</label>
								    <input type="text" value="" id="bookDate" class="form-control" id="datetimepicker">
							  	</div>
							</div>	
						</div>	
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
								    <label>姓名</label>
								    <input type="text" class="form-control" placeholder="请输入您的姓名">
							  	</div>
							  	<div class="form-group">
								    <label>搬家地址</label>
								    <input type="text" class="form-control" placeholder="请输入您的目的地">
							  	</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
								    <label>联系方式</label>
								    <input type="tel" class="form-control" placeholder="请输入您的联系方式">
							  	</div>
							  	<div class="form-group">
								    <label>搬家地址</label>
								    <input type="text" class="form-control" placeholder="请输入您的目的地">
							  	</div>
							</div>
						</div>
						<div class="form-group">
						    <label>搬运物品</label>
						    <textarea class="form-control" rows="5"></textarea>
					  	</div>
					  	<button type="submit" class="btn btn-warning">提交</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script type="text/javascript">
/* function getNews(){
	$.ajax({
	    url:'',
	    type:'post', //GET
	    async:true,    //或false,是否异步
	    timeout:5000,    //超时时间
	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
	    success:function(data,textStatus,jqXHR){
	    	if(data!=null){
	    		var obj = data.rows;
	    		var html = '';
	    		for(var i=0;i<obj.length;i++){
	    			html+='<li>'
	    			+'<a href="${pageContext.request.contextPath}/news/newsDetail?id='+obj[i].id+'">' 
	    			+'<span>'+formattime(obj[i].createDate)+'</span>'
	    			+'<p>'+obj[i].title+'</p>'
	    			+'</a>'
	    			+'</li>';
	    		}
	    		$("#news").empty().append(html);
	    	}
	    },
	    error:function(xhr,textStatus){
	    },
	})
} */
$.datetimepicker.setLocale('ch');
$('#bookDate').datetimepicker({
	dayOfWeekStart : 1,
	step : 10
});
</script>