package com.mp.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 自动生成MyBatis的实体类、实体映射XML文件、Mapper
 *
 * @author 肖宁
 * @date 2017-1-8
 * @version v1.0
 */
@SuppressWarnings("hiding")
public class MybatisUtils {

	/**
	 ********************************** 使用前必读*******************
	 **
	 ** 使用前请将moduleName更改为自己模块的名称即可（一般情况下与数据库名一致），其他无须改动。
	 **
	 ***********************************************************
	 */

	private final String type_char = "char";

	private final String type_date = "date";

	private final String type_timestamp = "timestamp";

	private final String type_int = "int";

	private final String type_bigint = "bigint";

	private final String type_text = "text";

	private final String type_bit = "bit";

	private final String type_decimal = "decimal";

	private final String type_blob = "blob";

	private final String pakage = "D:/news/";
	private final String moduleName = "news"; // 对应模块名称（根据自己模块做相应调整!!!务必修改^_^）

	private final String bean_path = pakage + "entity";

	private final String controller_path = pakage + "controller";
	private final String service_path = pakage + "service";
	private final String dao_path = pakage + "dao";
	private final String mapper_path = pakage + "mapper";

	private final String xml_path = pakage + "mapper";

	private final String bean_package = "com.mp." + moduleName + ".entity";

	private final String mapper_package = "com.mp." + moduleName + ".mapper";

	private final String controller_package = "com.mp." + moduleName
			+ ".controller";
	private final String service_package = "com.mp." + moduleName + ".service";
	private final String dao_package = "com.mp." + moduleName + ".dao";

	private final String db = "dzwl_test";
	private final String driverName = "com.mysql.jdbc.Driver";

	private final String user = "dzwluser";

	private final String password = "t0zpR4Bi";

	private final String url = "jdbc:mysql://54.223.214.33:3306/" + db
			+ "?characterEncoding=utf8";

	private String tableName = null;

	private String beanName = null;

	private String mapperName = null;
	private String controllerName = null;
	private String serviceName = null;
	private String daoName = null;

	private Connection conn = null;

	private void init() throws ClassNotFoundException, SQLException {
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, user, password);
	}

	/**
	 * 获取所有的表
	 *
	 * @return
	 * @throws SQLException
	 */
	private List<String> getTables() throws SQLException {
		List<String> tables = new ArrayList<String>();
		PreparedStatement pstate = conn.prepareStatement("show tables");
		ResultSet results = pstate.executeQuery();
		while (results.next()) {
			String tableName = results.getString(1);
			 if ( tableName.toLowerCase().startsWith("t_card") ) {
			tables.add(tableName);
			 }
		}
		return tables;
	}

	private void processTable(String table) {
		StringBuffer sb = new StringBuffer(table.length());
		String tableNew = table.toLowerCase();
		String[] tables = tableNew.split("_");
		String temp = null;
		for (int i = 1; i < tables.length; i++) {
			temp = tables[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(
					temp.substring(1));
		}
		beanName = sb.toString();
		mapperName = beanName + "Mapper";

		controllerName = beanName + "Controller";
		serviceName = beanName + "Service";
		daoName = beanName + "Dao";
	}

	private String processType(String type) {
		if (type.indexOf(type_char) > -1) {
			return "String";
		} else if (type.indexOf(type_bigint) > -1) {
			return "Long";
		} else if (type.indexOf(type_int) > -1) {
			return "Integer";
		} else if (type.indexOf(type_date) > -1) {
			return "java.util.Date";
		} else if (type.indexOf(type_text) > -1) {
			return "String";
		} else if (type.indexOf(type_timestamp) > -1) {
			return "java.util.Date";
		} else if (type.indexOf(type_bit) > -1) {
			return "Boolean";
		} else if (type.indexOf(type_decimal) > -1) {
			return "java.math.BigDecimal";
		} else if (type.indexOf(type_blob) > -1) {
			return "byte[]";
		}
		return null;
	}

	private String processField(String field) {
		StringBuffer sb = new StringBuffer(field.length());
		// field = field.toLowerCase();
		String[] fields = field.split("_");
		String temp = null;
		sb.append(fields[0].toLowerCase());
		for (int i = 1; i < fields.length; i++) {
			temp = fields[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(
					temp.substring(1).toLowerCase());
		}
		return sb.toString();
	}

	/**
	 * 将实体类名首字母改为小写
	 *
	 * @param beanName
	 * @return
	 */
	private String processResultMapId(String beanName) {
		return beanName.substring(0, 1).toLowerCase() + beanName.substring(1);
	}

	/**
	 * 构建类上面的注释
	 *
	 * @param bw
	 * @param text
	 * @return
	 * @throws IOException
	 */
	private BufferedWriter buildClassComment(BufferedWriter bw, String text)
			throws IOException {
		bw.newLine();
		bw.newLine();
		bw.write("/**");
		bw.newLine();
		bw.write(" * ");
		bw.newLine();
		bw.write(" * " + text);
		bw.newLine();
		bw.write(" * ");
		bw.newLine();
		bw.write(" **/");
		return bw;
	}

	/**
	 * 构建方法上面的注释
	 *
	 * @param bw
	 * @param text
	 * @return
	 * @throws IOException
	 */
	private BufferedWriter buildMethodComment(BufferedWriter bw, String text)
			throws IOException {
		bw.newLine();
		bw.write("\t/**");
		bw.newLine();
		bw.write("\t * ");
		bw.newLine();
		bw.write("\t * " + text);
		bw.newLine();
		bw.write("\t * ");
		bw.newLine();
		bw.write("\t **/");
		return bw;
	}

	/**
	 * 生成实体类
	 *
	 * @param columns
	 * @param types
	 * @param comments
	 * @throws IOException
	 */
	private void buildEntityBean(List<String> columns, List<String> types,
			List<String> comments, String tableComment) throws IOException {
		File folder = new File(bean_path);
		if (!folder.exists()) {
			folder.mkdir();
		}

		File beanFile = new File(bean_path, beanName + ".java");
		// beanFile.createNewFile();
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(beanFile)));
		bw.write("package " + bean_package + ";");
		bw.newLine();
		bw.write("import java.io.Serializable;");
		bw.newLine();
		// bw.write("import lombok.Data;");
		// bw.write("import javax.persistence.Entity;");
		bw = buildClassComment(bw, tableComment);
		bw.newLine();
		bw.write("@SuppressWarnings(\"serial\")");
		bw.newLine();
		// bw.write("@Entity");
		// bw.write("@Data");
		// bw.newLine();
		bw.write("public class " + beanName + " implements Serializable {");
		bw.newLine();
		bw.newLine();
		int size = columns.size();
		for (int i = 0; i < size; i++) {
			bw.write("\t/**" + comments.get(i) + "**/");
			bw.newLine();
			bw.write("\tprivate " + processType(types.get(i)) + " "
					+ processField(columns.get(i)) + ";");
			bw.newLine();
			bw.newLine();
		}
		bw.newLine();
		// 生成get 和 set方法
		String tempField = null;
		String _tempField = null;
		String tempType = null;
		for (int i = 0; i < size; i++) {
			tempType = processType(types.get(i));
			_tempField = processField(columns.get(i));
			tempField = _tempField.substring(0, 1).toUpperCase()
					+ _tempField.substring(1);
			bw.newLine();
			// bw.write("\tpublic void set" + tempField + "(" + tempType + " _"
			// + _tempField + "){");
			bw.write("\tpublic void set" + tempField + "(" + tempType + " "
					+ _tempField + "){");
			bw.newLine();
			// bw.write("\t\tthis." + _tempField + "=_" + _tempField + ";");
			bw.write("\t\tthis." + _tempField + " = " + _tempField + ";");
			bw.newLine();
			bw.write("\t}");
			bw.newLine();
			bw.newLine();
			bw.write("\tpublic " + tempType + " get" + tempField + "(){");
			bw.newLine();
			bw.write("\t\treturn this." + _tempField + ";");
			bw.newLine();
			bw.write("\t}");
			bw.newLine();
		}
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.flush();
		bw.close();
	}

	/**
	 * 构建Mapper文件
	 *
	 * @throws IOException
	 */
	private void buildMapper() throws IOException {
		File folder = new File(mapper_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperFile = new File(mapper_path, mapperName + ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + mapper_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + bean_package + "." + beanName + ";");
		bw.newLine();
		bw.write("import org.apache.ibatis.annotations.Param;");
		bw = buildClassComment(bw, mapperName + "数据库操作接口类");
		bw.newLine();
		bw.newLine();
		// bw.write("public interface " + mapperName + " extends " +
		// mapper_extends + "<" + beanName + "> {");
		bw.write("public interface " + mapperName + "{");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------
		bw = buildMethodComment(bw, "查询（根据主键ID查询）");
		bw.newLine();
		bw.write("\t" + beanName
				+ "  selectByPrimaryKey ( @Param(\"id\") Long id );");
		bw.newLine();
		bw = buildMethodComment(bw, "删除（根据主键ID删除）");
		bw.newLine();
		bw.write("\t" + "int deleteByPrimaryKey ( @Param(\"id\") Long id );");
		bw.newLine();
		bw = buildMethodComment(bw, "添加");
		bw.newLine();
		bw.write("\t" + "int insert( " + beanName + " record );");
		bw.newLine();
		bw = buildMethodComment(bw, "添加 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t" + "int insertSelective( " + beanName + " record );");
		bw.newLine();
		bw = buildMethodComment(bw, "修改 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t" + "int updateByPrimaryKeySelective( " + beanName
				+ " record );");
		bw.newLine();
		bw = buildMethodComment(bw, "修改（根据主键ID修改）");
		bw.newLine();
		bw.write("\t" + "int updateByPrimaryKey ( " + beanName + " record );");
		bw.newLine();

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 生成controller
	 * 
	 * @throws IOException
	 */
	private void buildController() throws IOException {
		File folder = new File(controller_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperFile = new File(controller_path, beanName + "Controller"
				+ ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + controller_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + bean_package + "." + beanName + ";");
		bw.newLine();
		bw.write("import org.springframework.beans.factory.annotation.Autowired;");
		bw.newLine();
		bw.write("import org.springframework.stereotype.Controller;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestMapping;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.ResponseBody;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestBody;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestMethod;");
		bw.newLine();
		bw.write("import org.springframework.ui.Model;");
		bw.newLine();
		bw.write("import com.mp.base.ResponseMsg;");
		bw.newLine();
		bw.write("import java.util.HashMap;");
		bw.newLine();
		bw.write("import java.util.Map;");
		bw.newLine();
		bw.write("import com.mp.base.PageModel;");
		bw.newLine();
		bw.write("import com.mp.base.ResponseMsg;");
		bw.newLine();
		bw.write("import javax.servlet.http.HttpServletRequest;");
		bw.newLine();
		bw.newLine();
		bw.write("import " + service_package + "." + serviceName + ";");
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, controllerName + "controller类");
		bw.newLine();
		bw.write("@Controller");
		bw.newLine();
		bw.write("@RequestMapping(\"/" + serviceName + "\")");
		bw.newLine();
		bw.write("public class " + controllerName + "{");
		bw.newLine();
		bw.newLine();
		bw.write("@Autowired");
		bw.newLine();
		StringBuffer beanNameLow = new StringBuffer(beanName);
		beanNameLow.setCharAt(0, Character.toLowerCase(beanNameLow.charAt(0)));
		StringBuffer serviceNameLow = new StringBuffer(serviceName);
		serviceNameLow.setCharAt(0,
				Character.toLowerCase(serviceNameLow.charAt(0)));
		bw.write("private " + serviceName + "  " + serviceNameLow.toString()+";");
		// ----------定义跳转页面Begin----------
		bw = buildMethodComment(bw, "跳转页面");
		bw.newLine();
		bw.write("@RequestMapping(\"/to" + beanName + "\")");
		bw.newLine();
		bw.write("public String to" + beanName + " (){");
		bw.newLine();
		bw.write("   return \"../page/" + beanNameLow + "\";");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// ----------定义跳转页面End----------
		// -----------翻页查询Start-------
		bw = buildMethodComment(bw, "翻页查询");
		bw.newLine();
		bw.write("@RequestMapping(\"/search\")");
		bw.newLine();
		bw.write("@ResponseBody");
		bw.newLine();
		bw.write("public Map<String, Object> search(HttpServletRequest request, Model model) {");
		bw.newLine();
		bw.write("Map<String, Object> result = new HashMap<String, Object>();");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("Map<String, Object> params = new HashMap<String, Object>();");
		bw.newLine();
		bw.write("PageModel page = new PageModel(");
		bw.newLine();
		bw.write("request.getParameter(\"rows\").isEmpty() ? 10 : Integer.parseInt(request.getParameter(\"rows\").trim()),");
		bw.newLine();
		bw.write("request.getParameter(\"page\").isEmpty() ? 1 : Integer.parseInt(request.getParameter(\"page\").trim()));");
		bw.newLine();
		bw.write("page = "+serviceNameLow+".search(params, page);");
		bw.newLine();
		bw.write("if (page.getList() != null && page.getList().size() > 0) {");
		bw.newLine();
		bw.write("result.put(\"total\", page.getTotalRecord());");
		bw.newLine();
		bw.write(" } else {");
		bw.newLine();
		bw.write("result.put(\"total\", 0);");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("result.put(\"rows\", page.getList());");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("e.printStackTrace();");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("return result;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------翻页查询End-------
		// -----------新增Start-------
		bw = buildMethodComment(bw, "新增");
		bw.newLine();
		bw.write("@RequestMapping(value = \"/add\",method = RequestMethod.POST)");
		bw.newLine();
		bw.write("@ResponseBody");
		bw.newLine();
		bw.write("public ResponseMsg add(@RequestBody " + beanName
				+ " " + beanNameLow + " , Model model) {");
		bw.newLine();
		bw.write("ResponseMsg rm = new ResponseMsg();");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("if (" + serviceNameLow + ".add(" + beanNameLow + ")) {");
		bw.newLine();
		bw.write("rm.setMsg(\"操作成功\");");
		bw.newLine();
		bw.write(" } else {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作失败\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作异常\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("return rm;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------新增End-------
		bw.newLine();
		bw.newLine();
		// -----------修改Start-------
		bw = buildMethodComment(bw, "修改");
		bw.newLine();
		bw.write("@RequestMapping(value = \"/update\",method = RequestMethod.POST)");
		bw.newLine();
		bw.write("@ResponseBody");
		bw.newLine();
		bw.write("public ResponseMsg update(@RequestBody " + beanName
				+ " " + beanNameLow + " , Model model) {");
		bw.newLine();
		bw.write("ResponseMsg rm = new ResponseMsg();");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("if (" + serviceNameLow + ".update(" + beanNameLow + ")) {");
		bw.newLine();
		bw.write("rm.setMsg(\"操作成功\");");
		bw.newLine();
		bw.write(" } else {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作失败\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作异常\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("return rm;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------修改End-------
		bw.newLine();
		bw.newLine();
		// -----------删除Start-------
		bw = buildMethodComment(bw, "删除");
		bw.newLine();
		bw.write("@RequestMapping(value = \"/delete\",method = RequestMethod.POST)");
		bw.newLine();
		bw.write("@ResponseBody");
		bw.newLine();
		bw.write("public ResponseMsg delete(@RequestBody Map<String, String> map, Model model) {");
		bw.newLine();
		bw.write("ResponseMsg rm = new ResponseMsg();");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("String idS = map.get(\"id\");");
		bw.newLine();
		bw.write("Integer id = Integer.parseInt(idS);");
		bw.newLine();
		bw.write("if (" + serviceNameLow + ".delete(id)) {");
		bw.newLine();
		bw.write("rm.setMsg(\"操作成功\");");
		bw.newLine();
		bw.write(" } else {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作失败\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("rm.setCode(400);");
		bw.newLine();
		bw.write("rm.setMsg(\"操作异常\");");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.write("return rm;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------修改End-------
		bw.newLine();

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 生成Service
	 * 
	 * @throws IOException
	 */
	private void buildService() throws IOException {
		File folder = new File(service_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperFile = new File(service_path, beanName + "Service" + ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + service_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + bean_package + "." + beanName + ";");
		bw.newLine();
		bw.write("import org.springframework.beans.factory.annotation.Autowired;");
		bw.newLine();
		bw.write("import org.springframework.stereotype.Service;");
		bw.newLine();
		bw.write("import org.springframework.transaction.annotation.Transactional;");
		bw.newLine();
		bw.write("import com.mp.base.PageModel;");
		bw.newLine();
		bw.newLine();
		bw.write("import " + dao_package + "." + daoName + ";");
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, serviceName + "controller类");
		bw.newLine();
		bw.write("@Service");
		bw.newLine();
		bw.write("@Transactional");
		bw.newLine();
		bw.write("public class " + serviceName + "{");
		bw.newLine();
		bw.newLine();
		bw.write("@Autowired");
		bw.newLine();
		StringBuffer beanNameLow = new StringBuffer(beanName);
		beanNameLow.setCharAt(0, Character.toLowerCase(beanNameLow.charAt(0)));
		StringBuffer daoNameLow = new StringBuffer(daoName);
		daoNameLow.setCharAt(0, Character.toLowerCase(daoNameLow.charAt(0)));
		bw.write("private " + daoName + "  " + daoNameLow.toString()+";");
		bw.newLine();
		bw.newLine();
		// -----------翻页查询Start-------
		bw = buildMethodComment(bw, "翻页查询");
		bw.newLine();
		bw.write("@Autowired");
		bw.newLine();
		bw.write("public PageModel search(Map<String, Object> params, PageModel page) {");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("return " + daoNameLow
				+ ".getPage(\"selectAll\",\"selectAllCount\",params,page);");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("return null;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------翻页查询End-------
		// -----------新增Start-------
		bw = buildMethodComment(bw, "新增");
		bw.newLine();
		bw.newLine();
		bw.write("public boolean add(" + beanName + " " + beanNameLow + ") {");
		bw.newLine();
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("return  " + daoNameLow + ".insertSelective(" + beanNameLow
				+ "); ");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("return false;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------新增End-------
		bw.newLine();
		bw.newLine();
		// -----------修改Start-------
		bw = buildMethodComment(bw, "修改");
		bw.newLine();
		bw.newLine();
		bw.write("public boolean update(" + beanName + " " + beanNameLow
				+ ") {");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("return  " + daoNameLow + ".updateByPrimaryKeySelective("
				+ beanNameLow + "); ");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("return false;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------修改End-------
		bw.newLine();
		bw.newLine();
		// -----------删除Start-------
		bw = buildMethodComment(bw, "删除");
		bw.newLine();
		bw.newLine();
		bw.write("public boolean delete(Integer id) {");
		bw.newLine();
		bw.write("try {");
		bw.newLine();
		bw.write("return  " + daoNameLow + ".deleteByPrimaryKey(id); ");
		bw.newLine();
		bw.write("} catch (Exception e) {");
		bw.newLine();
		bw.write("return false;");
		bw.newLine();
		bw.write("}");
		bw.newLine();
		bw.newLine();
		bw.write("}");
		bw.newLine();
		// -----------修改End-------
		bw.newLine();

		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 生成dao
	 * 
	 * @throws IOException
	 */
	private void buildDao() throws IOException {
		File folder = new File(dao_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperFile = new File(dao_path, beanName + "Dao" + ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + dao_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + bean_package + "." + beanName + ";");
		bw.newLine();
		bw.write("import javax.annotation.Resource;");
		bw.newLine();
		bw.write("import org.apache.ibatis.session.SqlSessionFactory;");
		bw.newLine();
		bw.write("import org.mybatis.spring.support.SqlSessionDaoSupport;");
		bw.newLine();
		bw.write("import org.springframework.dao.DataAccessException;");
		bw.newLine();
		bw.write("import org.springframework.stereotype.Repository;");
		bw.newLine();
		bw.write("import com.mp.base.BaseDaoImpl;");
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, daoName + "dao类");
		bw.newLine();
		bw.write("@Repository");
		bw.newLine();
		bw.write("public class " + daoName + " extends BaseDaoImpl<" + beanName
				+ ">{");
		bw.newLine();
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建实体类映射XML文件
	 *
	 * @param columns
	 * @param types
	 * @param comments
	 * @throws IOException
	 */
	private void buildMapperXml(List<String> columns, List<String> types,
			List<String> comments) throws IOException {
		File folder = new File(xml_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperXmlFile = new File(xml_path, mapperName + ".xml");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperXmlFile)));
		bw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		bw.newLine();
		bw.write("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" ");
		bw.newLine();
		bw.write("    \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">");
		bw.newLine();
		bw.write("<mapper namespace=\"" + mapper_package + "." + mapperName
				+ "\">");
		bw.newLine();
		bw.newLine();

		
		 bw.write("\t<!--实体映射-->"); bw.newLine();
		 bw.write("\t<resultMap id=\"" + this.processResultMapId(beanName) +
		 "ResultMap\" type=\"" + bean_package +"."+beanName+ "\">"); bw.newLine();
		 bw.write("\t\t<!--" + comments.get(0) + "-->"); bw.newLine();
		 bw.write("\t\t<id property=\"" + this.processField(columns.get(0)) +
		 "\" column=\"" + columns.get(0) + "\" />"); bw.newLine(); int size =
		 columns.size(); for ( int i = 1 ; i < size ; i++ ) {
		 bw.write("\t\t<!--" + comments.get(i) + "-->"); bw.newLine();
		 bw.write("\t\t<result property=\"" +
		 this.processField(columns.get(i)) + "\" column=\"" + columns.get(i) +
		 "\" />"); bw.newLine(); } bw.write("\t</resultMap>");
		  
		 bw.newLine(); bw.newLine(); bw.newLine();
		 

		// 下面开始写SqlMapper中的方法
		// this.outputSqlMapperMethod(bw, columns, types);
		buildSQL(bw, columns, types);

		bw.write("</mapper>");
		bw.flush();
		bw.close();
	}

	private void buildSQL(BufferedWriter bw, List<String> columns,
			List<String> types) throws IOException {
		int size = columns.size();
		// 通用结果列
		bw.write("\t<!-- 通用查询结果列-->");
		bw.newLine();
		bw.write("\t<sql id=\"Base_Column_List\">");
		bw.newLine();

		bw.write("\t\t id,");
		for (int i = 1; i < size; i++) {
			bw.write("\t" + columns.get(i));
			if (i != size - 1) {
				bw.write(",");
			}
		}

		bw.newLine();
		bw.write("\t</sql>");
		bw.newLine();
		bw.newLine();

		// 查询（根据主键ID查询）
		bw.write("\t<!-- 查询（根据主键ID查询） -->");
		bw.newLine();
		bw.write("\t<select id=\"selectByPrimaryKey\" resultMap=\""
				+ processResultMapId(beanName)
				+ "ResultMap\" parameterType=\"java.lang." + processType(types.get(0))
				+ "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"Base_Column_List\" />");
		bw.newLine();
		bw.write("\t\t FROM " + tableName);
		bw.newLine();
		bw.write("\t\t WHERE " + columns.get(0) + " = #{"
				+ processField(columns.get(0)) + "}");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();
		// 查询完

		// 删除（根据主键ID删除）
		bw.write("\t<!--删除：根据主键ID删除-->");
		bw.newLine();
		bw.write("\t<delete id=\"deleteByPrimaryKey\" parameterType=\"java.lang."
				+ processType(types.get(0)) + "\">");
		bw.newLine();
		bw.write("\t\t UPDATE " + tableName);
		bw.newLine();
		bw.write("\t\t SET DEL_FLAG = 0 WHERE " + columns.get(0) + " = #{"
				+ processField(columns.get(0)) + "}");
		bw.newLine();
		bw.write("\t</delete>");
		bw.newLine();
		bw.newLine();
		// 删除完

		// 添加insert方法
		bw.write("\t<!-- 添加 -->");
		bw.newLine();
		bw.write("\t<insert id=\"insert\" parameterType=\""
				+  bean_package +"."+beanName + "\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + tableName);
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			bw.write(columns.get(i));
			if (i != size - 1) {
				bw.write(",");
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write("\t\t VALUES ");
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			bw.write("#{" + processField(columns.get(i)) + "}");
			if (i != size - 1) {
				bw.write(",");
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write("\t</insert>");
		bw.newLine();
		bw.newLine();
		// 添加insert完

		// --------------- insert方法（匹配有值的字段）
		bw.write("\t<!-- 添加 （匹配有值的字段）-->");
		bw.newLine();
		bw.write("\t<insert id=\"insertSelective\" parameterType=\""
				+  bean_package +"."+beanName + "\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + tableName);
		bw.newLine();
		bw.write("\t\t <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		String tempField = null;
		for (int i = 0; i < size; i++) {
			tempField = processField(columns.get(i));
			bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
			bw.newLine();
			bw.write("\t\t\t\t " + columns.get(i) + ",");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.newLine();
		bw.write("\t\t </trim>");
		bw.newLine();

		bw.write("\t\t <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		tempField = null;
		for (int i = 0; i < size; i++) {
			tempField = processField(columns.get(i));
			bw.write("\t\t\t<if test=\"" + tempField + "!=null\">");
			bw.newLine();
			bw.write("\t\t\t\t #{" + tempField + "},");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.write("\t\t </trim>");
		bw.newLine();
		bw.write("\t</insert>");
		bw.newLine();
		bw.newLine();
		// --------------- 完毕

		// 修改update方法
		bw.write("\t<!-- 修 改-->");
		bw.newLine();
		bw.write("\t<update id=\"updateByPrimaryKeySelective\" parameterType=\""
				+  bean_package +"."+beanName + "\">");
		bw.newLine();
		bw.write("\t\t UPDATE " + tableName);
		bw.newLine();
		bw.write(" \t\t <set> ");
		bw.newLine();

		tempField = null;
		for (int i = 1; i < size; i++) {
			tempField = processField(columns.get(i));
			bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
			bw.newLine();
			bw.write("\t\t\t\t " + columns.get(i) + " = #{" + tempField + "},");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.newLine();
		bw.write(" \t\t </set>");
		bw.newLine();
		bw.write("\t\t WHERE " + columns.get(0) + " = #{"
				+ processField(columns.get(0)) + "}");
		bw.newLine();
		bw.write("\t</update>");
		bw.newLine();
		bw.newLine();
		// update方法完毕

		// ----- 修改（匹配有值的字段）
		bw.write("\t<!-- 修 改-->");
		bw.newLine();
		bw.write("\t<update id=\"updateByPrimaryKey\" parameterType=\""
				+  bean_package +"."+beanName + "\">");
		bw.newLine();
		bw.write("\t\t UPDATE " + tableName);
		bw.newLine();
		bw.write("\t\t SET ");

		bw.newLine();
		tempField = null;
		for (int i = 1; i < size; i++) {
			tempField = processField(columns.get(i));
			bw.write("\t\t\t " + columns.get(i) + " = #{" + tempField + "}");
			if (i != size - 1) {
				bw.write(",");
			}
			bw.newLine();
		}

		bw.write("\t\t WHERE " + columns.get(0) + " = #{"
				+ processField(columns.get(0)) + "}");
		bw.newLine();
		bw.write("\t</update>");
		bw.newLine();
		bw.newLine();
	}

	/**
	 * 获取所有的数据库表注释
	 *
	 * @return
	 * @throws SQLException
	 */
	private Map<String, String> getTableComment() throws SQLException {
		Map<String, String> maps = new HashMap<String, String>();
		PreparedStatement pstate = conn.prepareStatement("show table status");
		ResultSet results = pstate.executeQuery();
		while (results.next()) {
			String tableName = results.getString("NAME");
			String comment = results.getString("COMMENT");
			maps.put(tableName, comment);
		}
		return maps;
	}

	public void generate() throws ClassNotFoundException, SQLException,
			IOException {
		init();
		String prefix = "show full fields from ";
		List<String> columns = null;
		List<String> types = null;
		List<String> comments = null;
		PreparedStatement pstate = null;
		List<String> tables = getTables();
		Map<String, String> tableComments = getTableComment();
		for (String table : tables) {
			columns = new ArrayList<String>();
			types = new ArrayList<String>();
			comments = new ArrayList<String>();
			pstate = conn.prepareStatement(prefix + table);
			ResultSet results = pstate.executeQuery();
			while (results.next()) {
				columns.add(results.getString("FIELD"));
				types.add(results.getString("TYPE"));
				comments.add(results.getString("COMMENT"));
			}
			tableName = table;
			processTable(table);
			// this.outputBaseBean();
			String tableComment = tableComments.get(tableName);
			buildEntityBean(columns, types, comments, tableComment);
//			buildMapper();
			buildController();
			buildService();
			buildDao();
			buildMapperXml(columns, types, comments);
		}
		conn.close();
	}

	public static void main(String[] args) {
		try {
			new MybatisUtils().generate();
			// 自动打开生成文件的目录
			Runtime.getRuntime().exec("cmd /c start explorer D:\\");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}