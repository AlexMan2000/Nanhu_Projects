<!--#include file="top.asp"-->
  <table width="917" height="47" border="0" cellpadding="0" cellspacing="0" class="Nav">
  <tr>
    <td><a href="index.asp"><img src="images/home.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="about.asp"><img src="images/about.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="fenbu.asp"><img src="images/fenbu1.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="case.asp"><img src="images/case.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="contact.asp"><img src="images/contact.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="link.asp"><img src="images/link_2.jpg"/></a></td>
  </tr>
  </table>
</div>
<div id="Main">
<div id="Main_left">
  <div style="padding-top:10px;"><img src="images/fenbu_left.jpg"/></div>
  <ul class="left_list">
  <%
  	set ps=server.CreateObject("adodb.recordset")
	sql="select d_id,d_title from diary order by d_px asc,d_id desc"
	ps.open sql,conn,1,1
	if not ps.eof then
		ii=0
	do while not ps.eof
		ii=ii+1
  %>
    <li<%if (ii=1 and request("d_id")="") or (cint(ps("d_id"))=cint(request("d_id"))) then%> id="left_list1"<%end if%>><a href="fenbu.asp?d_id=<%=ps("d_id")%>"><%=ps("d_title")%></a></li>
  <%
  	ps.movenext
	loop
	end if
	ps.close
	set ps=nothing
  %>
  </ul>
  <!--#include file="link_left.asp"-->
</div>
<div id="Main_right">
<%
  	if request("d_id")<>"" then
		set rs=conn.execute("select * from diary where d_id="&request("d_id")&"")
	else
		set rs=conn.execute("select top 1 * from diary order by d_px asc,d_id desc")
	end if
	if not rs.eof then
		title=rs("d_title")
		content=rs("d_content")
	end if
	rs.close
	set rs=nothing
  %>
  <table width="666" border="0" cellpadding="0" cellspacing="0" class="Title">
  <tr></tr>
  <tr>
    <td nowrap="nowrap" style="word-break: keep-all;"><%=title%></td>
    <td width="588" style="background:url(images/line1.jpg) no-repeat right;">&nbsp;</td>
  </tr>
  </table>
  <p><%=content%></p>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->