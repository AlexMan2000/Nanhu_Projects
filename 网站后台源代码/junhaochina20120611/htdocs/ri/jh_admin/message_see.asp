<!--#include file="inc/config.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="inc/format.asp"-->
<%
dim founderr,errmsg
founderr=false
errmsg=""
if session("adminlogin")<>sessionvar then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>你尚未登录，或者超时了！请<a href='login.asp'>重新登录</a>！"
  call diserror()
  response.end
else
if request("action")="del" then
	id=request("id")
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from [book] where id="& id
	rs.open sql,conn,1,3
	if not rs.eof then
		rs.delete
	end if
	rs.close
	set rs=nothing
	response.Redirect("message_see.asp")
end if
%>
<HTML><HEAD><TITLE>管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>
<%
sql="select * from book order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <tr> 
          <td colspan="8" class="a1">留言管理</font></td>
        </tr>
        <tr align="center" class="a4"> 
          <td width="10%">留言日期</td>
          <td width="13%">公司名称</td>
		  <td width="11%">联系电话</td>
		  <td width="17%">Emial</td>
		  <td width="44%">留言内容</td>
          <td colspan="2">操作</td>
        </tr>
        <%do while not rs.eof%>
        <tr class="a3"> 
          <td align="center" valign="middle"><%=rs("b_date")%></td>
          <td align="center" valign="middle"><%=rs("b_compay")%></a></td>
		  <td align="center" valign="middle"><%=rs("b_tel")%></a></td>
		  <td align="center" valign="middle"><%=rs("b_email")%></a></td>
		  <td align="center" valign="middle"><%=rs("b_content")%></a></td>
          <td width="5%" align="center"><a href="?id=<%=rs("id")%>&action=del">删除</a></td>
        </tr>
        <%rs.movenext
loop
if rs.bof and rs.eof then%>
        <tr align="center" class="a3"> 
          <td colspan="8">当前没有<span class="a1">留言</span>！</td>
        </tr>
        <%end if%>
</table>
<%
rs.close
set rs=nothing
end if
%>