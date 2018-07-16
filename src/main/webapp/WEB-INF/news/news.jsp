<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../taglibs.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>
<title>新闻发布</title>
<script type="text/javascript">
	/**提交新增用户**/
	function submitAdd() {
		var validateStatus = $('#addForm').form('enableValidation').form(
				'validate');
		var pa = $("#addForm").serializeJSON();
		pa.body = UE.getEditor('body').getContent();
		var params = JSON.stringify(pa);
		if (validateStatus) {
			$.axs("news/add.action", params, function(data) {
				if (data.code == 200) {
					$("#editId").dialog("close");
					eAlertInfo(data.msg);
					$('#datalist').datagrid('reload');
				} else {
					eAlertInfo(data.msg);
				}
			});
		}
	}
	/**提交更新**/
	function submitUpdates() {
		var validateStatus = $('#editForm').form('enableValidation').form(
				'validate');
		var pa = $("#editForm").serializeJSON();
		var params = JSON.stringify(pa);
		if (validateStatus) {
			$.axs("news/update.action", params, function(data) {
				if (data.code == 200) {
					$("#editShow").dialog("close");
					eAlertInfo(data.msg);
					$('#datalist').datagrid('reload');
				} else {
					eAlertInfo(data.msg);
				}
			});
		}
	}
	/**
	 * 提交删除
	 */
	function doDelete() {
		var row = $("#datalist").datagrid("getSelected");
		if (row != null && row != "") {
			var params = "{\"id\": \"" + row.id + "\"}";
			$.axs("news/delete.action", params, function(data) {
				if (data.code == 200) {
					doSearch();
					eAlertInfo(data.msg);
				} else {
					eAlertInfo(data.msg);
				}
			});
		} else {
			eAlertInfo("请至少选择一条数据");
		}
	}
	/**查询方法**/
	function doSearch() {
		$('#datalist').datagrid('load', {
			title : $("#title").val()
		});
	}
	/**新增方法**/
	function addShow() {
		$("#addShow").dialog({
			modal : true,
			cache : false,
			minimizable : true,//最小化，默认false  
			maximizable : true, //最大化，默认false  
			collapsible : true, //可折叠，默认false  
			resizable : true, //可缩放，即可以通脱拖拉改变大小，默认false 
		}).dialog("open");
		$("#addShow").show();
	}
	/**更新方法**/
	function edit() {
		$("#editId").hide();
		//$("#seditForm")[0].reset();
		var checkvalue = document.getElementsByName("editRole");
		for (var j = 0; j < checkvalue.length; j++) {
			checkvalue[j].checked = false;
		}
		var row = $("#datalist").datagrid("getSelected");
		if (row) {
			$("#susername").textbox('setValue', row.username);
			$("#spassword").textbox('setValue', "");
			$("#sname").textbox('setValue', row.name);
			if (row.departmentId != null) {
				$("#sdepartmentId").combobox('select', row.departmentId.id);
			} else {
				$("#sdepartmentId").text("");
			}
			if (row.bakstr1 != null) {
				$("#seditForm input[id=bakstr1]").combobox('select',
						row.bakstr1);
			} else {
			}
			$("#sstatus").combobox('select', row.status);
			$("#sphone").textbox('setValue', row.phone);
			$("#sid").val(row.id);
			$("#editShow").dialog("open").dialog('setTitle', '修改用户');
			var params = "{\"userId\": \"" + row.id + "\"}";
			$.axs('user/getUserRole.action', params, function(data) {
				if (data.code == 200) {
					var obj = data.data;//
					var roleHtml = '';
					if (obj.length > 0) {
						for (var i = 0; i < obj.length; i++) {
							if (roleHtml == "") {
								//
								var checkvalue = document
										.getElementsByName("editRole");
								for (var j = 0; j < checkvalue.length; j++) {
									if (checkvalue[j].value == obj[i].roleId) {
										checkvalue[j].checked = true;
										break;
									}
								}
								//
								//alert(obj[i].roleId);
								//roleHtml+=obj[i].roleId;
							} else {
								roleHtml += "," + obj[i].roleId;
							}
						}
						$('#editroleShow').combobox('setValues', roleHtml);
					}
				} else {

				}
			});
			$("#editShow").show();
		} else {
			eAlertInfo("请至少选择一条数据");
		}
	}
</script>
<!-- 百度编辑器配置 -->
<script type="text/javascript">
	 	UE.getEditor("body", {
		initialFrameWidth : '99%',
		//设置初始化图标 去除了视频,音乐,涂鸦,多图上传按钮
		toolbars: [[
                    'fullscreen', 'source', '|', 'undo', 'redo', '|',
                    'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                    'directionalityltr', 'directionalityrtl', 'indent', '|',
                    'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                    'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                    'simpleupload', 'emotion', 'map', 'gmap', 'insertframe', 'insertcode', 'pagebreak', 'template', 'background', '|',
                    'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                    'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                    'print', 'preview', 'searchreplace', 'help', 'drafts'
                ]]
	});
</script>
</head>
<body>
	<div id="toolbar">
		标题：<input id="title" class="easyui-textbox" style="width: 500px"
			type="text" value="" /> <a href="javascript:void(0)"
			style="color: #000; padding-left: 5px; padding-right: 5px;"
			class="easyui-linkbutton" onclick="doSearch()">查询</a>
		<div style="float: right;">
			<a href="javascript:void(0)"
				style="color: #000; padding-left: 5px; padding-right: 5px;"
				class="easyui-linkbutton" onclick="addShow()">新增</a> <a
				href="javascript:void(0)"
				style="color: #000; padding-left: 5px; padding-right: 5px;"
				class="easyui-linkbutton" onclick="editShow()">更新</a> <a
				href="javascript:void(0)"
				style="color: #000; padding-left: 5px; padding-right: 5px;"
				class="easyui-linkbutton" onclick="doDelete()">删除</a>
		</div>
	</div>
	<table id="datalist" style="width: 100%; height: 100%;" title="新闻公告"
		class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath }/news/search',
			toolbar:'#toolbar', rownumbers:true, fitColumns:true,
			 pagination:true,striped:true,
			sortOrder:'asc',singleSelect:true,loadMsg:'数据加载中...',fit:false,
			remoteSort:false,method:'get'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true">选择</th>
				<th data-options="field:'id',width:30,align:'center'">ID</th>
				<th data-options="field:'title',width:200,align:'center'">标题</th>
				<th data-options="field:'body',width:100,align:'center'">内容</th>
				<th
					data-options="field:'createDate',width:70,align:'center' ,formatter:formattimess">创建时间</th>
				<th
					data-options="field:'status',width:30,align:'center' ,formatter:formatStatus">状态</th>
			</tr>
		</thead>
	</table>
	<!-- 新增 -->
	<div id="addShow" class="easyui-dialog" title="新增"
		style="width: 750px; hight: 600px;" closed="true">
		<div style="padding: 10px 60px 20px 60px">
			<form id="addForm" class="easyui-form" style="height: 370px;">
				<table cellpadding="5" border="0" style="width: 100%; float: left;">
					<tr>
						<td style="text-align: right;width:50px"><label style="color: red">*
						</label>标题:</td>
						<td><input id="title" name="title" style="width: 500px" class="easyui-textbox"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td style="text-align: right;"><label style="color: red">*
						</label>内容:</td>
						<td><textarea id="body" name="body" style="height: 160px;"></textarea></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center; padding: 5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitAdd()">新增</a>
			</div>
		</div>
	</div>
</body>
</html>