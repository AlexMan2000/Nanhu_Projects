<%
on error resume next
dim startime
startime=timer()*1000
	dim conn,connstr,rs,sql
	dim dbpath
   	set conn=server.createobject("adodb.connection")
	DBPath=Server.MapPath("Data-base/db.net.asa")
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& DBPath
	conn.Open connstr
'session.timeout="10"
%>
