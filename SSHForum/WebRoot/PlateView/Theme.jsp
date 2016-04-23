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
    
    <title>My JSP 'Theme.jsp' starting page</title>
    
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
	<link rel="stylesheet" type="text/css" href="Css/ThemeStyle.css">
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
					<li class="rf"><a href="HomeServlet/LoginOutServlet">退出</a></li>
					<li class="rf"><img style="width:25px;height:25px"src="${login.get(0).getUHeadUrl() }"/></li>	
    				<li class="rf"><a href="./PlateView/UserInfo.jsp">我的信息</a></li>	
    				<li class="rf"><a href="#">消息</a></li>				
    			</s:if>   					
    			<li class="rf"><a href="index.jsp">首页</a></li>	
    						  			
    		</ul>
    	</nav>
    	
    <div class="fmiddle">
    	<div class="middle">
    		<div class="ThemeContent" id="ThemeContent">	    	
    		</div>
    		<p class="orderBy" id="orderBy"></p>
    		<div id="replyList"> 		
    		</div>
    	</div>
    </div>
    <div class="fmiddle">
                        <div class="middle">
                            <div id="pageInfo" class="dataTables_info">
                            </div>
                             <div class="rf">
                                <ul id="pagePart">
                                </ul>
                            </div>
                        </div>
                       
                    </div>
                      
    
    <div id="PublishTheme" class="fmiddle">
    	
    		<div class="publishdiv">
    			<form >
	    			<h2>回复<img src="img/close.png" class="rf" id="closePic"onclick="closeP()" /></h2>
	    			<div id="PubContent"> 			
	    			<p>内容：</p>
	    			<textarea id="content"rows="" cols="" placeholder="请填写你的内容"></textarea>
	    			<input type="button" id="submitPub"value="答复" onclick="subPub()"/><span style="color:red" id="resultP"></span></span><span class="rf closeSpan" onclick="closeP()">取消</span>
    				</div>
    			</form>
    		</div>
    	</div>
    	
    	<div id='cover2'></div>
    <script src="JS/jquery-1.7.1.js" type="text/javascript"></script>
	<script>
	var id=${param.ThemeID};//获得当前板块ID
	var pid=0;
	var pageSize = 5; //一页显示的记录数
    var pageIndex = 1; //当前页
    var PSize = 5;
    var orderby = "t_forum_Reply.Ticket Desc", strSearch = "t_forum_Reply.TID="+id;
    var count = 0;  //总记录数
    $(document).ready(function () {
     getContactList();   
    });
	function showP(){
		if(${userinfo==null}){
    		window.location.href="Login.jsp";
    	}
   		$("#PublishTheme").show();
   		$("#cover2").show();
   	}
    function closeP(){
    	$("#PublishTheme").hide();
    	$("#cover2").hide();
    }
    
    function GetByTime(){
    	orderby="t_forum_Reply.RPublishTime Desc";
    	getContactList(); 
    }
    function GetByTicket(){
    	orderby="t_forum_Reply.Ticket Desc";
    	getContactList();   
    }
    function up(id){
    	//alert(id);
    	if(${login==null}){
    		window.location.href="Login.jsp";
    	}
    	var setStr="Ticket=Ticket+1";
    	 $.ajax({
             url: "HomeServlet/UpdateReplyServlet",
             type: "POST",
             data: {id: id,setStr:setStr},
             dataType: "json",
             success: function (result) {            	
                 if (result.code =="1") {                    
                	 getContactList();
                 }
                 else {
                	 alert("wuw");
                 }                                     
             },
             error: function () {
                 console.log("error");
             }
         });
    }
    function down(){
    	if(${login==null}){
    		window.location.href="Login.jsp";
    	}
    }
    /**标准化时间*/
	function StandardTime(Time){
		if(Time==null||Time==""){
			return "未知时间";
		}
		else{
			return new Date(parseInt(Time.time,10)).toLocaleDateString()+" "+Time.hours+":"+Time.minutes+":"+Time.seconds;
		}
	}
    
    function subPub(){
    	
    	var content=$("#content").val();
    	if(content==""){
    		return;
    	}
    	alert(pid);
    	 $.ajax({
             url: "ReplyAction_AddReply",
             type: "POST",
             data: {"reply.RContent": content, "reply.theme.TID": id,"reply.plate.PID":pid},
             dataType: "json",
             success: function (result) {            	
                 if (result.code =="1") {                    
                    $("#PublishTheme").hide();
                 	$("#cover2").hide();
                 	getContactList();
                 }
                 else {
                	 $("#resultP").html("发布失败");   
                 }                                     
             },
             error: function () {
                 console.log("error");
             }
         });
    
    }
    function getContactList() {
        $.ajax({
            url: "ThemeAction_ThemeWithReply",
            type: "POST",
            data: { "page.pageSize": pageSize, "page.pageIndex": pageIndex, "page.strWhere": strSearch,"page.orderby":orderby,"page.ID":id},
            dataType: "json",
            success: function (result) {
            	  var count=result.count;
            	  var data1;
            	  if(count>0) data1=result.jtr;
            	  else data1=result.jt;
            	  var html1="";
            	  if(count>0){
            		pid=data1[0].plate.PID;
                  	html1+='<p class="TypeList"><b class="Type">'+data1[0].plate.PName+'</b></p>';
                  	html1+='<h2 class="title">'+data1[0].theme.title+'</h2>';
                  	html1+='<div>'+data1[0].theme.content+'</div>';
                  	$("#ThemeContent").html(html1);  
                  }
            	  else{
            			pid=data1.plate.PID;
            		  	html1+='<p class="TypeList"><b class="Type">'+data1.plate.PName+'</b></p>';
                    	html1+='<h2 class="title">'+data1.title+'</h2>';
                    	html1+='<div>'+data1.content+'</div>';
                    	$("#ThemeContent").html(html1);  
            	  }
                  
                if (count>0) {
                    var html = "";
                    html+='<div class="reply">';
                    $("#orderBy").html('<b>'+count+'个回答</b><button class="PubTheme"><a href="javascript:void(0)" onclick="showP()">回复</a></button><a class="rf" href="javascirpt:void(0);" onclick="GetByTime()">按时间排序</a><a class="rf" href="javascirpt:void(0);"onclick="GetByTicket()">按票数排序</a>'); 		
                    for (var i = 0; i < count; i++) {
                    	html+='<div class="support"><button onclick="up('+data1[i].user.ID+')"><i class="icon icon-thumbs-up">&#xe800;</i><br><span>'+data1[i].ticket+'</span></button><br><button onclick="down()"><i class="icon icon-thumbs-down">&#xe801;</i></button></div>';
                    	html+='<p class="userInfo"><b class="UName">'+data1[i].user.UName+'</b><span class="Uabout">--'+data1[i].user.UAbout+'</span><img  class="rf" style="width:30px;height:30px;"src="'+data1[i].user.UHeadUrl+'"/></p>';
            			html+='<div>'+data1[i].RContent+'</div>';
            			html+='<p class="showTime"><span>回复与:'+StandardTime(data1[i].RPublishTime)+'</span><span class="rf">点赞:'+data1[i].ticket+'</span></p></div>';        		        
                    }
                    $("#replyList").html(html);
                }
                else {  
                	 $("#orderBy").html('<b>0个回答</b><button class="PubTheme"><a href="javascript:void(0)" onclick="showP()">回复</a></button><a class="rf" href="javascirpt:void(0);" onclick="GetByTime()">按时间排序</a><a class="rf" href="javascirpt:void(0);"onclick="GetByTicket()">按票数排序</a>'); 		
                     $("#replyList").html('<h1 class="textCenter">该板块暂无回复！</h1>');
                }                  
               GetPageInfo(count);
            },
            error: function () {
                console.log("error");
            }
        });
    }

    function GetPageInfo(count) {
        var pageHtml = "";
        if (count != 0) {
            recordCount = count;
            pageCount = Math.ceil(recordCount / pageSize);
            if (pageIndex == 1) {
                pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            }
            else {
                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>← <span class='hidden-480'>上一页</span></a></li>";
            }

            var PNumCount = Math.ceil(pageCount / PSize);//判断总分页
            var PNum = parseInt((pageIndex - 1) / PSize);//判断第几页分页
            if (PNum >= 1)
                pageHtml += "<li onclick='GotoPage(" + Number((PNum - 1) * PSize + 1) + ")'><a >...</a></li>";
            for (var j = PNum * PSize; j < (pageCount <= PSize * (PNum + 1) ? pageCount : PSize * (PNum + 1)) ; j++) {
                if (j == pageIndex - 1) {
                    pageHtml += "<li class=\"active\"><a >" + (j + 1) + "</a></li>";
                }
                else {
                    pageHtml += "<li onclick='GotoPage(" + (j + 1) + ")'><a >" + (j + 1) + "</a></li>";
                }
            }
            if ((PNum + 1) < PNumCount)
                pageHtml += "<li onclick='GotoPage(" + Number((PNum + 1) * PSize + 1) + ")'><a >...</a></li>";

            if (pageIndex == pageCount) {
                pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            else {
                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            $("#pagePart").html(pageHtml);
            if (pageSize * pageIndex > recordCount) {
                if (recordCount == 0) {
                    $("#pageInfo").html("显示第 0 条数据到 0 条数据，总共 0 页");
                }
                else {
                    $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + recordCount + " 条数据，总共 " + pageCount + " 页");
                }
            }
            else {
                $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + pageSize * pageIndex + " 条数据，总共 " + pageCount + " 页");
            }
        }
        else {
            pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            $("#pageInfo").html("显示 0 条数据到 0 条数据，总共 0 页");
        }
        $("#pagePart").html(pageHtml);
        if (pageIndex > pageCount) {
            pageIndex = pageCount;
        }
    }

    function GotoPage(topage) {
        pageIndex = topage;
        if (0 < topage && topage <= pageCount)
            getContactList();
    }
	
	</script>
  </body>
</html>
