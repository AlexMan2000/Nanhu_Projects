<!--#include file="inc/config.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="inc/format.asp"-->
<!--#include file="inc/ubbshow.asp"-->
<!--#include file="inc/ubbart.asp"-->
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

if request.form("MM_insert") then
if request.Form("action")="newart" then
openarticle
sql="select * from tutorial"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
dim poster,artfrom,title,keyword,content,catid
title=trim(replace(request.form("art_title"),"'",""))
pic=trim(replace(request.form("excel_file"),"'",""))
tuijian=trim(replace(request.form("tuijian"),"'",""))
catid=cint(request.form("cat_id"))
content=request("content")
content1=request("content1")
if catid<1 then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������дͼƬ�ķ��࣡"
else
  rs("cat_id")=catid
end if
if title="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������дͼƬ�ı��⣡"
else
  rs("art_title")=title
end if
if tuijian="1" then
	rs("art_tuijian")=tuijian
	if pic="" then
  		founderr=true
  		errmsg=errmsg+"<br>"+"<li>�������дͼƬ�ĵ�ַ��"
	else
  		rs("art_pic")=pic
	end if
	if content1="" then
  		founderr=true
  		errmsg=errmsg+"<br>"+"<li>�������д���ӵĵ�ַ��"
	else
  		rs("art_content1")=content1
	end if
end if
if content="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д���ӵĵ�ַ��"
else
  rs("art_content")=content
end if

if founderr then
  call diserror()
  response.end
else
  rs.update
  rs.close
  set rs=nothing
  sql="update allcount set articlecount = articlecount + 1"
  conn.execute(sql)
  closedatabase
  response.redirect "manage_tutorial.asp"
end if
end if

if request.Form("action")="editart" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from tutorial where art_id="&cint(request.Form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
content=request("content")
if content="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д���ӵĵ�ַ��"
else
  rs("art_content")=content
end if
if founderr then
  call diserror()
  response.end
else
  rs.update
  rs.close
  set rs=nothing
  response.redirect "new_tutorial.asp?action=editart&art_id="&request("id")&""
end if
end if
if request.Form("action")="delart" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from tutorial where art_id="&cint(request.Form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  set rs=nothing
  openadmin
  sql="update allcount set articlecount = articlecount - 1"
  conn.execute(sql)
  closedatabase
  response.redirect "manage_tutorial.asp"
end if
end if
%>
<HTML><HEAD><TITLE>��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>
	  <%if request.QueryString("action")="newart" then%>
<table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="addart" method="post" action="">
          <tr class="a1"> 
            <td colspan="2">��������</td>
          </tr>
		  <tr class="a3"> 
            <td colspan="2"><div id="piccontent" style="display:none">���¼��- 
           <textarea name="content1" cols="120" rows="6"><%=rs("art_content1")%></textarea></div></td>
          </tr>
		  <tr class="a4"> 
            <td colspan="2"><textarea name="content" style="display:none" cols="1" rows="1"><%if content<>"" then response.write content%></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>
          <tr class="a3"> 
            <td height="30" colspan="2" align="center" bgcolor="#E8E8E8"><input type="submit" name="Submit2" value="ȷ������" class="button">
              <input type="reset" name="Reset" value="�����д" class="button">
            [<a href="manage_tutorial.asp">����</a>] </td>
          </tr>
		  <input type="hidden" name="action" value="newart">
		  <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="editart" then
if request.querystring("art_id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("art_id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from tutorial where art_id="&cint(request.querystring("art_id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
content=rs("art_content")
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="addart" method="post" action="">
          <tr class="a1"> 
            <td class="diaryhead" colspan="2"><%=rs("art_title")%></td>
          </tr>
		  <tr class="a4"> 
            <td colspan="2"><textarea name="content" style="display:none" cols="1" rows="1"><%if content<>"" then response.write content%></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>
          <tr class="a4"> 
            <td height="30" align="center" colspan="2"> <input name="Submit" type="submit" id="Submit" value="ȷ���޸�" class="button"> 
              <input name="Reset" type="reset" id="Reset" value="�����д" class="button">
              [<a href="manage_tutorial.asp">����</a>] </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("art_id")%>">
		  <input type="hidden" name="action" value="editart">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  	  if request.QueryString("action")="delart" then
if request.querystring("art_id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("art_id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������ID������"
	call diserror()
	response.end
  end if
end if
if request.querystring("cat_id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("cat_id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ�������ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from tutorial where art_id="&cint(request.querystring("art_id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <form name="addart" method="post" action="">
          <tr class="a1"> 
            <td class="diaryhead">ɾ��ͼƬ</td>
          </tr>
          <tr class="a4"> 
            <td>����- <%=rs("art_title")%> 
            </td>
          </tr>
          <tr class="a3"> 
            <td bgcolor="#E8E8E8" height="30" align="center"> <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��" class="button">
              [<a href="manage_tutorial.asp">����</a>] </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("art_id")%>">
          <input type="hidden" name="action" value="delart">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <%end if%>
      <br>
	  <br>
    </td>
  </tr>
  <tr> 
    <td colspan="3" height="1" background="images/dotlineh.gif"></td>
  </tr>
</table>
<%
end if
%>