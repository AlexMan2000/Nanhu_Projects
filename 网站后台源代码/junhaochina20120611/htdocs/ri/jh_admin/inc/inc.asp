<!--#include file="config.asp"-->
<%
if Request.Cookies("face")=empty then
   Response.Cookies("face")=face
end if
Response.Cookies("border")=border
%>
<div style="position: absolute; width: 100%; height: 100px; z-index: -1; left: 0px; top: 220px">
<p align="center">下载中，请稍等...<br><br>
<img src="images/loading.gif"></div>

<html>
<head>
<title><%=webname%> - <%=start%></title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Window-target" content="_top">
<meta name="keywords" content="天涯浪子,Candy论坛,免费资源,图片,壁纸,音乐,临海听风">
<meta name="description" content="整站，修改版，天涯浪子，免费，全部，论坛，论坛，图片，文章，下载，影音,资源">
<meta name="robots" content="all">
<link href="skins/<%=Request.Cookies("face")%>/fztt.css" type="text/css" rel="stylesheet">

<script language="javascript" src=inc/title.js></script>
<NOSCRIPT>
<iframe src="*.html"></iframe>
</NOSCRIPT> 

<script language="javascript">
<!--
var startTime,endTime;
var d=new Date();
startTime=d.getTime();
//网站系统参数
webname="<%=webname%>";
weburl="<%=weburl%>";
Webboss="<%=Webboss%>";
webemail="<%=webemail%>";
border="<%=border%>";
face="<%=face%>";
qq="<%=qq%>";
add="<%=replace(add,CHR(34),"&#34;")%>";
//-->
</script>

<script language="javascript" src=inc/fztt.js></script>
</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" <%=body%> >
	<DIV id=toolTipLayer style="POSITION: absolute; VISIBILITY: hidden"></DIV>
	<script language="javascript" src=inc/show.js></script>


<script language="javascript" src=skins/<%=Request.Cookies("face")%>/fztt.js></script>

<!--#include file="../counter.asp"-->
<%
sub left_t_1(left_1)
response.write "<table border=0 width=100% cellspacing=0 cellpadding=0><tr><td width=15 height=11><IMG SRC=skins/0/img/l01.gif WIDTH=15 HEIGHT=11></td><td background=skins/0/img/l02.gif></td></tr><tr><td background=skins/0/img/l04.gif></td><td bgcolor=#FFFFFF>"&left_1&"</td></tr><tr><td><IMG SRC=skins/0/img/l06.gif WIDTH=15 HEIGHT=15></td><td background=skins/0/img/l07.gif></td></tr></table>"
end sub
%>