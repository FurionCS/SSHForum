<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="Css/config.css">
	<link rel="stylesheet" type="text/css" href="Css/GlobeStyle.css">
	<link rel="stylesheet" type="text/css" href="Css/indexStyle.css">
	
  </head>
  
  <body>
    	<nav id="topNav" class="fmiddle">		
    		<ul id="navUl" class="clearOver middle">
    			<li class="lf"><a href="javaScript:void(0)">论坛</a></li>
    			<s:if test="%{#session.userinfo==null}">
    			  <li class="rf"><a href="Login.jsp?type=2">注册</a></li>
    			 <li class="rf"><a href="Login.jsp?type=1">登入</a></li>    			 
				 </s:if>
				<s:if test="%{#session.userinfo!=null}"> 	 
					<li class="rf"><a href="UserAction_Logout">退出</a></li>	
					<li class="rf"><img style="width:25px;height:25px" src='<s:property value="#session.userinfo.UHeadUrl"/>'/></li>	
    				<li class="rf"><a href="./PlateView/UserInfo.jsp">我的信息</a></li>	
    				<li class="rf"><a href="#">消息</a></li>
    			</s:if>   			
    			<li class="rf"><a href="index.jsp">首页</a></li>			  			
    		</ul>
    	</nav>
    	<div id="Content" class="fmiddle"> 
    		<%-- <s:bean name="com.SSHForum.Service.PlateService" var="ps"></s:bean>
    		<s:set var="lp" value="#ps.getPlateByString()"></s:set>
    		<s:if test="#lp.size>0">
    		 <s:iterator value="#lp" var="P">
    		 	<div class="middle plate">   		 	
    		 		<s:if test="#P.plates.size>0">
    		 		<h2 class="BPlate textCenter clearOver"><b class="lf"><s:property value="#P.PName"/></b><span class="centerP">贴数</span><span class="rf">最近帖子</span></h2><hr>
    		 			<ul class="sPlate">
    		 			<s:iterator value="#P.plates" var="p">
    		 			<li class="textCenter clearOver">
    		 				<a class="lf spName" href="ThemeAction_ThemeListByPage?page.ID=<s:property value='#p.PID'/>">
    		 				<a class="lf spName" href="PlateView/sPlate.jsp?ID=<s:property value='#p.PID'/>">
    		 				<s:property value="#p.PName"/></a>
    		 				<span class="countTopic centerP"><s:property value="#p.PTopicCount"/></span>
    		 				<s:if test="#p.PTopicCount>0">
    		 					<span class="lastWrite rf">lalla</span>
    		 				</s:if>
    		 				<s:if test="#p.PTopicCount==0">
    		 					<span class="lastWrite rf">暂无帖子哦</span>
    		 				</s:if>
    		 				</li>
    		 			</s:iterator>
    		 			<s:if test="#P.plates==null">
    		 			<li class="textCenter">暂时没有子板块哦</li>
    		 			</s:if>
    		 		</ul>
    		 		</s:if>
    		 	</div>
    		 </s:iterator>
    		</s:if>
    		<s:if test="#lp==null"><p class="textCenter">还没有板块哦！！</p></s:if> --%>
    	</div>
	 <s:debug></s:debug> 
    	<script src="JS/jquery-1.7.1.js" type="text/javascript"></script>
    	<script>   	
    		ShowPlate();
    		 function ShowPlate(){
    			var html="";
    	    	$.ajax({
    	            url: "PlateAction_showPlist",
    	            type: "POST",    	            
    	            dataType: "json",
    	            success: function (result) { 
    	                if (result.code ==1) {         	
    	                	var data=result.alpb; 
    	                	var count=0;
    	                	var countT=0;
    	                    for (var i = 0; i < data.length; i++) {    	       
    	                    	if(data[i].PParentID==null){
    	                    		html+='<div class="middle plate" >';
    	                    		html+='<h2 class="BPlate textCenter clearOver"><b class="lf">'+data[i].PName+'</b><span class="centerP">贴数</span><span class="rf">最近帖子</span></h2><hr><ul class="sPlate">';	               		
    	                    		var countPlate=0;
    	                    		for(var j=count;j<data.length;j++){
    	                    			if(data[j].PParentID==data[i].ID){
    	                    				html+='<li class="textCenter clearOver"><a class="lf spName" href="PlateView/sPlate.jsp?pID='+data[j].PID+'&PName='+data[j].PName+'">'+data[j].PName+'</a><span class="countTopic centerP">'+data[j].PTopicCount+'</span>';
    	                    				if(data[j].PTopicCount>0){
    	                    					html+='<span class="lastWrite rf">'+data1[countT].title+'</span></li>';
    	                    					countT++;
    	                    				}
    	                    				else{
    	                    					html+='<span class="lastWrite rf">暂无帖子哦</span></li>';
    	                    				}
    	                    				count++;
    	                    				countPlate++;
    	                    			}else if(data[j].PParentID!=0){
    	                    				
    	                    				break;
    	                    			}else{
    	                    				count++;
    	                    			}
    	                    		}
    	                    		if(countPlate==0){
                    					html+='<li class="textCenter">暂时没有子板块哦</li>';
                    				}
    	                    		html+='</ul>';
    	                    		html+='</div>';
    	                    	}
    	                    	else{
    	                    		
    	                    		break;
    	                    	}
    	                    	
    	                    }
    	                    $("#Content").html(html);
    	                
    	                }
    	                else {
    	                	$("#Content").html("不好意思暂时没有板块");
    	                	
    	                }
    	               
    	            },
    	            error: function () {
    	                console.log("error");
    	            }
    	        });
    	    }
    	</script>
  </body>
</html>
