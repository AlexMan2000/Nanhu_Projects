<!--#include file="inc/config.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="inc/format.asp"-->
<title><%=webname%>ͼƬ����</title>
<%
dim founderr,errmsg
founderr=false
errmsg=""
if session("adminlogin")<>sessionvar then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>����δ��¼�����߳�ʱ�ˣ���<a href='admin.asp'>���µ�¼</a>��"
  call diserror()
  response.end
else
   if request.form("MM_insert") then
   if request.form("action")="newpiccat" then
   sql="select * from picturesort"
   set rs=server.createobject("adodb.recordset")
   rs.open sql,conn,1,3
   rs.addnew
   	  id=request("id")
      piccatname=trim(replace(request.form("piccat_name"),"'",""))
   if piccatname="" then
      founderr=true
      errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
   else
       rs("piccat_name")=piccatname
   end if
   rs("cat_id")=id
   rs("piccat_px")=request("piccat_px")
   if founderr then
      call diserror()
      response.end
   else
       rs.update
       rs.close
       set rs=nothing
       response.redirect "picture.asp?action=piccat"
   end if

elseif request.form("action")="newpiccat1" then
   sql="select * from picturesort1"
   set rs=server.createobject("adodb.recordset")
   rs.open sql,conn,1,3
   rs.addnew
   	  id=request("id")
	  id1=request("id1")
      piccatname1=trim(replace(request.form("piccat_name"),"'",""))
   if piccatname1="" then
      founderr=true
      errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
   else
       rs("piccat_name1")=piccatname1
   end if
   if id="" then
      founderr=true
      errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
   else
       rs("piccat_id1")=id
   end if
   	   rs("cat_id")=id1
	   rs("piccat_px")=request("piccat_px")
	   rs("piccat_pic")=request("excel_file")
	   'rs("piccat_content")=request("content")
   if founderr then
      call diserror()
      response.end
   else
       rs.update
       rs.close
       set rs=nothing
       response.redirect "picture.asp?action=piccat"
   end if 
      
elseif request.form("action")="newpiccat2" then
   sql="select * from picturesort2"
   set rs=server.createobject("adodb.recordset")
   rs.open sql,conn,1,3
   rs.addnew
      piccatname1=trim(replace(request.form("piccat_name"),"'",""))
   if piccatname1="" then
      founderr=true
      errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
   else
       rs("piccat_name")=piccatname1
   end if
	   rs("piccat_px")=request("piccat_px")
   if founderr then
      call diserror()
      response.end
   else
       rs.update
       rs.close
       set rs=nothing
       response.redirect "picture.asp?action=piccat"
   end if 
   
elseif request.form("action")="newpic" then
sql="select * from picture"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
piccatid=cint(request.form("piccatid"))
picname=trim(replace(request.form("pic_name"),"'",""))
picpic1=trim(request.form("excel_file1"))
rs("pic_name")=picname
if piccatid<1 then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ѡ���������࣡"
else
  rs("piccat_id1")=piccatid
end if
set rst=server.CreateObject("adodb.recordset")
sql1="select * from picturesort1 where id="& piccatid
rst.open sql1,conn,1,1
if not rst.eof then
	rs("cat_id")=rst("cat_id")
	rs("piccat_id")=rst("piccat_id1")
end if
rst.close
set rst=nothing
rs("pic_pic1")=picpic1
rs("pic_content")=request("content")
rs("pic_desc")=request("content1")
rs("pic_px")=request("pic_px")
if founderr then
  call diserror()
  response.end
else
  rs.update
  rs.close
  set rs=nothing
  sql="update allcount set piccount = piccount + 1"
  conn.execute(sql)
  closedatabase
  response.redirect "picture.asp?action=pic"
end if

elseif request.form("action")="editpic" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վid������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if

sql="select * from picture where pic_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
piccatid=cint(request.form("piccatid"))
picname=trim(replace(request.form("pic_name"),"'",""))
picpic1=trim(request.form("excel_file1"))
rs("pic_name")=picname
if piccatid<1 then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ѡ���������࣡"
else
  rs("piccat_id1")=piccatid
end if
set rst=server.CreateObject("adodb.recordset")
sql1="select * from picturesort1 where id="& piccatid
rst.open sql1,conn,1,1
if not rst.eof then
	rs("cat_id")=rst("cat_id")
	rs("piccat_id")=rst("piccat_id1")
end if
rst.close
set rst=nothing
rs("pic_pic1")=picpic1
rs("pic_content")=request("content")
rs("pic_desc")=request("content1")
rs("pic_px")=request("pic_px")
rs.update
rs.close
set rs=nothing
response.redirect "picture.asp?action=pic"

elseif request.form("action")="delpic" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վid������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picture where pic_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  sql="update allcount set piccount = piccount - 1"
  conn.execute(sql)
  close database
  response.redirect "picture.asp?action=pic"
  
  
elseif request.form("action")="editpiccat1" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort1 where id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
piccatname=trim(replace(request.form("piccat_name"),"'",""))
if piccatname="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
else
  rs("piccat_name1")=piccatname
end if
  rs("piccat_pic")=request("excel_file")
   'rs("piccat_content")=request("content")
   rs("piccat_px")=request("piccat_px")
rs.update
rs.close
set rs=nothing
response.redirect "picture.asp?action=piccat" 
  

elseif request.form("action")="editpiccat2" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort2 where piccat_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
piccatname=trim(replace(request.form("piccat_name"),"'",""))
if piccatname="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
else
  rs("piccat_name")=piccatname
end if
  rs("piccat_px")=request("piccat_px")
rs.update
rs.close
set rs=nothing
response.redirect "picture.asp?action=piccat"

elseif request.form("action")="editpiccat" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort where piccat_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
piccatname=trim(replace(request.form("piccat_name"),"'",""))
if piccatname="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
else
  rs("piccat_name")=piccatname
end if
if piccatpic="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�������д�������ƣ�"
else
  rs("piccat_pic")=piccatpic
end if
rs("piccat_px")=request("piccat_px")
rs.update
rs.close
set rs=nothing
response.redirect "picture.asp?action=piccat"

elseif request.form("action")="delpiccat" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort where piccat_id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  set rs=nothing
  response.redirect "picture.asp?action=piccat"
  
elseif request.form("action")="delpiccat1" then
if request.Form("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request.form("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort1 where id="&cint(request.form("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  set rs=nothing
  response.redirect "picture.asp?action=piccat"
  
elseif request.form("action")="delpiccat2" then
if request("id")="" then
  founderr=true
  errmsg=errmsg+"<br>"+"<li>�����ָ�������Ķ���"
else
  if not isInteger(request("id")) then
    founderr=true
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����id������"
  end if
end if
if founderr then
  call diserror()
  response.End
end if
sql="select * from picturesort2 where piccat_id="& cint(request("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
  rs.delete
  rs.close
  set rs=nothing
  response.redirect "picture.asp?action=piccat"
  
end if
end if
%>
<script language="javascript">
function showpiccat(sid)
{
whichEl = eval("piccatid" + sid);
if (whichEl.style.display == "none")
{
eval("piccatid" + sid + ".style.display=\"\";");
}
else
{
eval("piccatid" + sid + ".style.display=\"none\";");
}
}
</script>
<HTML>
<HEAD><TITLE>��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="inc/adminstyle.css" type=text/css rel=StyleSheet>
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
</HEAD>
<body onkeydown=return(!(event.keyCode==78&&event.ctrlKey))>
     <p>
       <%if request.querystring("action")="piccat" then
sql2="select * from picturesort2 order by piccat_px asc,piccat_id desc"
set rst=server.createobject("adodb.recordset")
rst.open sql2,conn,1,1
ii=0
%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
		<tr class="a1">
          <td width="80%">��������</td>
          <td width="20%">����</td>
        </tr>
		<%do while not rst.eof%>
		<tr class="a4"> 
          <td><%=rst("piccat_name")%>&nbsp;&nbsp;<a href="picture.asp?action=newpiccat&piccat_id=<%=rst("piccat_id")%>">[��Ӷ���Ŀ¼]</a>
		  ��</td>
          <td align="center" valign="top"><a href="picture.asp?id=<%=rst("piccat_id")%>&action=editpiccat2">�༭</a> 
            <a href="picture.asp?id=<%=rst("piccat_id")%>&action=delpiccat2">ɾ��</a></td>
        </tr>
        <%
			sql="select * from picturesort where cat_id="&rst("piccat_id")&" order by piccat_px asc,piccat_id desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
			do while not rs.eof
			ii=ii+1
		%>
        <tr class="a3"> 
          <td onClick="showpiccat('<%=ii%>')">&nbsp;&nbsp;&nbsp;&nbsp;|-<%=rs("piccat_name")%>&nbsp;&nbsp;<a href="picture.asp?action=newpiccat1&piccat_id=<%=rs("piccat_id")%>&cat_id=<%=rst("piccat_id")%>">[�������Ŀ¼]</a>
		  ��</td>
          <td align="center" valign="top"><a href="picture.asp?id=<%=rs("piccat_id")%>&action=editpiccat">�༭</a> 
            <a href="picture.asp?id=<%=rs("piccat_id")%>&action=delpiccat">ɾ��</a></td>
        </tr>
		<tr class="a4"> 
          <td colspan="2">
		<div id="piccatid<%=ii%>">
		
		  <table width="100%" cellpadding="0" cellspacing="1" border="0">
		<%
			  id=rs("piccat_id")
			  set rs1=server.CreateObject("ADODB.RECORDSET")
			  sql1="select * from picturesort1 where piccat_id1="&id&" order by piccat_px asc,id desc"
			  rs1.open sql1,conn,1,1
			  do while not rs1.eof
			%>
				<tr class="a4"> 
          <td width="81%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-<%=rs1("piccat_name1")%>
				</td><td width="19%" align="center"><a href="picture.asp?id=<%=rs1("id")%>&action=editpiccat1">�༭</a> 
            <a href="picture.asp?id=<%=rs1("id")%>&action=delpiccat1">ɾ��</a></td>
				</TR>
				<%
				  rs1.movenext
				  loop
				  rs1.close
				  set rs1=nothing
				%> 
		  </table>
		</div></td></tr>
        <%rs.movenext
		  loop
		  rs.close
		  set rs=nothing
		 %>
		 <%rst.movenext
		   loop
if rst.bof and rst.eof then%>
        <tr align="center" class="a3"> 
          <td colspan="3">��ǰû�з��࣡</td>
        </tr>
        <%rst.close
set rst=nothing
		end if%>
</table>
<br>
       <br>
        <%end if
	 if request.querystring("action")="newpiccat" then%> 
          </p>
     <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
		<tr class="a1"> 
            <td>
            <font color="#333333">��������Ŀ¼</font></td>
        </tr>
        <tr class="a4"> 
            <td>��������- 
              <input type="text" name="piccat_name" size="40">          </td>
        </tr>
		<tr class="a3"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')"> *ֻ����д����</td>
        </tr>
        <tr class="a4"> 
            <td height="30" align="center"><input type="submit" name="Submit2" value="ȷ������">
          <input type="reset" name="Reset" value="�������">          </td>
        </tr>
		<input type="hidden" name="id" value="<%=request("piccat_id")%>">
		<input type="hidden" name="action" value="newpiccat">
		<input type="hidden" name="MM_insert" value="true">
		</form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.querystring("action")="newpiccat1" then%> 
          </p>
     <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
		<tr class="a1"> 
            <td>
            <font color="#333333">��������Ŀ¼</font></td>
        </tr>
        <tr class="a4"> 
            <td>��������- 
              <input type="text" name="piccat_name" size="40">          </td>
        </tr>
		<tr class="a3"> 
          <td width="17%">����ͼƬ- 
              <input type="text" name="excel_file" size="60">
            &nbsp;&nbsp;<input type="button" name="nb22" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form1&editname=excel_file&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">            *�ߴ磺144*107               </td>
          </tr>
		<tr class="a4"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')"> *ֻ����д����</td>
        </tr>
		<!--<tr class="a4"> 
            <td>����ͼƬ-
              <input type="text" name="excel_file" size="40">            
              &nbsp;&nbsp;
          <input type="button" name="nb22" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form1&editname=excel_file&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">             </td>
          </tr>-->
        <tr class="a4"> 
            <td height="30" align="center"><input type="submit" name="Submit2" value="ȷ������">
          <input type="reset" name="Reset" value="�������">          </td>
        </tr>
		<input type="hidden" name="id" value="<%=request("piccat_id")%>">
		<input type="hidden" name="id1" value="<%=request("cat_id")%>">
		<input type="hidden" name="action" value="newpiccat1">
		<input type="hidden" name="MM_insert" value="true">
		</form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.querystring("action")="newpiccat2" then%> 
          </p>
     <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
		<tr class="a1"> 
            <td>
            <font color="#333333">����һ��Ŀ¼</font></td>
        </tr>
        <tr class="a4"> 
            <td>��������- 
              <input type="text" name="piccat_name" size="60">          </td>
        </tr>
		  <tr class="a3"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')"> *ֻ����д����</td>
        </tr>
        <tr class="a4"> 
            <td height="30" align="center"><input type="submit" name="Submit2" value="ȷ������">
          <input type="reset" name="Reset" value="�������">          </td>
        </tr>
		<input type="hidden" name="action" value="newpiccat2">
		<input type="hidden" name="MM_insert" value="true">
		</form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="editpiccat1" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��ķ���ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort1 where id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>�޸�����Ŀ¼</td>
          </tr>
          <tr class="a4"> 
            <td>����Ŀ¼����- 
              <input name="piccat_name" type="text" id="piccat_name" size="40" value="<%=rs("piccat_name1")%>"> 
            </td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">����ͼƬ- 
              <input type="text" name="excel_file" size="60" value="<%=rs("piccat_pic")%>">
            &nbsp;&nbsp;<input type="button" name="nb22" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form1&editname=excel_file&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">             *�ߴ磺144*107               </td>
          </tr>
		  <tr class="a4"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')" value="<%=rs("piccat_px")%>"> *ֻ����д����</td>
        </tr>
		  <!--<tr class="a3"> 
            <td>����Ŀ¼ͼƬ-
              <input type="text" name="excel_file" size="40" value="<%=rs("piccat_pic")%>">            
              &nbsp;&nbsp;
          <input type="button" name="nb22" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form1&editname=excel_file&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">             </td>
          </tr>-->
          <tr class="a3"> 
            <td height="30" align="center"> <input name="Submit" type="submit" id="Submit" value="ȷ���޸�"> 
              <input name="Reset" type="reset" id="Reset" value="�������"> </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("id")%>">
          <input type="hidden" name="action" value="editpiccat1">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="editpiccat" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��ķ���ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort where piccat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>�޸Ķ���Ŀ¼</td>
          </tr>
          <tr class="a4"> 
            <td>��������- 
              <input name="piccat_name" type="text" id="piccat_name" size="40" value="<%=rs("piccat_name")%>"> 
            </td>
          </tr>
		  <tr class="a3"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')" value="<%=rs("piccat_px")%>"> *ֻ����д����</td>
        </tr>
          <tr class="a3"> 
            <td height="30" align="center"> <input name="Submit" type="submit" id="Submit" value="ȷ���޸�"> 
              <input name="Reset" type="reset" id="Reset" value="�������"> </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("piccat_id")%>">
          <input type="hidden" name="action" value="editpiccat">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="editpiccat2" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��ķ���ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort2 where piccat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>�޸�һ��Ŀ¼</td>
          </tr>
          <tr class="a4"> 
            <td>��������- 
              <input name="piccat_name" type="text" id="piccat_name" size="60" value="<%=rs("piccat_name")%>"> 
            </td>
          </tr>
		  <tr class="a3"> 
            <td>����˳��- 
              <input type="text" name="piccat_px" size="40" onKeyUp="value=value.replace(/[^(\d-)]/g,'')" value="<%=rs("piccat_px")%>"> *ֻ����д����</td>
        </tr>
          <tr class="a3"> 
            <td height="30" align="center"> <input name="Submit" type="submit" id="Submit" value="ȷ���޸�"> 
              <input name="Reset" type="reset" id="Reset" value="�������"> </td>
          </tr>
		  <input type="hidden" name="id" value="<%=rs("piccat_id")%>">
          <input type="hidden" name="action" value="editpiccat2">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="delpiccat1" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort1 where id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>ɾ������Ŀ¼</td>
          </tr>
          <tr class="a4"> 
            <td>����Ŀ¼����- <%=rs("piccat_name1")%>            </td>
          </tr>
          <tr class="a4"> 
            <td height="30" align="center"> 
              <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��">            </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("id")%>">
          <input type="hidden" name="action" value="delpiccat1">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="delpiccat" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort where piccat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>ɾ������Ŀ¼</td>
          </tr>
          <tr class="a3"> 
            <td>����Ŀ¼����- <%=rs("piccat_name")%>
            </td>
          </tr>
          <tr class="a4"> 
            <td height="30" align="center"> 
              <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��">
            </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("piccat_id")%>">
          <input type="hidden" name="action" value="delpiccat">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="delpiccat2" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ��Ŀ�վ����ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picturesort2 where piccat_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
	  %>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form1" method="post" action="">
          <tr class="a1"> 
            <td>ɾ��һ��Ŀ¼</td>
          </tr>
          <tr class="a3"> 
            <td>һ��Ŀ¼����-<%=rs("piccat_name")%> </td>
          </tr>
          <tr class="a4"> 
            <td height="30" align="center"> 
              <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��">            </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("id")%>">
          <input type="hidden" name="action" value="delpiccat2">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
      <%end if
if request.querystring("action")="pic" then
sql="select * from picture order by cat_id asc,piccat_id asc,piccat_id1 asc,pic_px asc,pic_id desc"
if request.querystring("piccat_id1")<>"" then
sql="select * from picture where piccat_id1="&cint(request.querystring("piccat_id1"))&" order by cat_id asc,piccat_id asc,piccat_id1 asc,pic_px asc,pic_id desc"
end if
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
totalpic=rs.recordcount
%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
	    <form name="form3" method="post" action="">
        <tr class="a1"> <td width="448">��������</td>
          <td width="293" align="right">
              <select name="go" onChange='window.location=form.go.options[form.go.selectedIndex].value'>
			  <option value="">ѡ����ʾ��ʽ</option>
			  <option value="picture.asp?action=pic">��ʾ����ͼƬ</option>
<%sql="select * from picturesort1"
set rs2=server.createobject("adodb.recordset")
rs2.open sql,conn,1,1
do while not rs2.eof
set rss=conn.execute("select count(*) as cc from picture where piccat_id1="&rs2("id")&"")
%>
<option value="picture.asp?action=pic&piccat_id1=<%=rs2("id")%>"><%=rs2("piccat_name1")%>(<%=rss("cc")%>)</option>
<%rs2.movenext
loop
if rs2.bof and rs2.eof then%><option value="">��ǰû�з���</option>
<%end if
rs2.close
set rs2=nothing%>
              </select>
          </td>
        </tr>
		</form>
</table>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">
        <tr class="a3"> 
		<td align="center" valign="middle">
<table cellspacing="1" border="0" width="100%" cellpadding="4" align=center class="a2">
            <tr align="center" class="a4"> 
          <td width="10%">���</td>
          <td width="42%">���±���</td>
          <td width="35%">��������</td>
          <td width="13%">����</td>
        </tr>
<%
if not rs.eof then
rs.movefirst
rs.pagesize=picperpage
if trim(request("page"))<>"" then
   currentpage=clng(request("page"))
   if currentpage>rs.pagecount then
      currentpage=rs.pagecount
   end if
else
   currentpage=1
end if
   totalpic=rs.recordcount
   if currentpage<>1 then
       if (currentpage-1)*picperpage<totalpic then
	       rs.move(currentpage-1)*picperpage
		   dim bookmark
		   bookmark=rs.bookmark
	   end if
   end if
   if (totalpic mod picperpage)=0 then
      totalpages=totalpic\picperpage
   else
      totalpages=totalpic\picperpage+1
   end if
i=0
do while not rs.eof and i<picperpage
%>
 <tr class="a3"> 
<td><%=rs("pic_id")%></td>
<td><%=rs("pic_name")%></td>
<td>
<%
	set ps=conn.execute("select a.piccat_name as cat_name,b.piccat_name as piccat_name,c.piccat_name1 as piccat_name1 from picturesort2 a,picturesort b,picturesort1 c where a.piccat_id="&rs("cat_id")&" and b.piccat_id="&rs("piccat_id")&" and c.id="&rs("piccat_id1")&"")
	if not ps.eof then
		response.Write(ps("cat_name") & "-" & ps("piccat_name") & "-" & ps("piccat_name1"))
	end if
%></td>
<td align="center"><a href="picture.asp?id=<%=rs("pic_id")%>&action=editpic">�༭</a> 
            <a href="picture.asp?id=<%=rs("pic_id")%>&action=delpic">ɾ��</a></td></tr>



<%
i=i+1
rs.movenext
loop
%>
</table>
</td></tr>
<%
else
if rs.eof and rs.bof then
%>
        <tr class="a3"> 
          <td colspan="3" height="22" align="center">��ǰû�а�����</td>
        </tr>
      <%end if
end if%>
</table>
      <table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
        <form name="form1" method="post" action="picture.asp?action=pic&piccat_id=<%=request.querystring("piccat_id")%>">
          <tr> 
            <td align="right"> <%=currentpage%> /<%=totalpages%>ҳ,<%=totalpic%>����¼/<%=picperpage%>ƪÿҳ. 
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
              <a href="picture.asp?action=pic&page=<%=i%>&piccat_id=<%=request.querystring("piccat_id")%>"><%=i%></a> 
              <%end if
next
if totalpages>currentpage then
if request("page")="" then
page=1
else
page=request("page")+1
end if%>
              <a href="picture.asp?action=pic&page=<%=page%>&piccat_id=<%=request.querystring("piccat_id")%>" title="��һҳ">>></a> 
              <%end if%>
              &nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="text" name="page" size="4">
              <input type="submit" name="Submit" value="Go">
            </td>
          </tr>
        </form>
      </table>
      <br>
	  <br>
	  <%end if
	  if request.querystring("action")="newpic" then%>
  <table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">    
        <form name="form2" method="post" action="">
          <tr class="a1"> 
            <td colspan="2">��������</td>
          </tr>
          <tr class="a4"> 
            <td width="17%">��������</td>
            <td width="83%"> 
              <input type="text" name="pic_name" size="60">            </td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">����˳��</td>
            <td width="83%"> 
              <input type="text" name="pic_px" size="30" onKeyUp="value=value.replace(/[^(\d-)]/g,'')"> *ֻ����д����</td>
          </tr>
          <tr class="a4"> 
            <td width="17%">��������</td>
            <td width="83%"> 
              <select name="piccatid">
<%
sql2="select * from picturesort2"
set rst=server.createobject("adodb.recordset")
rst.open sql2,conn,1,1
do while not rst.eof%><option value="<%=rst("piccat_id")%>"><%=rst("piccat_name")%>(һ��)</option>
<%
sql="select * from picturesort where cat_id="& rst("piccat_id")
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
do while not rs.eof%><option value="<%=rs("piccat_id")%>">&nbsp;&nbsp;|-<%=rs("piccat_name")%>(����)</option>
<%
sql="select * from picturesort1 where piccat_id1="& rs("piccat_id")
set ps=server.createobject("adodb.recordset")
ps.open sql,conn,1,1
do while not ps.eof%><option value="<%=ps("id")%>">&nbsp;&nbsp;&nbsp;&nbsp;|-<%=ps("piccat_name1")%>(����)</option>
<%
ps.movenext
loop
rs.movenext
loop
rst.movenext
loop
if rst.eof and rst.bof then%><option value="0">��ǰû�з���</option>
<%end if%>
              </select> 
              *ѡ������Ŀ¼</td>
          </tr>
		  
		  <tr class="a3"> 
            <td width="17%">����ͼƬ</td>
            <td width="83%"> 
              <input type="text" name="excel_file1" size="60">
            &nbsp;
            <input type="button" name="nb222" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form2&editname=excel_file1&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">             *�ߴ磺144*107  </td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">��������</td>
            <td width="83%"><textarea name="content" style="display:none" cols="1" rows="1"></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
		  </tr>
          <!--<tr class="a3"> 
            <td width="17%">��������</td>
            <td width="83%"><textarea name="content" style="display:none" cols="1" rows="1"></textarea>
            <iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>-->
          <tr class="a4" align="center"> 
            <td colspan="2" height="30" bgcolor="#F5F5F5"> 
              <input type="submit" name="Submit" value="ȷ������">
              <input type="reset" name="Reset" value="�������">
              [<a href="picture.asp?action=pic">����</a>] </td>
          </tr>
		  <input type="hidden" name="action" value="newpic">
		<input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
      <%end if
	  if request.QueryString("action")="editpic" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ���ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picture where pic_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">    
        <form name="form2" method="post" action="">
          <tr class="a1"> 
            <td colspan="2">�޸İ���</td>
          </tr>
          <tr class="a4"> 
            <td width="17%">��������</td>
            <td width="83%"> 
              <input type="text" name="pic_name" size="60" value="<%=rs("pic_name")%>">            </td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">����˳��</td>
            <td width="83%"> 
              <input type="text" name="pic_px" size="30" onKeyUp="value=value.replace(/[^(\d-)]/g,'')" value="<%=rs("pic_px")%>"> *ֻ����д����</td>
          </tr>
          <tr class="a4"> 
            <td width="17%">��������</td>
            <td width="83%"> 
              <select name="piccatid">
<%
sql2="select * from picturesort2"
set rst=server.createobject("adodb.recordset")
rst.open sql2,conn,1,1
do while not rst.eof%><option value="<%=rst("piccat_id")%>"><%=rst("piccat_name")%>(һ��)</option>
<%
sql1="select * from picturesort where cat_id="& rst("piccat_id")
set rs1=server.createobject("adodb.recordset")
rs1.open sql1,conn,1,1
do while not rs1.eof%><option value="<%=rs1("piccat_id")%>">&nbsp;&nbsp;|-<%=rs1("piccat_name")%>(����)</option>
<%
sql="select * from picturesort1 where piccat_id1="& rs1("piccat_id")
set ps=server.createobject("adodb.recordset")
ps.open sql,conn,1,1
do while not ps.eof%><option value="<%=ps("id")%>" <%if ps("id")=rs("piccat_id1") then%> selected="selected"<%end if%>>&nbsp;&nbsp;&nbsp;&nbsp;|-<%=ps("piccat_name1")%>(����)</option>
<%
ps.movenext
loop
rs1.movenext
loop
rst.movenext
loop
if rst.eof and rst.bof then%><option value="0">��ǰû�з���</option>
<%end if%>
              </select> *ѡ������Ŀ¼</td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">����ͼƬ</td>
            <td width="83%"> 
              <input type="text" name="excel_file1" size="60" value="<%=rs("pic_pic1")%>">
            &nbsp;&nbsp;<input type="button" name="nb22" value="�ϴ�ͼƬ" onClick="window.open('img_upload.asp?formname=form2&editname=excel_file1&uppath=UploadFile&filelx=jpg','','status=no,scrollbars=no,top=220,left=220,width=420,height=165')">   *�ߴ磺144*107           </td>
          </tr>
		  <tr class="a3"> 
            <td width="17%">��������</td>
            <td width="83%"><textarea name="content" style="display:none" cols="1" rows="1"><%=rs("pic_content")%></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>
          <!--<tr class="a3"> 
            <td width="17%">��������</td>
            <td width="83%"><textarea name="content" style="display:none" cols="1" rows="1"></textarea><iframe id="eWebEditor1" src="edit/ewebeditor.asp?id=content&style=news" frameborder="0" scrolling="no" width="100%" height="399" marginwidth="1" marginheight="1" name="wfasdg"></iframe></td>
          </tr>-->
          <tr class="a4" align="center"> 
            <td colspan="2" height="30" bgcolor="#F5F5F5"> 
              <input type="submit" name="Submit" value="ȷ������">
              <input type="reset" name="Reset" value="�������">
              [<a href="picture.asp?action=pic">����</a>] </td>
          </tr>
		  <input type="hidden" name="action" value="editpic">
		   <input type="hidden" name="id" value="<%=rs("pic_id")%>">
		<input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <br>
	  <br>
	  <%end if
	  if request.QueryString("action")="delpic" then
	  if request.querystring("id")="" then
  errmsg=errmsg+"<br>"+"<li>��ָ�������Ķ���"
  call diserror()
  response.end
else
  if not isinteger(request.querystring("id")) then
    errmsg=errmsg+"<br>"+"<li>�Ƿ���ID������"
	call diserror()
	response.end
  end if
end if
sql="select * from picture where pic_id="&cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1%>
<table cellspacing="1" border="0" width="760" cellpadding="4" align=center class="a2">      
        <form name="form2" method="post" action="">
          <tr class="a1"> 
            <td colspan="2">
            <font color="#333333">ɾ������</font></td>
          </tr>
          <tr class="a3"> 
            <td width="17%">��������</td>
            <td width="83%"> <%=rs("pic_name")%> ��</td>
          </tr>
          <tr  class="a4"align="center"> 
            <td colspan="2" height="30" bgcolor="#F5F5F5">
              <input name="Submit" type="submit" id="Submit" value="ȷ��ɾ��">
              [<a href="picture.asp?action=pic">����</a>] </td>
          </tr>
          <input type="hidden" name="id" value="<%=rs("pic_id")%>">
          <input type="hidden" name="action" value="delpic">
          <input type="hidden" name="MM_insert" value="true">
        </form>
</table>
	  <%end if%>
      <br>
	  <br>
    </td>
  </tr>
</table>
<%
end if
%>
</html>