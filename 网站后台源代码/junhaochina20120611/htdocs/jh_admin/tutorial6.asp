<!--#include file="inc/config.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="inc/format.asp"-->
<%
dim founderr,errmsg
founderr=false
errmsg=""
if session("adminlogin")<>sessionvar then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>����δ��¼�����߳�ʱ�ˣ���<a href='login.asp'>���µ�¼</a>��"
  call diserror()
  response.end
else
if Request.form("MM_insert") then
if request.Form("action")="newartcat" then
sql="select * from tutorialsort6"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
dim cat_name
cat_name=trim(replace(request.form("cat_name"),"'",""))
cat_px=cint(request("cat_px"))
if cat_name="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д���·������ƣ�"
else
  rs("cat_name")=cat_name
end if
  rs("cat_px")=cat_px
if founderr then
  call diserror()
  response.end
else
  rs.update
  rs.close
  set rs=nothing
  response.redirect "tutorial6.asp"
end if
end if
if request.Form("action")="editartcat" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ������·���id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from tutorialsort6 where cat_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
cat_name=trim(replace(request.form("cat_name"),"'",""))
cat_px=cint(request("cat_px"))
if cat_name="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д���·������ƣ�"
else
  rs("cat_name")=cat_name
end if
  rs("cat_px")=cat_px
if founderr then
  call diserror()
  response.end
else
  rs.update
  rs.close
  set rs=nothing
  response.redirect "tutorial6.asp"
end if
end if
if request.Form("action")="delartcat" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ������·���id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from tutorialsort6 where cat_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  set rs=nothing
  response.redirect "tutorial6.asp"
end if
end if
sql="select * from tutorialsort6 order by cat_px aSC"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<HTML><HEAD><TITLE>��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <tr> 
          <td colspan="4" class="a1">�������</font></td>
        </tr>
        <tr align="center" class="a4"> 
          <td width="10%">���</td>
          <td width="69%">��������</td>
          <td width="21%">����</td>
        </tr>
        <%do while not rs.eof%>
        <tr class="a3"> 
          <td align="center"><%=rs("cat_id")%>��</td>
          <td ><%=rs("cat_name")%>��</td>
          <td align="center"><a href="tutorial6.asp?id=<%=rs("cat_id")%>&action=editartcat">edit</a> 
            <a href="tutorial6.asp?id=<%=rs("cat_id")%>&action=delartcat">del</a> 
            </td>
        </tr>
        <%rs.movenext
loop
if rs.bof and rs.eof then%>
        <tr align="center" class="a3"> 
          <td colspan="4">��ǰû�����·��࣡</td>
        </tr>
        <%end if%>
      </table>
      <br>
	  <%if request.QueryString("action")="newartcat" then%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form1" method="post" action="tutorial6.asp">
		<tr class="a1"> 
            <td>��������</td>
        </tr>
        <tr class="a3"> 
          <td>��������-
              <input type="text" name="cat_name" size="40">
          </td>
        </tr>
		<tr class="a4"> 
            <td>����˳��-
              <input name="cat_px" type="text" id="cat_px" size="40" value="" onKeyUp="value=value.replace(/[^(\d-)]/g,'');"></td>
          </tr>
        <tr class="a4"> 
            <td align="center" height="30">
              <input type="submit" name="Submit" value="ȷ������">
              <input type="reset" name="reset" value="�����д">
              [<a href="tutorial6.asp">����</a>] </td>
        </tr>
		<input type="hidden" name="action" value="newartcat">
		<input type="hidden" name="MM_insert" value="true">
		</form>
      </table>
	  <%end if
	  if request.QueryString("action")="editartcat" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from tutorialsort6 where cat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form1" method="post" action="tutorial6.asp">
          <tr class="a1"> 
            <td>�޸ķ���</td>
          </tr>
          <tr class="a3"> 
            <td>��������- 
              <input name="cat_name" type="text" id="cat_name" size="40" value="<%=rs("cat_name")%>"> 
            </td>
          </tr>
		  <tr class="a4"> 
            <td>����˳��-
              <input name="cat_px" type="text" id="cat_px" size="40" value="<%=rs("cat_px")%>" onKeyUp="value=value.replace(/[^(\d-)]/g,'');"></td>
          </tr>
          <tr class="a4"> 
            <td align="center" height="30"> <input name="Submit" type="submit" id="Submit" value="ȷ���޸�"> 
              <input name="reset" type="reset" id="reset" value="�����д">
              [<a href="tutorial6.asp">����</a>] </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("cat_id")%>">
		  <input type="hidden" name="action" value="editartcat">
          <input type="hidden" name="MM_insert" value="true">
        </form>
      </table>
	  <%end if
	  	  if request.QueryString("action")="delartcat" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from tutorialsort6 where cat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="form1" method="post" action="tutorial6.asp">
          <tr class="a1"> 
            <td>ɾ������</td>
          </tr>
          <tr class="a3"> 
            <td>��������- <%=rs("cat_name")%>
            </td>
          </tr>
          <tr class="a4"> 
            <td align="center" height="30"> <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��">
              [<a href="tutorial6.asp">����</a>] </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("cat_id")%>">
          <input type="hidden" name="action" value="delartcat">
          <input type="hidden" name="MM_insert" value="true">
        </form>
      </table>
	  <%end if%>
      <br>
    </td>
  </tr>
</table>
<%
rs.close
set rs=nothing
close database
end if
%>