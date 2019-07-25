<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
	<title>大众物流|大众搬家|大众搬场|热线：96811|上海大众运行物流股份有限公司官网---上海搬家公司|上海物流公司|上海货运公司</title>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/redirect.js"></script>
	<script type="text/javascript">
        /*
        $(document).ready(function() {
            $(".top").load("header.html");
            $(".footer").load("footer.html");
        }); */
	</script>
	<!-- 弹出广告样式 start -->
	<style type="text/css">
		.advbox{width:650px;position:fixed;display:none;left:50%;top:0;margin:-215px 0 0 -325px;z-index:99}
		.advbox .advpic{position:relative;height:400px;overflow:hidden;}
		.advbox .advpic .closebtn{display:block;width:60px;height:22px;line-height:26px;font-size:12px;color:black;text-indent:12px;overflow:hidden;position:absolute;right:12px;top:5px;z-index:99;}
		.record2{width:25.317em; height:13.465em;  background: url(img/ticket.png) no-repeat; background-size:120%;  position: relative;  margin-top:1em; margin-left:1.4em}
		.record2 p,.overdue-ticket p,.record p{ width:92%; padding:1.5% 4%; font-size:14px;color:#fff; }
		.overdue-ticket p b,.record p  b{ float: right; font-weight:normal }
		.record-type{ width:92%; padding:0 4%; height:3em;line-height:3em; color:#fff; text-align:right  }
		.record-type b{ float: left; font-weight:normal; font-size:28px; }
		.record-type span{ font-size:28px}
		.overdue-ticket{width:20.317em; height:8.465em;  margin:  0  auto; margin-bottom:3%; background: url(img/overdue.png) no-repeat; background-size:100%;  position:relative;}
		.over{width:2.539em; height:2.243em;  background: url(img/over.png) no-repeat; background-size:100%;  position: absolute; bottom:0.3em;right:0.2em}
		.expired{width:2.539em; height:2.243em;  background: url(imgimage/expired.png) no-repeat; background-size:100%;  position: absolute  ;bottom:0.37em;right:0.25em}
		.grabed{width:2.539em; height:2.243em;  background: url(img/image/grabed.png) no-repeat; background-size:100%;  position: absolute  ;bottom:0.37em;right:0.25em}
		.overdue{ position:absolute; bottom:0.8em;width:80%;}
		.overdue p{color:#666; padding:4%;       font-weight: 700;}
		.col-xs-6 p li {font-size: 7px}
	</style>
	<!-- 弹出广告样式 end -->
	<!--[if lt IE 9]>
	<script src="https://cdn.yuncars.cn/vendor/iecompatible/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<!-- 广告内容 -->
 <div class="advbox">
<div class="advpic">
    <a href="http://www.96811.com/news/newsDetail?id=17"><img width="650" height="400" alt="" src="img/tiaojiao.jpg"/></a>
    <a href="javascript:void(0);" class="closebtn">关闭</a>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        /*$(".advbox").show();
        $(".advbox").animate({top:"50%"},1000);
        $(".closebtn").click(function(){
            $(".advbox").fadeOut(500);
        })*/
    })
    </script>
<!-- 广告内容结束 -->
<div id="home">
	<div class="top" style="background: white;">
		<%@include file="header.html"%>
	</div>
	<section style="background: #fff;">
		<div class="container">
			<div class="banner">
				<div id="carousel-example-generic" class="carousel slide"
					 data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<!--
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        -->
					</ol>
					<div class="carousel-inner" role="listbox" id="banners">
						<div class="item active">
							<a href="order/toOrder"><img src="img/1.jpg" alt=""></a>
						</div>
						<div class="item">
							<a href="order/toOrder"><img src="img/2.jpg" alt=""></a>
						</div>
						<div class="item">
							<a href="order/toOrder"><img src="img/3.jpg" alt=""></a>
						</div>
						<!--
                        <div class="item">
                            <a href="http://www.96811.com/news/newsDetail?id=16"><img src="img/4.jpg" alt=""></a>
                        </div>
                        -->
					</div>
				</div>
			</div>
		</div>
	</section>

	<section style="background: #fff;">
		<div class="container">
			<div class="process">
				<div class="row">
					<div class="col-xs-2">
						<div class="thumbnail">
							<div class="thumbnail-icon">
								<img src="${pageContext.request.contextPath}/img/homeico1.png">
							</div>
							<div class="caption">
								<h3>货运出租</h3>
								<!-- <p>提供最优质的产品<br/>以产品第一为保证<br/>领先行业最高质量</p> -->
							</div>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="thumbnail">
							<div class="thumbnail-icon">
								<img src="${pageContext.request.contextPath}/img/homeico2.png">
							</div>
							<div class="caption">
								<h3>市内搬家</h3>
								<!-- <p>提供最优质的产品<br/>以产品第一为保证<br/>领先行业最高质量</p> -->
							</div>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="thumbnail">
							<div class="thumbnail-icon">
								<img src="${pageContext.request.contextPath}/img/homeico3.png">
							</div>
							<div class="caption">
								<h3>国际搬家</h3>
								<!-- <p>提供最优质的产品<br/>以产品第一为保证<br/>领先行业最高质量</p> -->
							</div>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="thumbnail">
							<div class="thumbnail-icon">
								<img src="${pageContext.request.contextPath}/img/homeico4.png">
							</div>
							<div class="caption">
								<h3>市内配送</h3>
								<!-- <p>提供最优质的产品<br/>以产品第一为保证<br/>领先行业最高质量</p> -->
							</div>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="thumbnail">
							<div class="thumbnail-icon">
								<img src="${pageContext.request.contextPath}/img/homeico5.png">
							</div>
							<div class="caption">
								<h3>危化品配送</h3>
								<!-- <p>提供最优质的产品<br/>以产品第一为保证<br/>领先行业最高质量</p> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="about middle-content text-center">
				<h3 class="dz-title">
					公司简介<small>COMPANY PROFILE</small>
				</h3>
				<p>上海大众运行物流股份有限公司</p>
				<p>成立于1999年</p>
				<P>荣获“上海名牌产品”称号</P>
				<p>上海市首批无车承运人试点单位</p>
				<p>ISO9001质量管理体系认证通过</p>
				<p>拥有近千余辆运输车辆资源，满足各类搬家、配送、物流需求。</p>
			</div>
		</div>
	</section>

	<section style="background: #fff;">
		<div class="container">
			<div class="liuc middle-content">
				<h3 class="dz-title">
					软件使用步骤<small>DAZHONG STEPS FOR USAGE</small>
				</h3>
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
								<img alt="Danx" src="img/danx1.jpg" width="230" height="407" />
								<img alt="Danx" src="img/danx2.jpg" width="230" height="407" />
								<img alt="Danx" src="img/danx3.jpg" width="230" height="407" />
								<img alt="Danx" src="img/danx4.jpg" width="230" height="407" />
							</div>
						</div>

						<div class="png"></div>

						<a id="hi-btn0" class="hi_btn"></a> <a id="hi-btn1"
															   class="hi_btn"></a> <a id="hi-btn2" class="hi_btn"></a> <a
							id="hi-btn3" class="hi_btn"></a>

						<div class="prev"></div>
						<div class="next"></div>

						<div class="slider-p">

							<div id="slider-p0" class="slider-p-div">
								<img src="img/word-6.png" alt="">
							</div>

							<div id="slider-p1" class="slider-p-div">
								<img src="img/word-7.png" alt="">
							</div>

							<div id="slider-p2" class="slider-p-div">
								<img src="img/word-8.png" alt="">
							</div>

							<div id="slider-p3" class="slider-p-div">
								<img src="img/word-9.png" alt="">
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<%@include file="onfooter.jsp"%>
	<ul class="ul_icon">
		<li id="li00"><img src="img/gift.png" />
			<div class="tips" id="tips00">
				<div class="con" style="width: 160px;">
					<b>点击领券</b>
					<%--<img src="img/app-code.jpg" alt="" width="100">--%>
				</div>
				<i class="arrow-right"></i>
			</div></li>
		<li id="li01"><img src="img/icon3.png" />
			<div class="tips" id="tips01">
				<div class="con">
					<img src="img/app-code.jpg" alt="" width="100">
				</div>
				<i class="arrow-right"></i>
			</div></li>
		<li id="li02"><img src="img/icon.png" />
			<div class="tips" id="tips02">
				<div class="con" style="width: 160px;">
					<b>全国热线：96811</b>
				</div>
				<i class="arrow-right"></i>
			</div></li>
		<li id="li03"><img src="img/icon2.png" />
			<div class="tips" id="tips03">
				<div class="con">
					<img src="img/wx-code.jpg" alt="" width="100">
				</div>
				<i class="arrow-right"></i>
			</div></li>
	</ul>

</div>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript">
    $(function(){
        $(".carousel").carousel({
            interval: 8000
        });
        $('li.dropdown').mouseover(function() {
            $(this).addClass('open');
        }).mouseout(function() {
            $(this).removeClass('open');
        });
        $(".ul_icon>li").mouseover(function (){
            var Obj = $(this).attr('id');
            num = Obj.substring(2, Obj.length);
            $("#tips"+num).show();
        }).mouseout(function (){
            $(".ul_icon li>div[id]").hide();
        });
    });
</script>
<!-- 领券start -->
<%--<div id="couponsCloseDiv" style="width: 50%;min-width: 50%;position: fixed;right: 0;bottom: 20%;z-index: 1001;height:30%;background: rgba(0, 17, 26,0.85)">--%>
<div id="couponsCloseDiv" style="display:none;width: 100%;min-width: 100%;position: fixed;left: 0;bottom: 0;z-index: 1001;height:46%;background: rgba(0, 17, 26,0.85)">

	<a id="couponsClose" style="width: 48px;height: 48px;display: inline-block;position: absolute;right: 0;top: 10px;background: url(${pageContext.request.contextPath}/img/close.png);">
	</a>
	<div class="reserve middle-content" style="width: 90%;margin: 0 auto;color:white;font-weight: 100;padding-top: 10px;">
		<h3 class="dz-title">大众运行送券啦</h3>
		<div class="reserve-content">
			<form role="form">
				<div class="row">
					<div class="col-xs-6" style="width:33%">
						<div class="record2" id="ticket">
							<p><span id="conponsType"></span></p>
							<input type="hidden" id="conponsId" value="">
							<div class="record-type"><b id="conponsName"></b><span id="conponsValiableMoney"></span>元</div>
							<span class="over" id="over" style="display:none"></span>
							<span class="expired" id="expired" style="display:none"></span>
							<div class="overdue">
								<p>有效期至&nbsp;<span id="conponsEndDate"></span></p>
							</div>
						</div>
					</div>
					<div class="col-xs-6" style="width:33%">
						<p>
						<li>
							1. 活动页面中每个手机号仅限领取一张优惠券；
						</li>
						<li>
							2. 本优惠券仅在大众搬场业务中使用；
						</li><li>
						3. 优惠券可分享与转赠，获赠人请输入手机号领取；
					</li><li>
						4. 优惠券领取成功后，请关注微信公众号后至“我的礼券”页面查看；
					</li><li>
						5. 请使用微信绑定的手机号查询您的优惠券；
					</li><li>
						6. 优惠券仅在拨打96811电话下单时抵扣优惠券票面所写项目，下单时需提供完整的券号与所属手机号；
					</li><li>
						7. 每张优惠券仅可使用一次，每次限用一张，且不可与其他优惠同时使用；
					</li><li>
						8. 每张优惠券均标注有效期，请在有效期内使用，过期将失效，搬场业务可预定时间与优惠券有效期一致；
					</li><li>
						9. 订单发票金额将以实际支付费用提供，优惠券不提供发票。
					</li>
						</p>
					</div>
					<div class="col-xs-6" style="width:33%">
						<div class="form-group" style="margin-bottom:15px">
							<label><span style="color:red">* </span>手机号码</label>
							<input type="tel" id="customerPhone" class="form-control" placeholder="请输入您的手机号码">
							<label id="phoneSpan" style="color: red;font-size: 12px;"></label>
						</div>
						<div class="form-group" style="margin-bottom:15px">
							<label>&nbsp</label>
							<button type="button" onclick="grab()" class="form-control btn btn-warning" >领取</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6" style="width:66%">

					</div>
					<div class="col-xs-6" style="width:33%">
						<div class="form-group"  style="margin-bottom:5px">

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#close").click(function(){
            $("#closeDiv").fadeOut(500);
        })
    })
</script>
<!-- 领券 end -->
<!-- 订单start -->
<div id="closeDiv" style="width: 100%;min-width: 100%;position: fixed;left: 0;bottom: 0;z-index: 1001;height:30%;background: rgba(0, 17, 26,0.85)">
	<a id="close" style="width: 48px;height: 48px;display: inline-block;position: absolute;right: 0;top: 10px;background: url(${pageContext.request.contextPath}/img/close.png);">
	</a>
	<div class="reserve middle-content" style="width: 90%;margin: 0 auto;color:white;font-weight: 100;padding-top: 10px;">
		<h3 class="dz-title">在线预约</h3>
		<div class="reserve-content">
			<form role="form">
				<div class="row">
					<div class="col-xs-6" style="width:33%">
						<div class="form-group" style="margin-bottom:5px">
							<label><span style="color:red">* </span>预订时间</label>
							<input type="text" value="" id="bookDate" class="form-control" id="datetimepicker">
						</div>

						<div class="form-group" style="margin-bottom:5px">
							<label><span style="color:red">* </span>搬家地址(出发地)</label>
							<input type="text" id="addressFrom" class="form-control" placeholder="请输入您的目的地">
						</div>
					</div>
					<div class="col-xs-6" style="width:33%">
						<div class="form-group" style="margin-bottom:5px">
							<label>姓名</label>
							<input type="text" id="name" class="form-control" placeholder="请输入您的姓名">
						</div>
						<div class="form-group" style="margin-bottom:5px">
							<label><span style="color:red">* </span>搬家地址(目的地)</label>
							<input type="text" id="addressTo" class="form-control" placeholder="请输入您的目的地">
						</div>
					</div>
					<div class="col-xs-6" style="width:33%">
						<div class="form-group" style="margin-bottom:5px">
							<label><span style="color:red">* </span>联系电话</label>
							<input type="tel" id="phone" class="form-control" placeholder="请输入您的联系电话">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6" style="width:66%">
						<div class="form-group">
							<label>搬运物品</label>
							<textarea class="form-control" style="height: 34px;" id="description" rows="1"></textarea>
						</div>
					</div>
					<div class="col-xs-6" style="width:33%">
						<div class="form-group"  style="margin-bottom:5px">
							<label>&nbsp</label>
							<button type="button" onclick="addOrder()" class="form-control btn btn-warning" >提交</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
    var isConponsValiable = false;
    $(document).ready(function(){
        $("#close").click(function(){
            $("#closeDiv").fadeOut(500);
        })
        $("#couponsClose").click(function(){
            $("#couponsCloseDiv").fadeOut(500);
        })
        $("#li00").click(function(){
            //点击优惠券
            if(isConponsValiable){
                $("#closeDiv").hide();
                $("#couponsCloseDiv").fadeIn(500);
            }else{
                alert("活动已经结束啦");
            }
        })
        getLastestConpons();
        /**
         * 查看优惠券活动
         */
        function getLastestConpons(){
            var param = new Object();
            param.id = 1;
            var params = JSON.stringify(param);
            $.ajax({
                url:'${pageContext.request.contextPath}/conpons/getConpons',
                type:'post', //GET
                data:params,
                async:true,    //或false,是否异步
                timeout:5000,    //超时时间
                contentType : 'application/json',
                dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data,textStatus,jqXHR){
                    data = data.data;
                    if(data!=null){
                        $("#conponsType").html(data.type);
                        $("#conponsId").val(data.id);
                        $("#conponsName").html(data.name);
                        $("#conponsValiableMoney").html(data.valiableMoney);
                        $("#conponsEndDate").html(data.endDate);
                        isConponsValiable = true;
                        // alert(data.msg);
                    }else{
                        isConponsValiable = false;
                    }
                },
                error:function(xhr,textStatus){
                },
            })
        }

    })
    function grab() {
        var conponsId = $("#conponsId").val();
        var customerPhone = $("#customerPhone").val();
        if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(customerPhone))){
            $("#phoneSpan").html("请输入正确的手机号");
            return ;
        }else {
            $("#phoneSpan").html("");
        }
        var param = new Object();
        param.couponsId = conponsId;
        param.customerPhone = customerPhone;
        var params = JSON.stringify(param);

        $.ajax({
            type : "post",
            url :  "${pageContext.request.contextPath}/conpons/grab",
            dataType : "json",
            contentType : 'application/json',
            async:true,    //或false,是否异步
            data : params,
            success : function(data) {
                if (data.code == 200) {
                    if(data.data.msg == null || data.data.msg == ""){
                        alert("领取成功,请关注《大众物流》公众号查看活动券");
                    }else{
                        alert(data.data.msg);
                    }

                    // window.location.href = "toConponsList?openId="+openId;
                    //alert("领取成功");
                }else{
                    alert(data.msg);
                    //$("#msg").html(data.msg);
                    //$("#other").show().delay(2000).hide(500);
                }
            }
        });
    }
</script>
<!-- 订单 end -->
<script src="${pageContext.request.contextPath}/datetimepicker/build/jquery.datetimepicker.full.js"></script>
<script src="${pageContext.request.contextPath}/js/json.js"></script>
<link rel="stylesheet" type="text/css"
	  href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<script type="text/javascript">

    $.datetimepicker.setLocale('ch');
    $('#bookDate').datetimepicker({
        format:'Y-m-d H:i:s',
        dayOfWeekStart : 1,
        step : 30,
        todayButton:false
    });
    function addOrder(){
        var param = new Object();
        var bookDate = $("#bookDate").val();
        var name = $("#name").val();
        var addressFrom = $("#addressFrom").val();
        var phone = $("#phone").val();
        var addressTo = $("#addressTo").val();
        var description = $("#description").val();
        param.name =name;
        param.bakstr1 = description;
        if(bookDate!=null&&bookDate!=""){
            var date = new Date();
            var now = date.getFullYear() + "-";
            now = now + (date.getMonth() + 1) + "-"; //取月的时候取的是当前月-1如果想取当前月+1就可以了
            now = now + date.getDate() + " ";
            now = now + date.getHours() + ":";
            now = now + date.getMinutes() + ":";
            now = now + date.getSeconds() + "";
            var bb = daysBetween(bookDate,now);
            if(72>=bb){
                alert("只能预约3天后的时间");
                return;
            }
            param.bookDate = bookDate;
        }else{
            alert("请输入预定时间");
            return;
        }
        if(phone!=null&&phone!=""){
            param.phone = phone;
        }else{
            alert("请输入联系电话");
            return;
        }
        if(addressFrom!=null&&addressFrom!=""){
            param.addressFrom = addressFrom;
        }else{
            alert("请输入起运地");
            return;
        }
        if(addressTo!=null&&addressTo!=""){
            param.addressTo = addressTo;
        }else{
            alert("请输入目的地");
            return;
        }
        var params = JSON.stringify(param);
        $.ajax({
            url:'${pageContext.request.contextPath}/order/add',
            type:'post', //GET
            data:params,
            async:true,    //或false,是否异步
            timeout:5000,    //超时时间
            contentType : 'application/json',
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success:function(data,textStatus,jqXHR){
                if(data!=null){
                    alert(data.msg);
                }
            },
            error:function(xhr,textStatus){
            },
        })
    }
    function daysBetween(DateOne,DateTwo)
    {
        var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));

//计算两个时间相差几天时用的语句
//var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);
        var OneDay = DateOne.substring(DateOne.lastIndexOf('-') + 1, DateOne.indexOf(' '));
        var OneYear = DateOne.substring(0, DateOne.indexOf('-'));
        var OneHouse = DateOne.substring(DateOne.indexOf(' ') + 1, DateOne.indexOf(':'));

        var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));
        var TwoDay = DateTwo.substring(DateTwo.lastIndexOf('-') + 1, DateTwo.indexOf(' '));
        var TwoYear = DateTwo.substring(0, DateTwo.indexOf('-'));
        var TwoHouse = DateTwo.substring(DateTwo.indexOf(' ') + 1, DateTwo.indexOf(':'));

//计算两个时间相差几个小时
        var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000 * 24 + (OneHouse - TwoHouse));

//计算两个时间相差几天
//var cha = Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)/ 86400000;
//return Math.abs(cha);
        return cha;
    }
</script>
</body>
</html>