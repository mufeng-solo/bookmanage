<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/admin.png" type="image/x-icon" />
<style type="text/css">
        body{
            background-color: #ddefff;
        }
        form {
            position: absolute;
            width: 922px;
            height:426px;
            background-image: url("images/login.png");
            background-repeat: no-repeat;
            border-radius: 15px;
            /*设置居中*/
            top:50%;
            left:50%;
            margin-left:-461px;
            margin-top:-213px;
        }
        .box {
            position: absolute;
            left: 550px;
            top: 140px;
            width: 300px;
            height: 150px;
        }
        .box2{
        	position: absolute;
            left: 550px;
            top: 95px;
            width: 300px;
        }
        .sub {
            margin-left: 80px;
        }

        p{
            margin-bottom: 20px;
        }

        .one{
            margin-bottom: 10px;
        }
        
        .btn1{
        	display:block;
        	width:90%;
     		margin-top:5px;
 
        }
    </style>
    <script type="text/javascript">
        
    </script>
</head>
<body>
	
	
	<form name="form1" action="${pageContext.request.contextPath }/admin/queryAdminByAname" method="post">
		<div class="box2">
		 <%
			String error = (String)session.getAttribute("admininfo");
			if(error!=null){
				if(error.equals("error")){
					out.print("<div class='alert alert-danger col-md-12' role='alert'>用户名或密码错误</div>");
					session.removeAttribute("admininfo");
				}
			}
			%>
		</div>
        <div class="box">
        	<h2>后台管理:</h2>
            <div class="row one"><div class="col-md-3">管理员:</div><input class="col-md-7" type="text" name="aname" placeholder="请输入用户名"/></div>
            <div class="row one"><div class="col-md-3">密码:</div><input class="col-md-7" type="password" name="apwd" placeholder="请输入密码"/></div>
            <input type="submit" class="btn btn-info btn1" value="登录" />
        </div>
    </form>
   
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</body>
</html>