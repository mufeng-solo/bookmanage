<%@page import="com.java.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/layui.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/admin.png" type="image/x-icon" />
<style type="text/css">
	.header{
		background-image: url("${pageContext.request.contextPath }/images/head.png");
		width:1138px;
		height:90px;
	}
	.admin{
		float:right;
		margin-top: 35px;
		font-size: 18px;
	}
	.navbar{
		background-color: #9AD2FF;
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
	                    <li class="active"><a href="#">用户管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/manage_system.jsp">系统管理</a></li>
	                    <li><a href="${pageContext.request.contextPath }/admin/return?ordermethod=bytime">借还书管理</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
						<li><a href="${pageContext.request.contextPath }/views/manage.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	
	<!-- 用户列表 -->
	<div class="container">
        <div class="layui-tab">
		  <ul class="layui-tab-title">
		    <li class="layui-this">在线用户</li>
		    <li>用户列表</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
			    <%
			    	List<User> onlineusers = null;
			    	if(request.getAttribute("onlineusers")!=null){
			    		onlineusers = (List<User>)request.getAttribute("onlineusers");
			    	}
			    %>
		    	<div class="panel panel-success">
		        	<div class="panel-heading">
			            	在线用户列表
			            	<div class="onlineusernum">
			            		在线人数:<%if(onlineusers!=null){%><%=onlineusers.size() %><%}else{ %>0<%} %>
			            	</div>
			        </div>
			        <table class="table">
			            <tbody>
			            <%
			            	if(onlineusers != null){
			            	for(User user:onlineusers){
			            %>
			             <tr>	
			                 <td>
			                 	<%=user.getuName() %>
			                 </td>
			             </tr> 
			             <%}}else{ %>
			             	<tr>	
			                 <td>
			                 	无在线用户
			                 </td>
			             </tr> 
			             <%} %> 
		            	</tbody>
		        	</table>
		      	</div>
		    </div>
		    <div class="layui-tab-item">
		    	<div class="panel panel-success">
		            <div class="panel-heading">
		                	用户列表
		            </div>
		            <table class="table">
		                <tbody>
			                <tr>
			                <%
			                	List<User> users = (List<User>)session.getAttribute("users");
			                	for(User user:users){
			                %>
			                        <td>
			                        	<%=user.getuName() %>
			                        </td>
			                    </tr> 
			                 <%} %> 
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
	})
</script>
</body>
</html>