<!--#include file="top.asp"-->
  <table width="917" height="47" border="0" cellpadding="0" cellspacing="0" class="Nav">
  <tr>
    <td><a href="index.asp"><img src="images/home.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="about.asp"><img src="images/about1.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="fenbu.asp"><img src="images/fenbu.jpg"/></a></td>
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
  <div style="padding-top:10px;"><img src="images/about_left.jpg"/></div>
  <ul class="left_list">
    <li<%if request("aid")<>396 then%> id="left_list1"<%end if%>><a href="about.asp?aid=395">会社案内</a></li>
    <li<%if request("aid")=396 then%> id="left_list1"<%end if%>><a href="about.asp?aid=396">企業理念</a></li>
  </ul>
  <!--#include file="link_left.asp"-->
</div>
<div id="Main_right">
<%
  	if request("aid")<>"" then
		aid=request("aid")
	else
		aid=395
	end if
  	set rs=server.CreateObject("adodb.recordset")
	sql="select art_content,art_title from tutorial where art_id="&aid&""
	rs.open sql,conn,1,1
	if not rs.eof then
		title=rs(1)
		content=rs(0)
	end if
	rs.close
	set rs=nothing
  %>
  <table width="666" border="0" cellpadding="0" cellspacing="0" class="Title">
  <tr>
    <td  nowrap="nowrap" style="word-break: keep-all;"><%=title%></td>
    <td width="599" style="background:url(images/line1.jpg) no-repeat right;">&nbsp;</td>
  </tr>
</table>
<div class="Contnet">
  <%=content%>
</div>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->