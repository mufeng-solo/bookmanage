<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/MyCss.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
	.container1{
		position:absolute;
		width: 700px;
		padding-right: 15px;
  		padding-left: 15px;
  		left:50%;
  		margin-left: -116px;
  		float: right;
	}
	.carousel-inner{
		left:50%;
		margin-left:-250px;
	}
	.navbar{
		margin-bottom: 0px;
	}
	.login1{
		margin-top:13px;
		margin-left: 4px;
	}
	
	.panel1{
		width: 450px;
		position:absolute;
		float: right;
	}
	.breadcrumb{
		margin-left: 190px;
	}
	.part1{
		margin-top: 10px;
	}
	.part2{
		margin-top: -10px;
	}
	.alert{
		display: none;
	}
</style>
</head>
<body>
	<!-- 导航条 -->
	<%String name = (String)session.getAttribute("user"); %>
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top:1" role="navigation">
			<div class="container-fluid">
	            <div class="navbar-header">
	                <img src="${pageContext.request.contextPath }/images/header.png"/>
	            </div>
	            <div class="collapse navbar-collapse">
	                <ul id="mytab" class="nav navbar-nav">
	                    <li class="active"><a href="#">首页</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/query/book/0">图书借阅</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/<%if(name!=null){ %>return/book?username=<%=name %><%}else{%>views/book_returning.jsp<%}%>">图书归还</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/book_download.jsp">电子书下载</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
					<%
						String info = (String)session.getAttribute("info");
						/* String name = (String)session.getAttribute("user"); */
						if(info!=null){
							if(info.equals("login")){
					%>			
								<li><span class="glyphicon glyphicon-user login1"></span></li>
								<li class="login1">欢迎您！</li>
								<li class="login1"><%=name%></li>
								<li class="login1"><form action="${pageContext.request.contextPath }/sign_out_contro/userSignOut1?uname=<%=name %>" method="post"><button type="submit" class="btn btn-danger btn-xs">退出</button></form></li>
					<%
							}else if(info.equals("null")){ 
								session.removeAttribute("info");
								session.removeAttribute("user");
								%>
									<li><a href="javascript:;" class="btn3">登录</a></li>
						            <li><a href="javascript:;" class="btn4">注册</a></li>
								<%	
							}
						}else{
					%>
						<li><a href="javascript:;" class="btn3">登录</a></li>
						<li><a href="javascript:;" class="btn4">注册</a></li>
					<%		
						}
					%>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	<!-- 信息简介 -->
	<div class="container part1">
		<h3><span class="glyphicon glyphicon-book"></span>&nbsp;热门书籍介绍：</h3>
		<div class="panel-group panel1" id="accordion" role="tablist" aria-multiselectable="true">
		  <div class="panel panel-default">
		    <div class="panel-heading" role="tab" id="headingOne">
		      <h4 class="panel-title">
		        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          	李清照传
		        </a>
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		      <div class="panel-body">
		      	她出生于书香门第，早期生活优裕，其父李格非藏书甚富，她小时候就在良好的家庭环境中打下文学基础。出嫁后与夫赵明诚共同致力于书画金石的搜集整理。金兵入据中原时，流寓南方，境遇孤苦。所作词，前期多写其悠闲生活，后期多悲叹身世，情调感伤。形式上善用白描手法，自辟途径，语言清丽。论词强调协律，崇尚典雅，提出词“别是一家”之说，反对以作诗文之法作词。能诗，留存不多，部分篇章感时咏史，情辞慷慨，与其词风不同。
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading" role="tab" id="headingTwo">
		      <h4 class="panel-title">
		        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		         	瓦尔登湖
		        </a>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
		      	<div class="panel-body">
		      	《瓦尔登湖》共由18篇散文组成，在四季循环更替的过程中，详细记录了梭罗内心的渴望、冲突、失望和自我调整，以及调整过后再次渴望的复杂的心路历程，几经循环，直到最终实现为止。表明了作者用它来挑战他个人的、甚至是整个人类的界限。但这种挑战不是对实现自我价值的无限希望，而是伤后复原的无限力量。
	     	 	</div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading" role="tab" id="headingThree">
		      <h4 class="panel-title">
		        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		         	 骆驼祥子
		        </a>
		      </h4>
		    </div>
		    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		      <div class="panel-body">
		      	祥子来自农村，是个破产的青年农民，勤劳、纯朴、善良，保留着农村哺育他、教养他的一切，却再也不愿意回农村去了。从农村来到城市的祥子，渴望以自己的诚实劳动买一辆属于自己的车。做个独立的劳动者是祥子的志愿、希望、甚至是宗教，凭着勤劳和坚忍，他用三年的时间省吃俭用，终于实现了理想，成为自食其力的上等车夫。但刚拉半年，车就在兵荒马乱中被逃兵掳走，祥子失去了洋车，只牵回三匹骆驼。祥子没有灰心，他依然倔强地从头开始，更加克己地拉车攒钱。可是，还没有等他再买上车，所有的积蓄又被侦探敲诈、洗劫一空，买车的梦想再次成泡影。
		      </div>
		    </div>
		  </div>
		</div>
	</div>

	<!-- 轮播图 -->
	<div class="container1 part2" id="myCarousel">
    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath }/images/p1.jpg" alt="这是第一张">
                    <div class="carousel-caption">
                        
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath }/images/p2.jpg" alt="这是第二张">
                    <div class="carousel-caption">
                        
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath }/images/p3.jpg" alt="这是第三张">
                    <div class="carousel-caption">
                        
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
       </div>
	</div>
	<!-- 底部导航条 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
	        <ol class="breadcrumb">
	            <li><a href="#">Home</a> </li>
	            <li><a href="#">Library</a> </li>
	            <li><a href="#">Data</a> </li>
	        </ol>
   		</nav>
	</div>
	
	<!-- 登录注册界面 -->
	<div class="mask">
	    <div class="login">
	    <button type="button" class="close" ><span>&times;</span></button>
	        <div class="buttons">  <a class="a1" href="javascript:;">登录</a><a class="a2" href="javascript:;">注册</a></div>
	        <form class="form1" action="" method="post">
		        <p><div class="col-md-4">用户名:</div><input class="col-md-7 input1" name="uname" id="uname" type="text" placeholder="请输入用户名"/></p>
		        <p><div class="col-md-4">密码:</div><input class="col-md-7 input1" name="upwd" id="upwd" type="password" placeholder="请输入密码"/></p>
	            <input class="btn btn-info btn1" type="button" value="登录">
	            
	            <div id="alert1" class="alert alert-danger col-md-12" >
		        		用户名或密码错误	
	        	</div>
	        </form>
	    </div>
	    <div class="register">
	    	<button type="button" class="close" ><span>&times;</span></button>
	        <div class="buttons">  <a class="a1" href="javascript:;">登录</a><a class="a2" href="javascript:;">注册</a></div>
	        <form class="form1" action="">
		        <p><div class="col-md-4">用户名:</div><input class="col-md-7 input1" name="rname" id="rname" type="text" placeholder="请输入用户名"/></p>
		        <p><div class="col-md-4">密码:</div><input class="col-md-7 input1" name="rpwd" id="rpwd" type="password" placeholder="请输入密码"/></p>
	            <input class="btn btn-warning btn2" type="button" value="注册">
		        <div id="alert2" class="alert alert-danger col-md-12" >
		        		用户名已存在!	
	        	</div>
	        	<div id="alert3" class="alert alert-danger col-md-12" >
		        		用户名或密码不能为空!
	        	</div>
	        </form>
	    </div>
	</div>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script>
    $(".carousel").carousel({
        interval:3000
    })
    
    $(function () {
        //jQuery相关代码
       $(".btn3").click(function () {
           $(".mask").fadeIn(300);
           $(".login").show();
           $(".register").hide();

       });
         $(".btn4").click(function () {
             $(".mask").fadeIn(300);
             $(".register").show();
             $(".login").hide();

         });
       $(".close>span").click(function () {
           $(".mask").hide();
       });
       $(".close>span").click(function () {
           $(".mask").hide();
       });

       $(".login>.buttons>a").eq(1).click(function () {
           $(".login").hide();
           $(".register").show();
       });
       $(".register>.buttons>a").eq(0).click(function () {
           $(".login").show();
           $(".register").hide();
       });
       
       //登录的异步操作
    	$(".btn1").click(function() {
    		var $uname = $("#uname").val();
    		var $upwd = $("#upwd").val();
    		   $.ajax({
    			   url: "../login_contro/ajax",
    			   type: "post",
    			   data: {"uname":$uname,"upwd":$upwd},
    			   success:function(result,testStatus){
   						if(result=="true"){
   							$(".mask").hide();
   							window.location.reload();//刷新页面
   						}else{
   							$("#alert1").css({
   								display: "block",
   							});
   						}
	   				},
	   				error:function(xhr,errorMessage,e){
	   					alert("系统异常!");
	   				}
			});
    	   
       });
       
    	//注册的异步操作
    	$(".btn2").click(function() {
    		var $rname = $("#rname").val();
    		var $rpwd = $("#rpwd").val();
    		   $.ajax({
    			   url: "../register_contro/ajax",
    			   type: "post",
    			   data: {"rname":$rname,"rpwd":$rpwd},
    			   success:function(result,testStatus){
   						if(result=="success"){
   							$(".mask").hide();
   							window.location.reload();//刷新页面
   						}else if(result=="error1"){
   							$(".alert").css({
   								display: "none",
   							});
   							$("#alert2").css({
   								display: "block",
   							});
   						}else{
   							$(".alert").css({
   								display: "none",
   							});
   							$("#alert3").css({
   								display: "block",
   							});
   						}
	   				},
	   				error:function(xhr,errorMessage,e){
	   					alert("系统异常!");
	   				}
			});
    	   
       });
       
     });
</script>
</body>
</html>