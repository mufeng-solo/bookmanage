<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
    form{
		position: absolute;
		width: 300px;
		height:300px;
		/*设置居中*/
        top:50%;
        left:50%;
        margin-left:-150px;
        margin-top:-150px; 
	}
	.box {
            position: absolute;
            width: 300px;
            height: 150px;
            box-shadow: 1px 1px 5px #888888;
        }
     .btn1{
     	display:block;
     	width:90%;
     	margin-top:5px;
     	margin-left: 15px;
     }
	.text1{
		background: #F5FFBF;
	}
</style>
 
</head>
<body>
	
	
	<form action="login_contro/queryUserByUname" method="post">
		 
		<h1>用户登录:</h1>
        <div class="box">
            <p><div class="col-md-4">用户名:</div><input class="col-md-7 text1" type="text" name="uname" placeholder="请输入用户名"/><br></p>
            <p><div class="col-md-4">密码:</div><input class="col-md-7 text1" type="password" name="upwd" placeholder="请输入密码"/><br></p>
            <input type="submit" class="btn btn-info btn1" value="登录"/><a class="btn btn-info btn1" href="${pageContext.request.contextPath }/views/result.jsp">返回首页</a>
        </div>
        <%
			String error = (String)session.getAttribute("info");
			if(error!=null){
				if(error.equals("error")){
					out.print("<div class='alert alert-danger col-md-12' role='alert'>用户名或密码错误<button type='button' class='close' data-dismiss='alert'><span>&times;</span></button></div>");
					session.removeAttribute("info");
				}
			}
		%>
    </form>
   
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</body>
</html>