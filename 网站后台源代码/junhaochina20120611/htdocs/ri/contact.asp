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
    <td><a href="contact.asp"><img src="images/contact1.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="link.asp"><img src="images/link_2.jpg"/></a></td>
  </tr>
  </table>
</div>
<div id="Main">
<div id="Main_left">
  <div style="padding-top:10px;"><img src="images/contact_left.jpg"/></div>
  <ul class="left_list">
    <li id="left_list1"><a href="contact.asp">¤ª†–¤¤ºÏ¤ï¤»</a></li>
    <li style="letter-spacing:-2px;"><a href="contact1.asp">¥á¥Ã¥»©`¥¸¥Õ¥£©`¥É¥Ð¥Ã¥¯</a></li>
  </ul>
  <!--#include file="link_left.asp"-->
</div>
<div id="Main_right">
  <table width="666" border="0" cellpadding="0" cellspacing="0" class="Title">
  <tr>
    <td width="88">¤ª†–¤¤ºÏ¤ï¤»</td>
    <td width="578" style="background:url(images/line1.jpg) no-repeat right;">&nbsp;</td>
  </tr>
</table>
<div class="Contnet">
  <%
  	set rs=server.CreateObject("adodb.recordset")
	sql="select art_content from tutorial where art_id=397"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.Write(rs(0))
	end if
	rs.close
	set rs=nothing
  %>
</div>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->