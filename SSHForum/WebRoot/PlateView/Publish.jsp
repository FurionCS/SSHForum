<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Publish.jsp' starting page</title>
    
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
  </head>
  
  <body>
   	<nav id="topNav" class="fmiddle">		
    		<ul id="navUl" class="clearOver middle">
    			<li class="lf"><a href="javaScript:void(0)">论坛</a></li>
    			
    			 <c:if test="${login==null}"> 
    			  <li class="rf"><a href="Login.jsp?type=2">注册</a></li>
    			 <li class="rf"><a href="Login.jsp?type=1">登入</a></li>
    			 
				 </c:if>
				<c:if test="${login!=null}"> 
							 
					<li class="rf"><a href="HomeServlet/LoginOutServlet">退出</a></li>	
					<li class="rf"><img style="width:25px;height:25px"src="${login.get(0).getUHeadUrl() }"/></li>	
    				<li class="rf"><a href="./PlateView/UserInfo.jsp">我的信息</a></li>	
    				<li class="rf"><a href="#">消息</a></li>
    				
    			</c:if>   			
    			
    			<li class="rf"><a href="index.jsp">首页</a></li>			  			
    		</ul>
    	</nav>
    	  	
    	 <div id="PublishTheme" class="fmiddle">
    		<div class="middle">
    			<form>
	    			<h2>主题</h2>
	    			<input placeholder="写下你 的主题"/>
	    			<p>内容：</p>
	    			<textarea rows="" cols="" placeholder="请填写你的内容"></textarea>
	    			
    			</form>
    		</div>
    	</div>
    
  </body>
</html>
