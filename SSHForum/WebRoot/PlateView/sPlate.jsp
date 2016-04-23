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
    
    <title>My JSP 'sPlate.jsp' starting page</title>
    
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
	<link rel="stylesheet" type="text/css" href="Css/sPlateStyle.css"/>
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
					<li class="rf"><img style="width:25px;height:25px"src='<s:property value="#session.userinfo.UHeadUrl"/>'/></li>	
    				<li class="rf"><a href="./PlateView/UserInfo.jsp">我的信息</a></li>	
    				<li class="rf"><a href="#">消息</a></li>	
    			</s:if>   			
    			
    			<li class="rf"><a href="index.jsp">首页</a></li>			  			
    		</ul>
    	</nav>
    	<div class="fmiddle">
    		<div class="middle">
	    		<h3 id="nowPlate" class="nowPlate"></h3>	<s:if test="%{#session.userinfo!=null}"> <button class="PubTheme rf"><a href="javascript:void(0)" onclick="showP()">发帖</a></button>	</s:if>			
	    		<p class="choose"><a href="javascript:void(0);" onclick="getNow()">动态</a>|<a href="javascript:void(0);" onclick="getGood()">精华</a>|<a href="javascript:void(0);" onclick="getAll()">全部问题</a></p>
    			<hr>
    			<p class="textRight orderby"><a href="javascript:void(0);" onclick="orderByHot()">热门排序</a>|<a href="javascript:void(0);" onclick="orderByTime()">时间排序</a></p>		
    		<div id="cardList">
    			</div>
    		</div>
    	</div>
    	
    	<div id="PublishTheme" class="fmiddle">
    	
    		<div class="publishdiv">
    			<form >
	    			<h2>主题<img src="img/close.png" class="rf" id="closePic"onclick="closeP()" /></h2>
	    			<div id="PubContent"> 
	    			<input id="theme"placeholder="写下你 的主题"/>
	    			<p>内容：</p>
	    			<textarea id="content"rows="" cols="" placeholder="请填写你的内容"></textarea>
	    			<input type="button" id="submitPub"value="发布" onclick="subPub()"/><span style="color:red" id="resultP"></span></span><span class="rf closeSpan" onclick="closeP()">取消</span>
    				</div>
    			</form>
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
    	<div id='cover2'></div>
<s:debug></s:debug>
    	<script src="JS/jquery-1.7.1.js" type="text/javascript"></script>
    	<script>
    	var id=${param.ID};//获得当前板块ID
    	var pageSize = 5; //一页显示的记录数
        var pageIndex = 1; //当前页
        var orderby = "TID Desc", strSearch = " plate="+id;
        var count = 0;  //总记录数
        $(document).ready(function () {
         getContactList();
        });
       	function showP(){
       		$("#PublishTheme").show();
       		$("#cover2").show();
       	}
        function closeP(){
        	$("#PublishTheme").hide();
        	$("#cover2").hide();
        }
        
        function getNow(){
        	orderby="PublishTime desc,ReplyCount Desc";
        	strSearch = "plate="+id;
        	getContactList();
        }
        function getGood(){
        	orderby = "ReplyCount Desc";
        	strSearch = "TType=1 and plate="+id;
        	getContactList();
        }
        function getAll(){
        	orderby = "ReplyCount Desc";
        	strSearch = "plate="+id;
        	getContactList();
        }
        function orderByHot(){
        	orderby = "ClickCount desc";
        	strSearch = "plate="+id;
        	getContactList();
        }
        function orderByTime(){
        	orderby = "PublishTime desc";
        	strSearch = "plate="+id;
        	getContactList();
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
        function IsHot(ishot){
        	if(ishot==1){
        		return "HOT";
        	}
        	else return "";
        }
        function subPub(){
        	var Title=$("#theme").val().trim();
        	var content=$("#content").val().trim();
        	if(Title==""){
        		return;
        	}
        	if(content==""){
        		return;
        	}
        	 $.ajax({
                 url: "ThemeAction_PublishTheme",
                 type: "POST",
                 data: { "theme.Title": Title, "theme.content": content, "theme.plate.PID": id},
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
                url: "ThemeAction_ThemeListByPage",
                type: "POST",
                data: {"page.pageSize": pageSize,"page.pageIndex": pageIndex,"page.strWhere": strSearch,"page.orderby":orderby},
                dataType: "json",
                success: function (result) {            	
                    if (result.code =="1") {
                        count = result.count;
                        var html = "";
                        var data=result.altib; 
                        var title=data[0].PName;
                        $("#nowPlate").html(title);
                        for (var i = 0; i < data.length; i++) {
                        	html+='<div class="card">';
                        	html+='<a class="Ttile" href="PlateView/Theme.jsp?ThemeID='+data[i].TID+'">'+data[i].title+'</a><b>'+IsHot(data[i].isGood)+'</b>';
                        	html+='<div><i class="cardChick">'+data[i].clickCount+'</i>';
                        	html+='<div class="cardContent"><p><a href="#" class="auther">'+data[i].user.UName+'</a></p>';
                        	html+='<div class="content">'+data[i].content+'</div>';
                        	html+='<p class="textRight info"><span><i class="icon icon-comment-empty">&#xe800;</i>'+data[i].replyCount+'条评论</span><span><i class="icon icon-eye">&#xe802;</i>'+data[i].clickCount+'次点击</span><i class="icon icon-clock">&#xe801;</i>'+StandardTime(data[i].publishTime)+'</p>'
                        	html+='</div></div></div>'                                
                        }
                        $("#cardList").html(html);
                    }
                    else {
                      	
                        $("#cardList").html('<h1 class="textCenter">该板块暂无帖子！</h1>');
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

                var PNumCount = Math.ceil(pageCount / pageSize);//判断总分页
                var PNum = parseInt((pageIndex - 1) / pageSize);//判断第几页分页
                if (PNum >= 1)
                    pageHtml += "<li onclick='GotoPage(" + Number((PNum - 1) * PSize + 1) + ")'><a >...</a></li>";
                for (var j = PNum * pageSize; j < (pageCount <= pageSize * (PNum + 1) ? pageCount : pageSize * (PNum + 1)) ; j++) {
                    if (j == pageIndex - 1) {
                        pageHtml += "<li class=\"active\"><a >" + (j + 1) + "</a></li>";
                    }
                    else {
                        pageHtml += "<li onclick='GotoPage(" + (j + 1) + ")'><a >" + (j + 1) + "</a></li>";
                    }
                }
                if ((PNum + 1) < PNumCount)
                    pageHtml += "<li onclick='GotoPage(" + Number((PNum + 1) * pageSize + 1) + ")'><a >...</a></li>";

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
