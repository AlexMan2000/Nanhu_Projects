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
  
dim totalart,Currentpage,totalpages,i,colname
colname=request("colname")
keyword=trim(replace(request.form("keyword"),"'",""))
sql="select * from tutorial6 order by art_px asc,art_id DESC"


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
    <tr class="a1"> 
          <td colspan="3">链接管理</td>
  </tr>
<tr>
           <td width="383"  class="a1">
          <table width=250 border=0>
              <form name="form" method="post" action="manage_tutorial6.asp">
              <tr><td align='center' >
                    <select name="select">
                      <option value="0" selected>-搜索范围-</option>
                      <option value="art_title">文章名称</option>
                      <option value="art_content">文章内容</option>
                    </select></td><td>
                    <input type="text" name="keyword" class="textarea" size="12" maxlength='30' onblur='if (value ==""){value="输入关键字"}' 
      onfocus='if (value =="输入关键字"){value =""}' value=输入关键字>
                    <input type="submit" name="Submit" value="搜索" class="button">
                    </td></tr></form>
			</table>
    </td>
                  
          <form name="form2" method="post" action=""><td width="358" colspan="2" align="center" bgcolor="#E8E8E8"  class="a1">
             
                        </td>
		</form></tr></table>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">

            <tr align="center" class="a4"> 
          <td width="10%">编号</td>
          <td width="60%">链接标题</td>
          <td width="20%">操作</td>
        </tr>
<%if not rs.eof then
rs.movefirst
rs.pagesize=articleperpage
if trim(request("page"))<>"" then
   currentpage=clng(request("page"))
   if currentpage>rs.pagecount then
      currentpage=rs.pagecount
   end if
else
   currentpage=1
end if
   totalart=rs.recordcount
   if currentpage<>1 then
      if(currentpage-1)*articleperpage<totalart then
	     rs.move(currentpage-1)*articleperpage
		 dim bookmark
		 bookmark=rs.bookmark
	  end if
   end if
   if (totalart mod articleperpage)=0 then
      totalpages=totalart\articleperpage
   else
      totalpages=totalart\articleperpage+1
   end if
   i=0
do while not rs.eof and i<articleperpage%>
        <tr class="a3"> 
          <td align="center"><%=rs("art_id")%>　</td>
          <td><%=rs("art_title")%>　</td>
          <td align="center">
		  <a href="new_tutorial6.asp?art_id=<%=rs("art_id")%>&action=editart">编辑</a> 
          <a href="new_tutorial6.asp?art_id=<%=rs("art_id")%>&action=delart">删除</a> 
		  </td>
        </tr>
<%
i=i+1
rs.movenext
loop
else
if rs.eof and rs.bof then
%>
        <tr align="center" class="a3"> 
          <td colspan="4">当前没有链接！</td>
        </tr>
<%end if
end if%>
      </table>
<table cellspacing="1" border="0" width="760" cellpadding="4" align="center">
        <form name="form1" method="post" action="manage_tutorial6.asp">
          <tr> 
            <td align="right"><%=currentpage%> /<%=totalpages%>页,<%=totalart%>条记录/<%=articleperpage%>篇每页. 
              <%
i=1
showye=totalpages
if showye>10 then
showye=10
end if
for i=1 to showye
if i=currentpage then
%>
              <%=i%> 
              <%else%>
              <a href="manage_tutorial6.asp?page=<%=i%>"><%=i%></a> 
              <%end if
next
if totalpages>currentpage then
if request("page")="" then
page=1
else
page=request("page")+1
end if%>
              <a href="manage_tutorial6.asp?page=<%=page%>" title="下一页">>></a> 
              <%end if%>
              &nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="text" name="page" class="textarea" size="4">
              <input type="submit" name="Submit" value="Go" class="button">
            </td>
          </tr>
        </form>
      </table>
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