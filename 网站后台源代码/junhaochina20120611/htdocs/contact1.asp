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
    <li><a href="contact.asp">��ϵ����</a></li>
    <li id="left_list1"><a href="contact1.asp">���Է���</a></li>
  </ul>
  <!--#include file="link_left.asp"-->
</div>
<div id="Main_right">
  <table width="666" border="0" cellpadding="0" cellspacing="0" class="Title">
  <tr>
    <td width="67">���Է���</td>
    <td width="599" style="background:url(images/line1.jpg) no-repeat right;">&nbsp;</td>
  </tr>
</table>
<div class="Contnet">
   <script language="javascript">
   	function feedform(aform)
	{
		if(aform.company.value=="")
		{
			alert("�����빫˾����");
			aform.company.focus();
			return false;
		}
		if(aform.email.value=="")
		{
			alert("�������������");
			aform.email.focus();
			return false;
		}
		if(aform.tel.value=="")
		{
			alert("��������ϵ�绰");
			aform.tel.focus();
			return false;
		}
		if(aform.title.value=="")
		{
			alert("���������Ա���");
			aform.title.focus();
			return false;
		}
		if(aform.content.value=="")
		{
			alert("��������������");
			return false;
		}
	}
   </script>
  <form action="contact1.asp?action=send" method="post" name="feed" onsubmit="return feedform(this)">
  <table width="80%" border="0" cellpadding="0" cellspacing="0" style="margin:30px auto; color:#000; line-height:30px;">
    <tr>
    <td width="14%" align="right">��˾���ƣ�</td>
    <td width="86%"><input type="text" name="company" size="30"/></td>
  </tr>
  <tr>
    <td align="right">�������䣺</td>
    <td><input type="text" name="email" size="20"/></td>
    </tr>
  <tr>
    <td align="right">��ϵ�绰��</td>
    <td><input type="text" name="tel" size="20"/></td>
  </tr>
  <tr>
    <td align="right">���Ա��⣺</td>
    <td><input type="text" name="title" size="30"/></td>
  </tr>
  <tr>
    <td align="right" valign="top">�������ݣ�</td>
    <td><textarea name="content" id="content" style="border:1px solid #ccc; margin:5px 0; width:340px; height:120px; color:#333;"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="�� ��" class="Btn"/></td>
  </tr>
</table>
</form>
</div>
</div>
<div style="clear:both"></div>
</div>
<%
	if request("action")="send" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from book"
		rs.open sql,conn,1,3
		rs.addnew
			rs("b_compay")=request("company")
			rs("b_email")=request("email")
			rs("b_tel")=request("tel")
			rs("b_title")=request("title")
			rs("b_content")=request("content")
		rs.update
		response.Write("<script>alert('�ύ�ɹ�');location.href='contact1.asp';</script>")
		rs.close
		set rs=nothing
	end if
%>
<!--#include file="foot.asp"-->