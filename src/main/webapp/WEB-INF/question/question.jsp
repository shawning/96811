<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../taglibs.jsp"%>
<title>常见问题</title>
<script type="text/javascript">
	/**提交新增用户**/
	function submitAdd() {
		var validateStatus = $('#addForm').form('enableValidation').form(
				'validate');
		var pa = $("#addForm").serializeJSON();
		var params = JSON.stringify(pa);
		if (validateStatus) {
			$.axs("question/add.action", params, function(data) {
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
			$.axs("question/update.action", params, function(data) {
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
			$.axs("question/delete.action", params, function(data) {
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
			question : $("#question").val()
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
	function editShow() {
		$("#addShow").hide();
		var row = $("#datalist").datagrid("getSelected");
		if (row) {
			$("#editForm input[id=question]").textbox('setValue', row.question);
			$("#editForm input[id=answer]").textbox('setValue',row.answer);
			$("#editForm input[id=type]").combobox('select', row.type);
			$("#editForm input[id=id]").val(row.id);
			$("#editShow").dialog("open").dialog('setTitle', '修改');
			
			$("#editShow").show();
		} else {
			eAlertInfo("请至少选择一条数据");
		}
	}
	   function forMaterType(value,row,index){
			if(row.type!=1){
				return "车主";
			}else{
				return "货主";
			}
		}
</script>
<!-- 百度编辑器配置 -->
</head>
<body>
	<div id="toolbar">
		问题：<input id="question" class="easyui-textbox" style="width: 500px"
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
	<table id="datalist" style="width: 100%; height: 50%;" title="常见问题"
		class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath }/question/search',
			toolbar:'#toolbar', rownumbers:true, fitColumns:true,
			 pagination:true,striped:true,
			sortOrder:'asc',singleSelect:true,loadMsg:'数据加载中...',fit:false,
			remoteSort:false,method:'get'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true">选择</th>
				<th data-options="field:'id',width:30,align:'center'">ID</th>
				<th data-options="field:'type',width:40,align:'center',formatter:forMaterType">类型</th>
				<th data-options="field:'question',width:100,align:'center'">问题</th>
				<th data-options="field:'answer',width:200,align:'center'">答案</th>
				<th data-options="field:'createDate',width:70,align:'center' ,formatter:formattimess">创建时间</th>
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
						</label>类型:</td>
						<td>
							<select id="type" name="type" class="easyui-combobox" data-options="panelHeight:'auto',editable:false," >
							 <option value="0">车主</option> 
							 <option value="1">货主</option> 
						 	</select> 
						  </td>
					</tr>
					<tr>
						<td style="text-align: right;width:50px"><label style="color: red">*
						</label>问题:</td>
						<td><input id="question" name="question" style="width: 500px" class="easyui-textbox"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td style="text-align: right;"><label style="color: red">*
						</label>答案:</td>
						<td><textarea id="answer" name="answer" style="height: 160px;width:500px"></textarea></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center; padding: 5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitAdd()">新增</a>
			</div>
		</div>
	</div>
	<!-- 新增结束 -->
	<!-- 修改 -->
	<div id="editShow" class="easyui-dialog" title="修改"
		style="width: 750px; hight: 600px;" closed="true">
		<div style="padding: 10px 60px 20px 60px">
			<form id="editForm" class="easyui-form" style="height: 370px;">
				<table cellpadding="5" border="0" style="width: 100%; float: left;">
					<tr>
						<td style="text-align: right;width:50px"><label style="color: red">*
						</label>类型:</td>
						<td>
							<input id="id" name="id" type="hidden"></input>
							<select id="type" name="type"  class="easyui-combobox" data-options="panelHeight:'auto',editable:false," >
							 <option value="0">车主</option> 
							 <option value="1">货主</option> 
						 	</select> 
						  </td>
					</tr>
					<tr>
						<td style="text-align: right;width:50px"><label style="color: red">*
						</label>问题:</td>
						<td><input id="question" name="question" style="width: 500px" class="easyui-textbox"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td style="text-align: right;"><label style="color: red">*
						</label>答案:</td>
						<td><input id="answer" name="answer"  class="easyui-textbox" style="height: 160px;width: 500px"></input></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center; padding: 5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitUpdates()">新增</a>
			</div>
		</div>
	</div>
	<!-- 新增结束 -->
</body>
</html>