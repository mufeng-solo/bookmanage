<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.entity.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借还书管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/layui.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/admin.png" type="image/x-icon" />
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.header{
		background-image: url("${pageContext.request.contextPath }/images/head.png");
		width:1138px;
		height:90px;
	}
	.admin{
		float:right;
		margin-top: 34px;
		font-size: 18px;
	}
	.navbar{
		background-color: #9AD2FF;
	}
	.btn{
		float: right;
	}
	.des{
		float: right;
	}
	.method{
		float: right;
	}
	.title{
		display: block;
	}
	.wrap-outer {  
	    margin-left: calc(100vw - 100%);  
	}
</style>
</head>
<body>
<div class="wrap-outer">
	<div class="container header">
		<p class="admin">欢迎您 ！${sessionScope.admin}</p>
	</div>
	<%
		String showlend = "";
		String addinfo = "";
		String deleteinfo = "";
		String manager = (String)session.getAttribute("admin");
		if(request.getAttribute("addinfo")!=null){
			addinfo = (String)request.getAttribute("addinfo");
		}
		if(request.getAttribute("deleteinfo")!=null){
			deleteinfo = (String)request.getAttribute("deleteinfo");
		}
		
		if(request.getAttribute("showlend")!=null){
			showlend = (String)request.getAttribute("showlend");
		}
	%>
	<!-- 导航条 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top:1 " role="navigation">
			<div class="container-fluid">
	            <div class="navbar-header">
	            </div>
	            <div class="collapse navbar-collapse">
	                <ul id="mytab" class="nav navbar-nav">
	                    <li><a href="${pageContext.request.contextPath }/views/manage.jsp">首页</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/book/manage/0">图书管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/admin/manageUser">用户管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/manage_system.jsp">系统管理</a></li>
	                    <li class="active"><a href="#">借还书管理</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
						<li><a href="${pageContext.request.contextPath }/views/manage.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	<!-- 添加管理员的模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
	      </div>
	      <div class="modal-body">
	        	<form id="form" action="${pageContext.request.contextPath }/admin/add" method="post">
	        		管理员:<input type="text" name="name"/>
	        		密码:<input type="password" name="pwd"/>
	        	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary submit1">添加</button>
	      </div>
	    </div>
	  </div>
	</div>
	<%
		List<Book> books =  (List<Book>)request.getAttribute("bookDesc");
	%>
	<div class="container">
		<div class="layui-tab">
		  <ul class="layui-tab-title">
		    <li <%if(showlend.equals("")){ %>class="layui-this"<%} %>>管理员</li>
		    <li>借阅排行榜</li>
		    <li <%if(showlend.equals("true")){ %>class="layui-this"<%} %>>用户借阅</li>
		  </ul>
		  <div class="layui-tab-content">
		    <% 
		    	List<Admin> admins = null;
		    	if(request.getAttribute("admins")!=null){
		    		admins = (List<Admin>)request.getAttribute("admins");
		    	}
		    
		    %>
	    	<div class="layui-tab-item <%if(showlend.equals("")){ %>layui-show<%} %> ">
				<div class="panel panel-success">
		        	<div class="panel-heading">
			            	管理员列表<%if(manager.equals("admin")){ %><button data-toggle="modal" data-target="#myModal" class="btn btn-success btn-xs">添加管理员</button><%} %>
			        </div>
			        <table class="table">
			            <tbody>
			            <%
			            	for(Admin admin:admins){

			            %>
				             <tr>
				                 <td>
				                    <%=admin.getAname() %>
				                    <%if(!admin.getAname().equals("admin")){ %><a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/delete?name=<%=admin.getAname() %>&manager=<%=manager%>">删除该管理员</a><%}else{ %><p class="des">超级管理员</p><%} %>
				                 </td>
				             </tr> 
				         <% 
			            	}
				         %>
		            	</tbody>
		        	</table>
		      	</div>
	    	</div>
	    	
	    	<div class="layui-tab-item "> 
				<div class="panel panel-success">
		        	<div class="panel-heading">
			            	图书借阅排行榜前十
			        </div>
			        <table class="table">
			            <tbody>
			             <tr>
			             <%
			             	int i=0;
			             	for(Book book:books){
			             %>
			                 <td>
			                    <%=book.getBookName() %>---<%=book.getLend() %>
			                 </td>
			             </tr> 
			              <%i++;
			              if(i>9){break;}
			          		}%> 
		            	</tbody>
		        	</table>
		      	</div>
		    </div>
		    <%
			    List<UserLendBook> lendInfos = (List<UserLendBook>)request.getAttribute("lendinfos");
				List<String> booksname = (List<String>)request.getAttribute("booksname");
				int fine = (int)request.getAttribute("fine");
		    %>
		    <div class="layui-tab-item <%if(showlend.equals("true")){ %>layui-show<%} %>">
				<div class="panel panel-success">
		        	<div class="panel-heading">
			            	<div class="title">
			            		用户借阅情况
				            	<div class="method">
				            		<form action="${pageContext.request.contextPath }/admin/return">
				            			<select name="ordermethod">
				            				<option  value="byname">用户名排序</option>
				            				<option value="bytime2">还书时间排序</option>
				            			</select>
				            			<input type="submit" class="btn btn-default btn-xs" value="确定" />
				            		</form>
				            	</div>
			            	</div>
			        </div>
			        <table class="table">
			        	<tr>
			        		<th>用户名</th>
			        		<th>借阅书籍</th>
			        		<th>还书日期</th>
			        		<th>欠款金额</th>
			        	</tr>
			            <tbody>
			           		<%
			           			Date date = new Date();
			           			long d1 = date.getTime();
			           			for(int j=0;j<lendInfos.size();j++){
			           		%>
				           	<tr>
				                 <td>
				                    <%=lendInfos.get(j).getUserName() %>
				                 </td>
				                 <td>
				                    <%=booksname.get(j) %>
				                 </td>
				                 <td>
				                    <%=lendInfos.get(j).getReturnDate() %>
				                 </td>
				                 <td>
				                    <%
		                        		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		                        		Date date2 = sdf.parse(lendInfos.get(j).getReturnDate());
		                        		long d2 = date2.getTime();
		                        		if(d1>d2){
		                        			out.print((d1-d2)/(24*3600*1000)*fine);
		                        		}else{
		                        	%>
		                        		未到还书日期
		                        	<%} %>
				                 </td>
				                 <%} %>
				             </tr>
		            	</tbody>
		        	</table>
		      	</div>
			</div>
		  </div>
		</div>
    </div>
</div>   
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/js/layui.js"></script>
<script type="text/javascript">
	//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	});

	//背景设置
	$(function(){
	    var style = '<%= session.getAttribute("style")%>';
	    if(style == "white"){
	    	$("body").css("background-color","#FFFFFF");
	    }
	    if(style == "gray"){
	    	$("body").css("background-color","#D1D1D1");
	    }if(style == "cyan"){
	    	$("body").css("background-color","#AEEEEE");
	    }
	    if(style == "skyblue"){
	    	$("body").css("background-color","#C6E2FF");
	    }
	    if(style == "yellow"){
	    	$("body").css("background-color","#FFFFF0");
	    }
	    if(style == "bc1"){
	    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc1.jpg')");
	    }
	    if(style == "bc2"){
	    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc2.jpg')");
	    }
	    if(style == "bc3"){
	    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc3.jpg')");
	    }
	    
	    
	    $(".submit1").click(function(){
	    	$("#form").submit();	
	    })
	    
	    <% if(addinfo.equals("success")){%>
	    	alert("添加成功");
	    <%}else if(addinfo.equals("error1")){%>
	    	alert("管理员名或密码不能为空");
	    <%}else if(addinfo.equals("error2")){%>
	    	alert("管理员已存在");
	    <%}else if(deleteinfo.equals("success")){%>
	    	alert("删除成功");
	    <%}else if(deleteinfo.equals("nopermission")){%>
	    	alert("没有权限");
	    <%}%>
	})
</script>
</body>
</html>