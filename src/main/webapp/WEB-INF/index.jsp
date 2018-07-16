<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>96811</title>
<link href="../menuStyle/css/default.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="../menuStyle/js/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="../menuStyle/js/themes/icon.css" />
<script type="text/javascript" src="../menuStyle/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../menuStyle/js/jquery.easyui.min-1.2.0.js"></script>
<script type="text/javascript" src='../menuStyle/js/outlook.js'>
</script>
<script type="text/javascript" src="../js/base.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	var _menus = {
		basic : [ {
			"menuid" : "20",
			"icon" : "icon-sys",
			"menuname" : "新闻公告",
			"menus" : [ {
				"menuid" : "211",
				"menuname" : "新闻公告管理",
				"icon" : "icon-nav",
				"url" : "../news/toNews"
			} ]

		},{
			"menuid" : "20",
			"icon" : "icon-sys",
			"menuname" : "常见问题",
			"menus" : [ {
				"menuid" : "212",
				"menuname" : "常见问题管理",
				"icon" : "icon-nav",
				"url" : "../question/toQuestion"
			/* }, {
				"menuid" : "213",
				"menuname" : "车主审核",
				"icon" : "icon-nav",
				"url" : "../host/toReview.action"
			}, {
				"menuid" : "214",
				"menuname" : "车主信息查询",
				"icon" : "icon-nav",
			"url" : "../host/toHostMsg.action" */
			/* }, {
				"menuid" : "215",
				"menuname" : "pos机管理",
				"icon" : "icon-nav",
				"url" : "../host/toPos.action"  */
			} ]

		}
		  ]
	};
	//设置登录窗口
	function openPwd() {
		$('#w').window({
			title : '修改密码',
			width : 300,
			modal : true,
			shadow : true,
			closed : true,
			height : 160,
			resizable : false
		});
	}
	//关闭登录窗口
	function closePwd() {
		$('#w').window('close');
	}

	//修改密码
	function serverLogin() {
		var $newpass = $('#txtNewPass');
		var $rePass = $('#txtRePass');
	
		if ($newpass.val() == '') {
			msgShow('系统提示', '请输入密码！', 'warning');
			return false;
		}
		if ($rePass.val() == '') {
			msgShow('系统提示', '请在一次输入密码！', 'warning');
			return false;
		}

		if ($newpass.val() != $rePass.val()) {
			msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
			return false;
		}
		   var arm=   "{\"password\": \"" + $newpass.val() + "\"}";
			$.ajax({
				type : 'post',
				contentType : 'application/json',
			    data: arm,
			    dataType:"json",
			    async: false,
			    url : "../user/updatePW.action",
			    success: function(data){
			    	eAlertInfo(data.msg);
					$newpass.val('');
					$rePass.val('');
					$('#w').window('close');
			    },
				error:function(e){
					alert("错误");
				}
			}); 
		 /*   $.ajax("user/updatePW.action",pas, 
		    		function(msg){
				msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
				$newpass.val('');
				$rePass.val('');
				close();
		            }
		            ); */
	
	}
	$(function() {
		$("#vesion").text(" 版本："+baseVesion);
		openPwd();
		$('#editpass').click(function() {
			$('#w').window('open');
		});

		$('#btnEp').click(function() {
			serverLogin();
		})

		$('#btnCancel').click(function() {
			closePwd();
		})

		$('#loginOut').click(function() {
			$.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

				if (r) {
					location.href = '../index.jsp';
				}
			});
		})
	});
</script>
<style>
#css3menu li {
	float: left;
	list-style-type: none;
}

#css3menu li a {
	color: #fff;
	padding-right: 20px;
}

#css3menu li a.active {
	color: yellow;
}
</style>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 50px; background: url(images/layout-browser-hd-bg.gif) #00AEEF repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;line-height: 40px;font-size: 11pt;" class="head">
			欢迎
			${requestScope.user.username} <a href="#" id="editpass" style="font-size: 11pt;">修改密码</a>
			<input id="userId" type="hidden" value="${requestScope.user.id}"/>
			 <a href="#" id="loginOut" style="font-size: 11pt;">安全退出</a>
		</span> 
		<span style="padding-left: 10px; font-size: 16px; float: left;">
			<img src="../menuStyle/images/go-logo.png" width="50" height="50"
			align="absmiddle" /> 大众物流网站后台管理中心</span>
		<ul id="css3menu"
			style="padding: 0px; margin: 0px; list-type: none; float: left; margin-left: 40px;">
			<li><a class="active" name="basic" href="javascript:;" title=""></a></li>
			<li><a name="point" href="javascript:;" title=""></a></li>

		</ul>
	</div>
	<div region="south" split="true"
		style="height: 30px; background: #D2E0F2;">
		<div class="footer">Copyright  &copy; 上海大众运行物流股份有限公司  地址：上海市嘉定区曹安公路2020号　服务热线：96811 <label id="vesion"></label></div>
	</div>
	<div region="west" hide="true" split="true" title="导航菜单"
		style="width: 180px;" id="west">
		<div id='wnav' class="easyui-accordion" fit="false" border="false">
			<!-- 导航内容 -->

		</div>

	</div>
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y: hidden">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">

				<h1>欢迎使用大众物流网站后台管理中心</h1>
				
			</div>
		</div>
	</div>


	<!--修改密码窗口-->
	<div id="w" class="easyui-window" title="修改密码" collapsible="false"
		minimizable="false" maximizable="false" icon="icon-save"
		style="width: 300px; height: 150px; padding: 5px; background: #fafafa;">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<table cellpadding=3>
					<tr>
						<td>新密码：</td>
						<td><input id="txtNewPass" type="password" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input id="txtRePass" type="password" class="easyui-textbox" /></td>
					</tr>
				</table>
			</div>
			<div region="south" border="false"
				style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"
					href="javascript:void(0)"> 确定</a> <a id="btnCancel"
					class="easyui-linkbutton" icon="icon-cancel"
					href="javascript:void(0)">取消</a>
			</div>
		</div>
	</div>

	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
</body>
</html>