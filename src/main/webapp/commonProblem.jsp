<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<title>常见问题-上海大众运行物流股份有限公司</title>
	<link href="favicon.ico" rel="shortcut icon">
	<!--[if lt IE 9]>
		<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
	$(function(){
		getQuestions();
    });
	
	/**
		
	**/
	function getQuestions(){
		$.ajax({
		    url:'${pageContext.request.contextPath}/question/search',
		    type:'get', //GET
		    async:true,    //或false,是否异步
		    data:{
		        page:1,rows:100
		    },
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	if(data!=null){
		    		var obj = data.rows;
		    		
		    		var sijiHtml = '';
		    		var huozhuHtml = '';
		    		for(var i=0;i<obj.length;i++){
		    			//
		    			var html = '';
		    			if(i==0){
		    				html+='<div class="panel panel-default">'
								+'<div class="panel-heading" role="tab" id="heading'+i+'">'
								+'<h4 class="panel-title">'
								+'<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'" aria-expanded="true" aria-controls="collapse'+i+'">'+obj[i].question+'</a>'
								+'</h4>'
								+'</div>'
								+'<div id="collapse'+i+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading'+i+'">'
								+'<div class="panel-body">'+obj[i].answer+'</div>'
								+'</div>'
								+'</div>';
		    			}else{
			    			html+='<div class="panel panel-default">'
								+'<div class="panel-heading" role="tab" id="heading'+i+'">'
								+'<h4 class="panel-title">'
								+'<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'" aria-expanded="false" aria-controls="collapse'+i+'">'+obj[i].question+'</a>'
								+'</h4>'
								+'</div>'
								+'<div id="collapse'+i+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading'+i+'">'
								+'<div class="panel-body">'+obj[i].answer+'</div>'
								+'</div>'
								+'</div>';
		    			}
		    			if(obj[i].type ==0){
		    				sijiHtml+=html; 
		    			}else{
		    				huozhuHtml+=html;
		    			}
		    		}
		    		$("#questions").empty().append(sijiHtml);
		    		$("#huozhuquestions").empty().append(huozhuHtml);
		    	}
		    },
		    error:function(xhr,textStatus){
		    },
		})
	}
</script>
</head>
<body>
<div class="top">
		<%@include file="header.html"%>
</div>

<div id="commonProblem" class="page">
	<div class="container">
		<div class="banner pr">
			<img src="${pageContext.request.contextPath}/img/kefu/1060x400/kefu-banner-3.jpg" alt="">
			<div class="pa car-code-left">
				<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">	
			</div>
		</div>
		<ol class="breadcrumb">
			<li><i class="fa fa-truck" aria-hidden="true"></i></li>
			<li><a href="${pageContext.request.contextPath}/">首页</a></li>
			<li>关于我们</li>
			<li class="active"><a href="javascript:void(0)">常见问题</a></li>
		</ol>
	</div>

	<section class="middle-content">
		<div class="container">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#driver-tab" role="tab" data-toggle="tab">司机版</a></li>
				<li role="presentation"><a href="#passenger-tab" role="tab" data-toggle="tab">乘客版</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="driver-tab">
					<div class="panel-group" role="tablist" aria-multiselectable="true" id="questions">
						<!-- <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">货拉拉提供什么服务？</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">货拉拉是一个同城搬家拉货服务的司机配对平台，为您找面包车和货车司机，提供点到点的载运服务，只要您输入运载路线，货拉拉会即时发送给平台上所有的专业司机，成功抢单的司机，会马上联络您，前来为您服务。</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="heading2">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapse2">货拉拉提供什么服务？</a>
								</h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
								<div class="panel-body">货拉拉是一个同城搬家拉货服务的司机配对平台，为您找面包车和货车司机，提供点到点的载运服务，只要您输入运载路线，货拉拉会即时发送给平台上所有的专业司机，成功抢单的司机，会马上联络您，前来为您服务。</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">货拉拉提供什么服务？</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">货拉拉是一个同城搬家拉货服务的司机配对平台，为您找面包车和货车司机，提供点到点的载运服务，只要您输入运载路线，货拉拉会即时发送给平台上所有的专业司机，成功抢单的司机，会马上联络您，前来为您服务。</div>
							</div>
						</div> -->
					</div>	
				</div>
				<div role="tabpanel" class="tab-pane" id="passenger-tab">
					<div class="panel-group" role="tablist" aria-multiselectable="false" id="huozhuquestions">
					</div>
				</div>
			</div>	
		</div>
	</section>
<%@include file="onfooter.jsp"%>
<script type="text/javascript">
	$(function(){
        $('li.dropdown').mouseover(function() {   
     		$(this).addClass('open');    
     	}).mouseout(function() {
     		$(this).removeClass('open');    
     	}); 
     	var $li=$('#tab li');
     	var $ul=$('#tab-content div');

     	$li.click(function(){
     		var $this= $(this);
     		var $t=$this.index();
     		$li.removeClass();
			$this.addClass('active');
			$ul.css('display','none');
			$ul.eq($t).css('display','block');
     	});
    });
</script>
</body>
</html>