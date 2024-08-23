<%
set conn=server.createobject("adodb.connection")
DBPath=Server.MapPath("jh_admin/Data-base/db.net.asa")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& DBPath
conn.Open connstr
on error resume next
%>
