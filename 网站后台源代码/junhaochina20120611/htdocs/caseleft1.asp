<%
  	if request("piccat_id")<>"" then
		set rss=conn.execute("select * from picturesort where piccat_id="&request("piccat_id")&"")
	else
		set rss=conn.execute("select top 1 * from picturesort where cat_id="&cat_id&" order by piccat_px asc,piccat_id asc")
	end if
	if not rss.eof then
		piccat_id=rss("piccat_id")
		piccat_name=rss("piccat_name")
	end if
	set rst=conn.execute("select * from picturesort where cat_id="&cat_id&" order by piccat_px desc,piccat_id desc")
	do while not rst.eof
%>
    <li<%if cint(piccat_id)=rst("piccat_id") then%> id="Fenqu1"<%end if%>><a href="case.asp?cat_id=<%=cat_id%>&piccat_id=<%=rst("piccat_id")%>"><%=rst("piccat_name")%></a></li>
<%
	rst.movenext
	loop
	rst.close
	set rst=nothing
%>