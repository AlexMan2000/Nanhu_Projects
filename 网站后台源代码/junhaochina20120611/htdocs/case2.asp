<!--#include file="top.asp"-->
  <table width="917" height="47" border="0" cellpadding="0" cellspacing="0" class="Nav">
  <tr>
    <td><a href="index.asp"><img src="images/home.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="about.asp"><img src="images/about.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="fenbu.asp"><img src="images/fenbu.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="case.asp"><img src="images/case1.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="contact.asp"><img src="images/contact.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="link.asp"><img src="images/link_2.jpg"/></a></td>
  </tr>
  </table>
</div>
<div id="Main">
<div id="Main_left">
  <div style="padding-top:10px;"><img src="images/fenlei_left.jpg"/></div>
  <ul class="left_list">
    <!--#include file="caseleft.asp"-->
  </ul>
  <!--#include file="link_left.asp"-->
</div>
<div id="Main_right">
  <table width="666" border="0" cellpadding="0" cellspacing="0" class="Title">
  <tr></tr>
  <tr>
    <td nowrap="nowrap" style="word-break: keep-all;"><%=cat_name%></td>
    <td width="598" style="background:url(images/line1.jpg) no-repeat right;">&nbsp;</td>
  </tr>
  </table>
  <%
  	set rs=conn.execute("select pic_name,pic_content from picture where pic_id="&request("pic_id")&"")
	if not rs.eof then
  %>
  <h4><%=rs("pic_name")%></h4>
  <div style="line-height:24px; color:#666;">
    <%=rs("pic_content")%>
  </div>
  <%
  	end if
	rs.close
	set rs=nothing
  %>
  <div style="text-align:right; padding:30px 0; "><a onclick="javascript:history.back();" style="cursor:pointer;">[·µ»Ø]</a></div>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->