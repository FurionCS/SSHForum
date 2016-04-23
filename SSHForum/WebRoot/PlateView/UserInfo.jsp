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
    
    <title>My JSP 'UserInfo.jsp' starting page</title>
    
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
	<link rel="stylesheet" type="text/css" href="Css/reset.css">
	<link rel="stylesheet" type="text/css" href="Css/default.css">
	<link rel="stylesheet" type="text/css" href="Css/styles.css">
	<link rel="stylesheet" type="text/css" href="Css/UserInfoStyle.css">
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
    				<li class="rf"><a href="#">我的信息</a></li>	
    				<li class="rf"><a href="#">消息</a></li>				
    			</c:if>   					
    			<li class="rf"><a href="index.jsp">首页</a></li>	
    						  			
    		</ul>
    	</nav>
    	
	<article class="htmleaf-content">
		<!-- multistep form -->
		<form id="msform" action="HomeServlet/UpdateUserInfo" method="post" enctype="multipart/form-data">
			<!-- progressbar -->
			<ul id="progressbar">
				<li class="active">账号设置</li>
				<li>基本信息</li>
				<li>个人详细信息</li>
			</ul>
			<!-- fieldsets -->
			<fieldset>
				<h2 class="fs-title">创建你的账号</h2>
				<input type="text" name="name" id="name" placeholder="姓名" value="${login.get(0).UName }"/>
				<input type="password" name="pass" id="pass"  placeholder="密码(可不修改)"  />
				<input type="password" name="cpass" id="cpass"  placeholder="重复密码" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">基本填写</h2>
				<input type="text" name="email" id="email" placeholder="邮件" value="${login.get(0).getUEmail() }"/>
				<input type="text" name="phone" id="phone" placeholder="电话" value="${login.get(0).UPhone }"/>
				<input type="text" name="about" id="about" placeholder="个性签名" value="${login.get(0).UAbout }" />
				<input type="text" name="sex"   id="sex"placeholder="性别" value="${login.get(0).getUsex()}" />
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">个人详细信息</h2>
				<img style="width:100%;height:250px;margin:auto"src="${login.get(0).getUHeadUrl()}" id="HeadPic"/>	
				<input type="file" name="files[]" id="upFile"/>	
				<input type="text" name="headPic" placeholder="头像" value="${login.get(0).UHeadUrl }" style="display:none;" id="picurl"/>
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="submit" onclick="submitAll()" class="submit action-button" value="Submit" />
			</fieldset>
		</form>
	</article>
	
<script src="JS/jquery-1.7.1.js" type="text/javascript"></script>
<script src="JS/ajaxfileupload.js"></script>
   <script src="JS/jquery.easing.min.js" type="text/javascript"></script>
	<script>
	
	function submitAll(){
		var name=$("#name").val().trim();
		var pass=$("#pass").val().trim();
		var email=$("#email").val().trim();
		var phone=$("#phone").val().trim();
		var about=$("#about").val().trim();
		var sex=$("#sex").val().trim();
		var picurl=$("#picurl").val().trim();
		
		 $.ajax({
		        url: "HomeServlet/UpdateUserInfo",
		        type: "POST",
		        data: {
		        	"user.UName": name,"user.UPassword": pass,"UEmail.email": email,"user.UPhone":phone,"user.UAbout":about,"user.Usex":sex,"user.UHeadUrl":picurl
		        },
		        dataType: "json",
		        success: function (result) {
		            if (result.code == 1) {
		            	window.location.href="PlateView/UserInfo.jsp";
		               // alert("success");
		            }
		            else {
		            	alert("wuwu");
		            }
		        },
		        error: function () {
		            console.log("error");
		        }
		    });
		  
	}
	$("#upFile").change(function(){	
		$.ajaxFileUpload({
	        url:"HomeServlet/SmartUploadForPic",
	        secureuri: false,
	        type:"post",
	        fileElementId:"upFile",
	        dataType: 'json',
	        success: function (result) {
	            if (result.code ==1) {      	
	            	Rurl=result.Rurl;  
	            	  $("#HeadPic").attr('src',Rurl);
	            	  $("#picurl").val(Rurl);
	            	  alert(Rurl);
	            }
	            else if (data.code ==0) {
	               		alert("不好意思啊1");
	            }
	            else {
	            	alert("不好意思啊2");
	            }
	        },
	        error: function (data, status, e) {
	        	alert("不好意思啊3");
	        },
	        complete: function (XMLHttpRequest, textStatus) {
	            
	        }
	    });	
	});
	

	var current_fs, next_fs, previous_fs;
	var left, opacity, scale;
	var animating;
	$('.next').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    $('#progressbar li').eq($('fieldset').index(next_fs)).addClass('active');
	    next_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 1 - (1 - now) * 0.2;
	            left = now * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'transform': 'scale(' + scale + ')' });
	            next_fs.css({
	                'left': left,
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.previous').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    previous_fs = $(this).parent().prev();
	    $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass('active');
	    previous_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 0.8 + (1 - now) * 0.2;
	            left = (1 - now) * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'left': left });
	            previous_fs.css({
	                'transform': 'scale(' + scale + ')',
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.submit').click(function () {
	    return false;
	});
	</script>
    
  </body>
</html>
