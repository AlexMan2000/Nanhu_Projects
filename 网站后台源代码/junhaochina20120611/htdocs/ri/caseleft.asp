 <%
 	if request("cat_id")<>"" then
		set pst=conn.execute("select * from picturesort2 where piccat_id="&request("cat_id")&"")
	else
		set pst=conn.execute("select top 1 * from picturesort2 order by piccat_px asc,piccat_id asc")
	end if
	if not pst.eof then
		cat_id=pst("piccat_id")
		cat_name=pst("piccat_name")
	end if
  	set ps=conn.execute("select * from picturesort2 order by piccat_px asc,piccat_id asc")
	if not ps.eof then
		do while not ps.eof
  %>
    <li<%if cint(cat_id)=cint(ps("piccat_id")) then%> id="left_list1"<%end if%>><a href="case.asp?cat_id=<%=ps("piccat_id")%>"><%=ps("piccat_name")%></a></li>
  <%
  		ps.movenext
		loop
	end if
	ps.close
	set ps=nothing
  %>