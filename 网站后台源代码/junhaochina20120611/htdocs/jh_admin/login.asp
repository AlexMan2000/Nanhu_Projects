<!--#include file="conn.asp"-->
<!--#include file="Inc/config.asp"-->
<!--#include file="Inc/md5.asp"-->
<title><%=webname%>--管理登录--</title>
<%
dim founderr,errmsg
founderr=false
errmsg=""
dim adminname
dim adminpwd
if request("action")="adminlogin" then
      s1=Trim(Request.Form("s1"))
      s2=Request.Form("s2")
	  If s2<>s1 Then
	   	Response.Write("<script language=javascript>alert('请输入正确的认证码！');this.location.href='login.asp';</script>")
		Response.End
	  end if
      adminname=trim(replace(request("adminname"),"'",""))
      adminpwd=trim(replace(request("adminpwd"),"'",""))
      md5adminpwd=md5(adminpwd)
if adminname="" and adminpwd="" then
   founderr=true
   Response.Write("<script language=javascript>alert('请输入用户名或密码！');this.location.href='login.asp';</script>")
   Response.End
end if

if founderr then
call diserror
response.end
end if

sql="select * from admin where admin_name='"&adminname&"' and admin_password='"&md5adminpwd&"'"
set rs=conn.execute(sql)
if rs.eof and rs.bof then
   rs.close
   set rs=nothing
   founderr=true
   Response.Write("<script language=javascript>alert('您输入的用户名和密码不正确!！');this.location.href='login.asp';</script>")
   Response.End
else
   session("admin__user")=rs("admin_name")
   Session("BottleAdmin")=True
   session("adminlogin")=sessionvar
   session("adminname")=adminname
   session("level")=rs("membercode")
   session("issuper")=rs("admin_id")
   session.timeout=60
   rs.close
   set rs=nothing
   Response.write "<script>window.document.location.href='index.asp';</script>"
end if
elseif request("action")="logout" then
session("level")=""
session("adminlogin")=""
session("issuper")=""
session("adminname")=""
Session("BottleAdmin")=""
Response.write "<script>window.document.location.href=login.asp;</script>"
end if
if session("adminlogin")=sessionvar then
%>
<html>
<style type="text/css">
<!--
@import url("inc/adminstyle.css");
-->
</style>
<head>
<title>∷ 管理中心 ∷</title>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))><br><br><br> 
<script>if(top==self)top.location="index.asp" </script>
<table cellpadding="2" cellspacing="1" border="0" width="760" align=center class="a2">
<tr>
<td class="a1" colspan=2 height=25 align="center"><b>登陆成功提示!</b></td>
</tr>
<tr class=a3><td colspan=2 height=23>欢迎&nbsp;
  <%
if session("level")=5 then
Response.Write"站长&nbsp;"
 elseif session("level")=4 then
Response.Write"副站长&nbsp;"
 else 
Response.Write"普通管理员&nbsp;"
end if
%>
  <font style=behavior:url(inc/font.htc); font-family:宋体; font-size:9pt><%=session("adminname")%></font>&nbsp;进入后台管理！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr class=a4>
<td width="50%" height=23>服务器类型：<%=Request.ServerVariables("OS")%> ( IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
<td width="50%">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
</tr>
<tr class=a4>
<td width="50%" height=23>服务器软件的名称：<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
<%if session("level")=5 then%>
<td width="50%">数据库路径：<%=DBPath%></td>
<%else%>
<td width="50%">数据库路径：为了安全保密</td>
<%end if%>
</tr>
</table>
<br><br>

<%
else
dim s
randomize timer
s=Int((8999)*Rnd +1000)
%>
<HTML>
<HEAD>
<TITLE>管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
<LINK href="inc/style.css" type=text/css rel=stylesheet>
<style>
<!--
body { background-color: #ffffff; }
tr { background-color: #ffffff; }
.tr_val { background-color: #fdfdfd; }
.input_login
{
  border-right: #ffffff 0px solid; border-top: #ffffff 0px solid; font-size: 9pt;
  border-left: #ffffff 0px solid; border-bottom: #ffffff 0px solid; height: 16px;
}
.input_val
{
  border-right: #ffffff 0px solid; border-top: #ffffff 0px solid; font-size: 9pt;
  border-left: #ffffff 0px solid; border-bottom: #c0c0c0 1px solid; height: 16px;
  background-color: #fdfdfd;
}
-->
</style>
<body  onkeydown=return(!(event.keyCode==78&&event.ctrlKey))><br><br><br> 
<table border=0 width='100%'>
 <tr><td align=center>
<table border=0 cellspacing=0 cellpadding=0 width=526>
<form name="form1" method="post" action="login.asp?action=adminlogin" onSubmit="return xxg()">
<tr><td colspan=2><img src='img/al_top.gif' border=0></td></tr>
<tr><td colspan=2>
  <table border=0 cellspacing=0 cellpadding=0 width=526>
  <tr>
  <td width=155><img src='img/al_username.gif' border=0></td>
  <td width=105 background='img/al_body_bg.gif'><input type=text name=adminname value='' size=15 maxlength=20 class=input_login>
  </td>
  <td width=93><img src='img/al_password.gif' border=0></td>
  <td width=105 background='img/al_body_bg.gif'><input type=password name=adminpwd value='' size=15 maxlength=20 class=input_login onmouseover=this.focus()></td>
  <td width=68><img src='img/al_body_right.gif' border=0></td>
  </tr>
  </table>
</td></tr>
<tr><td colspan=2  >
  <table border=0 cellspacing=0 cellpadding=0 width=526>
  <tr>
  <td width=77><img src='img/al_end_left.gif' border=0></td>
  <td width=339>
    <table border=0 cellspacing=0 cellpadding=0 width=339>
    <tr>
                                <td height=49 background='img/al_end_bg.gif' align=center>
								 <TABLE border=0>
                                <TR class=tr_val>
                                <TD class=>验证码：</TD>
            <td class=a2 ><input class=input_val name="s1" type="text" size="14">
              &nbsp;<b><%=s%></b>
              <input maxlength=20 name="s2" size=12 type=hidden value="<%=s%>"></td></TR></table>								
                                </td>
                    </tr>

    <tr>
	<td><img src='img/al_end_end.gif' border=0></td>
	</tr>
    </table>
  </td>
  <td width=110><input  name="Submit" src="img/al_end_right.gif" border=0 type=image></td>
  </tr>
  </table>
</td></tr>
</form>
</table>
<%
htmlend
end if
%>