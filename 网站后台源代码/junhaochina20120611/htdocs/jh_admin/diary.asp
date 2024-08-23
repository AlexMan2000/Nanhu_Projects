<!--#include file="conn.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/format.asp"-->
<!--#include file="inc/ubbdiary.asp"-->
<!--#include file="inc/ubbshow.asp"-->
<title><%=webname%>-公告管理</title>
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

if Request.form("MM_insert") then

if request.form("action")="newdiary" then
sql="select * from diary"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
dim d_content
dim d_title
d_title=trim(request.form("d_title"))
d_content=trim(request.form("content"))
  rs("d_content")=d_content
  rs("d_px")=request("d_px")
if d_title="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>你必须输入日记内容！"
else
  rs("d_title")=d_title
end if
if not founderr then
rs.update
rs.close
set rs=nothing
  sql="update allcount set diarycount = diarycount + 1"
  conn.execute(sql)
  closedatabase
response.redirect "diary.asp"
else
call diserror()
response.end
end if
end if
if request.form("action")="editdiary" then
 if request.form("id")="" then
   founderr=true
   errmsg=errmsg+"<br>"+"<li>你必须指定操作的对象！"
 else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>非法的日记id参数。"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from diary where d_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
d_title=trim(request.form("d_title"))
d_content=trim(request.form("content"))
if d_title="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>你必须输入标题！"
else
  rs("d_title")=d_title
end if
  rs("d_content")=d_content
  rs("d_px")=request("d_px")
if not founderr then
rs.update
rs.close
set rs=nothing
response.redirect "diary.asp"
else
call diserror()
response.end
end if
end if
if request.form("action")="deldiary" then
 if request.form("id")="" then
   founderr=true
   errmsg=errmsg+"<br>"+"<li>你必须指定操作的对象！"
 else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>非法的日记id参数。"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from diary where d_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if not founderr then
rs.delete
rs.close
set rs=nothing
  sql="update allcount set diarycount = diarycount - 1"
  conn.execute(sql)
  closedatabase
response.redirect "diary.asp"
else
call diserror()
response.end
end if
end if
end if
dim totaldiary,adperpage,Currentpage,totalpages,i
adperpage=10
sql="select * from diary order by d_px asc,d_id DESC"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<HTML><HEAD><TITLE>管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>
	  <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <tr> 
          <td colspan="4"  class="a1">
              文章管理
          </td>
        </tr>
        <tr align="center"  class="a4"> 
          <td width="10%">编号</td>
          <td width="73%">文章标题</td>
          <td width="17%">操作</td>
        </tr>
        <%if not rs.eof then
rs.Movefirst
rs.pagesize=adperpage
if trim(request("page"))<>"" then
    currentpage=clng(request("page"))
	if currentpage>rs.pagecount then
	   currentpage=rs.pagecount
	end if
else
    currentpage=1
end if
    totaldiary=rs.recordcount
	if currentpage<>1 then
	   if(currentpage-1)*adperpage<totaldiary then
	      rs.move(currentpage-1)*adperpage
		  dim bookmark
		  bookmark=rs.bookmark
	   end if
	end if
	if (totaldiary mod adperpage)=0 then
	   totalpages=totaldiary\adperpage
	else
	   totalpages=totaldiary\adperpage+1
	end if
i=0
do while not rs.eof and i<adperpage
%>
        <tr class="a3"> 
          <td align="center"><%=rs("d_id")%>　</td>
          <td><%=rs("d_title")%></td>
          <td align="center"><a href="diary.asp?id=<%=rs("d_id")%>&action=editdiary#editdiary">编辑</a> 
            <a href="diary.asp?id=<%=rs("d_id")%>&action=deldiary#deldiary">删除</a></td>
        </tr>
        <%i=i+1
rs.movenext
loop
else
If rs.EOF And rs.BOF Then%>
        <tr class="a3"> 
          <td colspan=4 align="center">当前还没有文章！</td>
        </tr>
        <%end if
end if%>
      </table>
      <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form2" method="post" action="diary.asp">
          <tr> 
            <td align="right"><%=currentpage%>/<%=totalpages%>页,<%=totaldiary%>条记录/<%=adperpage%>篇每页. 
              <%
i=1
dy10=false
showye=totalpages
if showye>10 then
dy10=true
showye=10
end if
for i=1 to showye
if i=currentpage then
%>
              <%=i%> 
              <%else%>
              <a href="diary.asp?page=<%=i%>"><%=i%></a> 
              <%end if
next
if totalpages>currentpage then
if request("page")="" then
page=1
else
page=request("page")+1
end if%>
              <a href="diary.asp?page=<%=page%>" title="下一页">>></a>
              <%end if%>
            </td>
          </tr>
        </form>
</table>
      <br>
	  <br>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
      <%if request.querystring("action")="newdiary" then%>
        <form name="form1" method="post" action="<%=MM_editAction%>">
          <tr class="a1"> 
            <td>
          <a name="newdiary">文章添加</a></td>
          </tr>
		  <tr class="a4"> 
            <td>文章标题- 
              <input type="text" name="d_title" size="60"></td>
          </tr>
		  <tr class="a4"> 
            <td>排列顺序- 
              <input type="text" name="d_px" size="30" onKeyUp="value=value.replace(/[^(\d-)]/g,'')"> *只限填写数字</td>
          </tr>
          <tr  class="a3"> 
            <td> 
              <textarea name="content" style="display:none" cols="1" rows="1"></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe>
            </td>
          </tr>
          <tr> 
            <td class="a4" align="center" height="30"> 
              <input type="submit" name="Submit" value="确定新增">
              <input type="reset" name="Reset" value="清空重写">
            </td>
          </tr>
          <input type="hidden" name="action" value="newdiary">
          <input type="hidden" name="MM_insert" value="true">
        </form>
		<%end if%>
</table>
	<br>
	<br>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
<%
if request.querystring("action")="editdiary" then
if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>请指定操作的对象！"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>非法的公告ID参数！"
	call diserror()
	response.end
  end if
end if
sql="select * from diary where d_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
content=rs("d_content")
	  %>
 <form name="form1" method="post" action="<%=MM_editAction%>">
          <tr class="a1"> 
            <td>
<a name="editdiary">修改文章</a></td>
          </tr>
		  <tr class="a4"> 
            <td>文章标题- 
              <input type="text" name="d_title" size="60" value="<%=rs("d_title")%>"></td>
          </tr>
		  <tr class="a4"> 
            <td>排列顺序- 
              <input type="text" name="d_px" size="30" onKeyUp="value=value.replace(/[^(\d-)]/g,'')" value="<%=rs("d_px")%>"> *只限填写数字</td>
          </tr>
          <tr class="a3"> 
            <td><textarea name="content" style="display:none" cols="1" rows="1"><%if content<>"" then response.write content%></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>
          <tr class="a3"> 
            <td class="a4" align="center" height="30"> 
              <input type="submit" name="Submit" value="确定修改">
              <input type="reset" name="Reset" value="清空重写">
			  [<a href="diary.asp">返回</a>]            </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("d_id")%>">
          <input type="hidden" name="action" value="editdiary">
          <input type="hidden" name="MM_insert" value="true">
  </form>
		<%end if%>
</table>
	  <br>
	  <br>
<table  cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
<%
if request.querystring("action")="deldiary" then
if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>请指定操作的对象！"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>非法的日记ID参数！"
	call diserror()
	response.end
  end if
end if
sql="select * from diary where d_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
 
        <form name="form1" method="post" action="<%=MM_editAction%>">
          <tr> 
            <td class="a1">
<a name="deldiary">删除文章</a></td>
          </tr>
          <tr class="a3"> 
            <td><%=ubb2html(formatStr(autourl(rs("d_title"))), true, true)%>
			</td>
          </tr>
          <tr  class="a4"> 
            <td align="center" height="30"> 
              <input type="submit" name="Submit" value="确定删除">
              [<a href="diary.asp">返回</a>] </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("d_id")%>">
          <input type="hidden" name="action" value="deldiary">
          <input type="hidden" name="MM_insert" value="true">
        </form>
		<%end if%>
</table>
       <br>
    </td>
  </tr>
</table>
<%
rs.close
set rs=nothing
Close Database
end if
%>