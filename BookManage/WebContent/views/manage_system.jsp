<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
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
	.box{
		width: 400px;
		height: 400px;
		box-shadow: 1px 1px 5px #888888;
		position: relative;
		/*设置居中*/
        top:50%;
        left:50%;
        margin-left:-200px;
	}
	select {
		width: 150px;
		border-radius: 4px;
	}
	.content{
		margin: 30px;
	}
	.btn{
		margin-left: 30px;
	}
</style>
</head>
<body>
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
	                    <li><a href="${pageContext.request.contextPath }/admin/manageUser">用户管理</a> </li>
	                    <li class="active"><a href="#">系统管理</a></li>
	                    <li><a href="${pageContext.request.contextPath }/admin/return?ordermethod=bytime">借还书管理</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
						<li><a href="${pageContext.request.contextPath }/views/manage.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	
	<div class="container box">
		<div class="content">
			设置分页条数
			<form action="${pageContext.request.contextPath }/admin/setPagesize" method="post">
				<select name="size">
					<%for(int i=5;i<=10;i++){ %>
						<option><%=i %></option>
					<%} %>
				</select>
				<input class="btn btn-info btn-sm" type="submit" value="设置">
			</form>
			设置还书日期
			<form action="${pageContext.request.contextPath }/admin/setReturnDate" method="post">
				<select name="date">
					<%for(int i=7;i<=30;i++){ %>
						<option><%=i %></option>
					<%} %>
				</select>
				<input class="btn btn-info btn-sm" type="submit" value="设置">
			</form>
			设置罚款金额
			<form action="${pageContext.request.contextPath }/admin/setFine" method="post">
				<select name="fine">
					<%for(int i=1;i<=4;i++){ %>
						<option><%=i %></option>
					<%} %>
				</select>
				<input class="btn btn-info btn-sm" type="submit" value="设置">
			</form>
			设置管理系统背景
			<form action="${pageContext.request.contextPath }/admin/style" method="post">
				<select name="style">
					<option disabled>纯色</option>
					<option value="white">白色</option>
					<option value="gray">灰色</option>
					<option value="skyblue">天蓝色</option>
					<option value="yellow">淡黄色</option>
					<option value="cyan">青色</option>
					<option disabled>背景</option>
					<option value="bc1">天空</option>
					<option value="bc2">水墨画</option>
					<option value="bc3">圣诞节</option>
				</select>
				<input class="btn btn-info btn-sm" type="submit" value="设置">
			</form>
		</div>
		<%
			String state = "";
			if(request.getAttribute("state")!=null){
				state = (String)request.getAttribute("state");
			}
			if(state.equals("success")){
		%>
		<div class="container">
			<div class="alert alert-success col-md-3" role="alert">
				操作成功
				<button type="button" class="close" data-dismiss="alert">
				  <span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
		<%} %>
	</div>
	

<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript">
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