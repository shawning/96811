<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%-- <meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/no-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

 --%>
	<section class="news">
			<div class="container">
				<div class="middle-content">
					<div class="row">
						<div class="col-xs-4">
							<h5>
								<i class="fa fa-bell-o"></i>新闻中心
							</h5>
							<ul id="news">
							</ul>
						</div>
						<div class="col-xs-4 text-center">
							<h5 style="text-align: left; padding-left: 32px;">
								<i class="fa fa-comments-o"></i>在线预约
							</h5>
							<div class="dz-code">
								<span> <img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">
									<p>扫一扫 关注微信</p>
								</span> <span> <img src="${pageContext.request.contextPath}/img/app-code.jpg" alt="">
									<p>扫码下载APP</p>
								</span>
							</div>
							<!-- <ul>
							<li><a href="#?"><h5>货运出租</h5></a></li>
							<li><a href="#?"><h5>马上叫车</h5></a></li>
							<li><a href="#?"><h5>搬家搬场</h5></a></li>
							<li><a href="#?"><h5>在线预约</h5></a></li>
						</ul> -->
						</div>
						<div class="col-xs-4 link">
							<h5>
								<i class="fa fa-handshake-o"></i>友情链接
							</h5>
							<ul>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link1.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link2.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link3.jpg" alt=""></a></li>
								<%-- <li><a href="#?"><img src="${pageContext.request.contextPath}/img/link1.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link1.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link2.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link3.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link1.jpg" alt=""></a></li>
								<li><a href="#?"><img src="${pageContext.request.contextPath}/img/link2.jpg" alt=""></a></li> --%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	<footer>
			<%@include file="footer.html"%>
	</footer>
<script type="text/javascript">
	$(function(){
		getNews();
    });
	function getBanners(){
		$.ajax({
		    url:'${pageContext.request.contextPath}/news/search',
		    type:'get', //GET
		    async:true,    //或false,是否异步
		    data:{
		        page:1,rows:10
		    },
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	if(data!=null){
		    		var obj = data.rows;
		    		var html = '';
		    		for(var i=0;i<obj.length;i++){
		    			if(i==0){
		    				html+='<div class="item active">'
								+'<a href="#?"><img src="img/1.jpg" alt=""></a>'
								+'</div>';
		    			}else{
		    			html+='<div class="item">'
						+'<a href="#?"><img src="img/1.jpg" alt=""></a>'
						+'</div>';
		    			}
		    		}
		    		$("#banners").empty().append(html);
		    	}
		    },
		    error:function(xhr,textStatus){
		    },
		})
	}
	/**
		新闻中心
	**/
	function getNews(){
		$.ajax({
		    url:'${pageContext.request.contextPath}/news/search',
		    type:'get', //GET
		    async:true,    //或false,是否异步
		    data:{
		        page:1,rows:3
		    },
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
		    			+'<p style="width: 240px;">'+obj[i].title+'</p>'
		    			+'</a>'
		    			+'</li>';
		    		}
		    		$("#news").empty().append(html);
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
			var html = y + "/";
			if (M < 10) {
				html += "0";
			}
			html += M + "/";

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