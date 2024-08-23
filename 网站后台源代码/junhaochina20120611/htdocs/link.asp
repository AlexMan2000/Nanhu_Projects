<!--#include file="top.asp"-->
  <table width="917" height="47" border="0" cellpadding="0" cellspacing="0" class="Nav">
  <tr>
    <td><a href="index.asp"><img src="images/home.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="about.asp"><img src="images/about.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="fenbu.asp"><img src="images/fenbu.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="case.asp"><img src="images/case.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="contact.asp"><img src="images/contact.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="link.asp"><img src="images/link_1.jpg"/></a></td>
  </tr>
  </table>
</div>
<div id="Main">
  <div><img src="images/link_tit.jpg"/></div>
  <ul class="Link_list">
  <%
  	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tutorial6 order by art_px asc,art_id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		do while not rs.eof
  %>
    <li><a href="<%=rs("art_url")%>" target="_blank">¡¤<%=rs("art_title")%></a></li>
  <%
  		rs.movenext
		loop
	end if
	rs.close
	set rs=nothing
  %>
  </ul>
  <div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->