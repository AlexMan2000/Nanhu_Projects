<!--#include file="conn.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/md5.asp"-->
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
if request.form("MM_insert") then
if request.form("action")="modpass" then
dim adminname,oldpwd,adminpwd,confirm
adminname=trim(replace(request.form("adminname"),"'",""))
oldpwd=trim(replace(request.form("oldpwd"),"'",""))
adminpwd=trim(replace(request.form("adminpwd"),"'",""))
confirm=trim(replace(request.form("confirm"),"'",""))
md5oldpwd=md5(oldpwd)
md5adminpwd=md5(adminpwd)
if adminname="" then
  founderr=true
  response.Write"<script language=javascript>alert(' 你必须输入管理员名称 ！');javascript:history.back(-1);</script>"
  response.End
end if

if oldpwd="" then
  founderr=true
  response.Write"<script language=javascript>alert(' 你必须输入旧的管理员密码 ！');javascript:history.back(-1);</script>"
  response.End
end if

if adminpwd="" then
  founderr=true
  response.Write"<script language=javascript>alert(' 你必须输入新的管理员密码 ！');javascript:history.back(-1);</script>"
  response.End
end if

if adminpwd<>confirm then
  founderr=true
  response.Write"<script language=javascript>alert(' 你两次输入的管理员密码不相同 ！');javascript:history.back(-1);</script>"
  response.End
end if

if founderr then
  call diserror()
  response.end
else
sql="select * from admin where admin_name='"&adminname&"' and admin_password='"&md5oldpwd&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if rs.eof then
   response.Write"<script language=javascript>alert(' 管理员名称或密码错误 ！');javascript:history.back(-1);</script>"
   response.End
   call diserror()
   response.end
else
   rs("admin_password")=md5adminpwd
   rs.update
   rs.close
   set rs=nothing
   Response.write "<script>window.document.location.href=login.asp;</script>"
end if
end if
end if
if request.form("action")="newadmin" then
adminname=trim(replace(request.form("adminname"),"'",""))
adminpwd=trim(replace(request.form("adminpwd"),"'",""))
confirm=trim(replace(request.form("confirm"),"'",""))
membercode=trim(replace(request.form("level"),"'",""))
md5adminpwd=md5(adminpwd)
if adminname="" then
  founderr=true
 response.Write"<script language=javascript>alert(' 你必须输入管理员名称 ！');javascript:history.back(-1);</script>"
		response.End
end if
if adminpwd="" then
  founderr=true
response.Write"<script language=javascript>alert(' 你必须输入新的管理员密码 ！');javascript:history.back(-1);</script>"
		response.End
end if
if adminpwd<>confirm then
  founderr=true
  response.Write"<script language=javascript>alert(' 你两次输入的管理员密码不相同 ！');javascript:history.back(-1);</script>"
		response.End
end if
if founderr then
  call diserror()
  response.end
else
sql="select * from admin"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
rs("admin_name")=adminname
rs("admin_password")=md5adminpwd
rs("membercode")=membercode
rs.update
rs.close
set rs=nothing
response.redirect "manage.asp?action=admin"
end if
end if
if request.form("action")="editadmin" then
if request.Form("id")="" then
  founderr=true
response.Write"<script language=javascript>alert(' 你必须指定操作的对象！');javascript:history.back(-1);</script>"
		response.End

else
end if
adminname=trim(replace(request.form("adminname"),"'",""))
adminpwd=trim(replace(request.form("adminpwd"),"'",""))
confirm=trim(replace(request.form("confirm"),"'",""))
membercode=trim(replace(request.form("level"),"'",""))

if adminpwd<>"" then
md5adminpwd=md5(adminpwd)
end if
if adminname="" then
  founderr=true
 response.Write"<script language=javascript>alert(' 你必须输入管理员名称 ！');javascript:history.back(-1);</script>"
		response.End
end if


if founderr then
  call diserror()
  response.end
else
sql="select * from admin where admin_id="&request.form("id")
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs("admin_name")=adminname
if adminpwd<>"" and confirm<>"" and adminpwd=confirm then
rs("admin_password")=md5adminpwd
end if
rs("membercode")=membercode
rs.update
rs.close
set rs=nothing
response.redirect "manage.asp?action=admin"
end if
end if

if request.form("action")="deladmin" then
if request.Form("id")="" then
  founderr=true
  response.Write"<script language=javascript>alert(' 你必须指定操作的对象！');javascript:history.back(-1);</script>"
		response.End
else
end if
if founderr then
  call diserror()
  response.end
else
sql="select * from admin where admin_id="&request.form("id")
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.delete
rs.close
set rs=nothing
response.redirect "manage.asp?action=admin"
end if
end if
end if%>

<HTML><HEAD><TITLE>管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>

	  <%if request.querystring("action")="modpass" then %>
	  <table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form1" method="post" action="manage.asp">
          <tr> 
            <td  class="a1">
            <B>修改管理员密码</B></td>
          </tr>
          <tr class="a4"> 
            <td>管理员名称- <input type="text" name="adminname" size="30" value=<%=session("adminname")%>>
              
              旧密码- 
              <input type="password" name="oldpwd" size="30">
            </td>
          </tr>
          <tr class="a3"> 
            <td>新密码- 
              <input type="password" name="adminpwd" size="30">
              确认新密码- 
              <input type="password" name="confirm" size="30">
            </td>
          </tr>
          <tr  class="a4" align=center> 
            <td> 
              <input type="submit" name="Submit" value="确定修改">
              <input type="reset" name="Reset" value="清空重写">
            </td>
          </tr>
          <input type="hidden" name="action" value="modpass">
          <input type="hidden" name="MM_insert" value="true">
        </form>
      </table>
	  <%end if
if session("level")=5 then
if request.querystring("action")="admin" then
sql="select * from admin"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<br>
<br>
	  <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <tr> 
          <td colspan="3" class="a1">
         <%=rs("admin_name")%> <font color="#333333">管理员组</font></td>
        </tr>
        <tr align="center" class="a4"> 
          <td width="10%">编号</td>
          <td width="60%">管理员名称</td>
          <td width="30%">操作</td>
        </tr>
<%do while not rs.eof%>
        <tr class="a3"> 
          <td align="center"><%=rs("admin_id")%>　</td>
          <td><%=rs("admin_name")%>　</td>
          <td align="center" bgcolor="#FFFFFF">
<%if rs("issuper")<>1 then%>
            <a href="manage.asp?id=<%=rs("admin_id")%>&action=editadmin">edit</a> 
            <a href="manage.asp?id=<%=rs("admin_id")%>&action=deladmin">del</a> 
            <%end if%></td>
        </tr>
<%rs.movenext
loop%>
      </table>
      <br>
	  <br>
	  <table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form2" method="post" action="">
		<tr  class="a1"> 
          <td>
          <font color="#333333">新的管理员</font></td>
        </tr>
        <tr  class="a4"> 
            <td bgcolor="#FFFFFF">名称-
              <input type="text" name="adminname" size="30" class="textarea">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;组别-<select name="level"><option value="5">网站站长</option><option value="4">网站副站长</option><option value="3">普通管理员</option></select><br>
              密码- 
              <input type="password" name="adminpwd" size="30">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码- 
              <input type="password" name="confirm" size="30">
            </td>
        </tr>
        <tr  class="a3"> 
          <td bgcolor="#FFFFFF" height="30" align="center">
              <input type="submit" name="Submit" value="确定新增">
              <input type="reset" name="Reset" value="清空重填">
            </td>
        </tr>
		<input type="hidden" name="action" value="newadmin">
		<input type="hidden" name="MM_insert" value="true">
		</form>
      </table>
      <%end if

	  if request.querystring("action")="editadmin" then
	   if request.querystring("id")="" then
  response.Write"<script language=javascript>alert(' 你必须指定操作的对象！');javascript:history.back(-1);</script>"
		response.End
  call diserror()
  response.end
else
end if
sql="select * from admin where admin_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
membercode=rs("membercode")
%>
<br>
<br>
	  <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form2" method="post" action="">
          <tr  class="a1"> 
            <td>
            <font color="#333333">编辑管理员</font></td>
          </tr>
          <tr  class="a3"> 
            <td bgcolor="#FFFFFF">名称- 
              <input type="text" name="adminname" size="30" value="<%=rs("admin_name")%>">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%select case membercode
case "5"

response.write " 组别-<select name='level'><option value='5' selected>网站站长</option><option value='4'>网站副站长</option><option value='3'>普通管理员</option></select><br>"
case "4"

response.write "组别-<select name='level'><option value='5' >网站站长</option><option value='4' selected>网站副站长</option><option value='3'>普通管理员</option></select><br> "     
case "3"

response.write "组别-<select name='level'><option value='5' >网站站长</option><option value='4' >网站副站长</option><option value='3' selected>普通管理员</option></select><br> "
 
end select%>     
         
     
      
       


              密码- 
              <input type="password" name="adminpwd" size="30" value="">--密码不改请留空！
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码- 
              <input type="password" name="confirm" size="30" value="">--密码不改请留空！
            </td>
          </tr>
          <tr  class="a4"> 
            <td bgcolor="#F5F5F5" height="30" align="center"> 
              <input type="submit" name="Submit" value="确定修改">
              <input type="reset" name="Reset" value="清空重填">
            </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("admin_id")%>">
          <input type="hidden" name="action" value="editadmin">
          <input type="hidden" name="MM_insert" value="true">
        </form>
      </table>
	  <%rs.close
	  set rs=nothing
	  end if

	  if request.querystring("action")="deladmin" then
	   if request.querystring("id")="" then
  response.Write"<script language=javascript>alert(' 你必须指定操作的对象！');javascript:history.back(-1);</script>"
		response.End
  call diserror()
  response.end
else
 
end if
sql="select * from admin where admin_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
	  <br>
	  <br>
	  <table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form2" method="post" action="">
          <tr  class="a1"> 
            <td>
            <font color="#333333">删除管理员</font></td>
          </tr>
          <tr  class="a3"> 
            <td>名称- <%=rs("admin_name")%>
              &nbsp;&nbsp;<br>
            </td>
          </tr>
          <tr  class="a4"> 
            <td height="30" align="center"> 
              <input type="submit" name="Submit" value="确定删除">
              [<a href="manage.asp?action=admin">返回</a>] </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("admin_id")%>">
          <input type="hidden" name="action" value="deladmin">
          <input type="hidden" name="MM_insert" value="true">
        </form>
      </table>
	  <%rs.close
	  set rs=nothing
	  end if%>
      <br>
    </td>
  </tr>
</table>
<%end if
end if
%>
