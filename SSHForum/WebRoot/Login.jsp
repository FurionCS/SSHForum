<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="Css/config.css">
	<link rel="stylesheet" type="text/css" href="Css/GlobeStyle.css">
	<link rel="stylesheet" type="text/css" href="Css/LoginStyle.css">
  </head>
  
  <body>
    	<div class="LoginBody">
    		<h1 id="Name" class="textCenter"><a href="index.jsp">论坛</a></h1>
    		<p id="moto" class="textCenter">与世界分享你的知识、经验和见解</p>
    		<p id="LR" class="textCenter"><span id="loginbtn" onclick="cLogin()">登录</span ><span id="regbtn" onclick="cReg()">注册</span></p>
    		<form action="UserAction_Login" method="post" id="login" >
	    		<input type="text" name="user.UName" placeholder="账号"/>
	    		<input type="password" name="user.UPassword" placeholder="密码"/>
	    		<!-- <div class="Val"><input type="text" name="Validate" class="validate" placeholder="验证码"/><img src="HomeServlet/ValidateServlet"class="ValPic" id="ValidatePic1" onclick="changePic(1)"/></div> -->
	    		<input type="submit" class="sub" value="登录"/>
    		</form>
    		<form action="UserAction_reg" method="post" id="reg" style="display:none">
    			<input type="text" name="user.UName" placeholder="用户名"/>
    			<input type="password" name="user.UPassword" placeholder="密码"/>
    			<input type="password" name="user.UPassword" placeholder="确认密码"/>
    			<div class="Val"><input type="text" name="Validate" class="validate" placeholder="验证码"/><img src="HomeServlet/ValidateServlet" class="ValPic" id="ValidatePic2" onclick="changePic(2)"/></div>
    			<input type="submit" class="sub"value="注册"/>
    		</form>
    	</div>
    	<script>
    		
    		window.onload=function(){
    			if(window.location.search.substr(1)==""||window.location.search.substr(1)==null){
    				//alert(window.location.search.substr(1));
    			}else if(window.location.search.substr(1)=="type=1"){
    				document.getElementById("reg").style.display="none";
        			document.getElementById("login").style.display="block";
        			document.getElementById("loginbtn").style.color="blue";
        			document.getElementById("regbtn").style.color="black";
    			}else{
    				document.getElementById("login").style.display="none";
        			document.getElementById("reg").style.display="block";
        			document.getElementById("loginbtn").style.color="black";
        			document.getElementById("regbtn").style.color="blue";
    			}
    		};
    		function cLogin(){
    			document.getElementById("reg").style.display="none";
    			document.getElementById("login").style.display="block";
    			document.getElementById("loginbtn").style.color="blue";
    			document.getElementById("regbtn").style.color="black";
    		}
    		function cReg(){
    			document.getElementById("login").style.display="none";
    			document.getElementById("reg").style.display="block";
    	
    			document.getElementById("loginbtn").style.color="black";
    			document.getElementById("regbtn").style.color="blue";
    		}
    		function changePic(i){
    			if(i==1)
    				document.getElementById("ValidatePic1").src="HomeServlet/ValidateServlet?"+Math.random();
    			else
    				document.getElementById("ValidatePic2").src="HomeServlet/ValidateServlet?"+Math.random();
    		}
    		
    	</script>
  </body>
</html>
