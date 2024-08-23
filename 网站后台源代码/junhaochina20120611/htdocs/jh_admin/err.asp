<%
   start="²Ù×÷´íÎó"
   errmsg=Request("errmsg")
%>

<!--#include file="conn.asp"-->
<!--#include file="inc/inc.asp"-->
<%
Function FormatStr(String)
  on Error resume next
  String = Replace(String, CHR(13), "")
  String = Replace(String, CHR(10) & CHR(10), "<BR><BR>")
  String = Replace(String, CHR(10), "<BR>")
  String = Replace(String, CHR(34), "&#34;")
  FormatStr = String
End Function
%>
<script>vtop()</script>
<script>table1("<%call left_t_1("<img src=images/err.jpg>")%>","<Br><br><%=FormatStr(errmsg)%><Br><br><Br><br>")</script>
<Script>vbottom()</Script>
<script>table1("","<p align=center>"+add+"<br><br><font color=#ff0000>"+cou+"</font>")</script>
