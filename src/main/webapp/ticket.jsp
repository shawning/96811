<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
	<link href="${pageContext.request.contextPath}/css/weui-new.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/less/unlock.css">
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script src='${pageContext.request.contextPath}/assets/js/unlock.js'></script>

	<title>提取码开票</title>
	<style>
		.bar {
			margin: 20px;
			height: 40px;
			width: 300px;
		}
	</style>
	<script type="text/javascript">
        function doTicket(){
            var ticketCode = $("#ticketCode").val();
            if(ticketCode==''){
                sweetAlert("请输入发票提取码","","error");
                return;
            }
            if(!isSlide){
                sweetAlert("请滑动验证","","error");
                return;
            }
            var param = new Object();
            param.sno = ticketCode;
            var params = JSON.stringify(param);
            $.ajax({
                url:'${pageContext.request.contextPath}/ticket/get',
                type:'post', //GET
                data:params,
                async:true,    //或false,是否异步
                timeout:5000,    //超时时间
                contentType : 'application/json',
                dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data,textStatus,jqXHR){
                    if(data!=null){
                        var result = data.data;
                        if(result != null){
                            var html = "";
                            var downUrls = result.bakstr2;
                            var array = downUrls.split(";");
                            for(var i in array){
                                if(array[i]!=null && array[i] != ''){
                                    html+= ('<div class="col-sm-1"></div>'
                                        +'<div class="col-sm-4">公司名称：<span>'+result.invoiceCompany+'</span></div>'
                                        +'<div class="col-sm-3"></div>'
                                        +'<div class="col-sm-3"><a href="'+array[i]+'" target="_blank">点击下载</a></div>'
                                        +'<div class="col-sm-1"></div>');
                                }
                            }
                            $("#toppay").empty().append(html);
                            $("#divkpxx").show();
                        }
                    }
                },
                error:function(xhr,textStatus){
                },
            })

        }

	</script>
</head>
<body>
<div id="divtqm" class="container" style="margin-top: 3%;">
	<div class="row">
		<div class="col-xs-0 col-sm-2"></div>
		<div class="col-xs-12 col-sm-8">
			<div class="panel panel-default">
				<div class="panel-heading" align="left">
					<div>上海大众运行物流股份有限公司</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-1 col-sm-3"></div>
						<div class="col-xs-10 col-sm-6">
							<div class="row" align="center" style="margin-top: 2%;">
								<span style="color: #BBBBBB">温馨提醒：请使用IE10以上或最新Chrome、Firefox浏览器访问！</span>
							</div>
							<form role="form">
								<div class="form-group" style="margin-top: 6%">
									<label for="name">发票提取码</label>
									<input id="ticketCode" type="text"  maxlength="17" size="17" class="form-control input-lg" placeholder="请输入发票提取码">
								</div>
								<div class="form-group" style="margin-top: 6%">
									<label for="name">验证码</label>
									<div class="input-group">
										<div class="bar4 bar"></div>
										<script type="text/javascript">
                                            var a = $('.bar4').slideToUnlock({
                                                bgColor : '#fce',
                                                progressColor : '#f60',
                                                succColor : 'green',
                                                textColor : '#fff',
                                                succTextColor : 'white',
                                                text : '滑动至右侧验证',
                                                succText : '验证成功'
                                            });
										</script>
									</div>
								</div>

								<div class="form-group" style="margin-top: 6%">
									<button id="tqmbtn" type="button" onclick="doTicket()" class="btn btn-default btn-lg btn-block" style="background-color: #ca0a31"><span style="color: #FFFFFF">开票</span></button>
								</div>
							</form>
						</div>
						<div class="col-xs-1 col-sm-3"></div>
					</div>
					<div id="pc_div" class="row" style="text-align:center;">
						<img style="width:137px;heigth:137px" alt="" src="${pageContext.request.contextPath}/img/wx-code.jpg">
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-0 col-sm-2"></div>
	</div>
</div>
<div id="divkpxx" class="container" style="margin-top: 0%;display: block;">
	<div class="row">
		<div class="col-xs-0 col-sm-2"></div>
		<div class="col-xs-12 col-sm-8">
			<div class="panel2 panel-default">
				<div class="panel-heading" align="left">
					<div>电子发票下载</div>
				</div>
				<div class="panel-body">
					<form role="form" class="form-horizontal">
						<div class="row" id="toppay" style="height: 35px;line-height: 35px;overflow:hidden;">

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

</html>