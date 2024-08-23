<!--#include file="inc/config.asp"-->
<!--#include file="conn.asp"-->
<LINK href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<%
dim founderr,errmsg
founderr=false
errmsg=""
if session("adminlogin")<>sessionvar then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>你尚未登录，或者超时了！请<a href='login.asp'>重新登录</a>！"
  call diserror()
else
  dim newscount,articlecount,softcount,piccount
  
  sql="select news_id from news"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,1
  newscount=rs.recordcount
  
  sql="select art_id from article"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,1
  articlecount=rs.recordcount
  
  sql="select soft_id from downsoft"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,1
  softcount=rs.recordcount
  
  sql="select pic_id from picture"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,1
  piccount=rs.recordcount
    
  sql="select * from allcount"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,3
  
  rs("newscount")=newscount
  rs("articlecount")=articlecount
  rs("softcount")=softcount
  rs("piccount")=piccount
  rs.update
  rs.close
  set rs=nothing
  close database
%>
<table cellpadding="1" cellspacing="1" border="0" width="760" align=center class="a2">
  <tr  class="a3">
    <td align="center" height="66">&gt;更新成功&lt;<br>
      <a href="javascript:" onclick="opener=null;window.close();">关闭窗口</a>
	</td>
  </tr>
</table>
<%end if%>