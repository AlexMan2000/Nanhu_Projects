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
  <ul class="Fenqu">
    <!--#include file="caseleft1.asp"-->
  </ul>
  <div style=" clear:both"></div>
  <ul class="case_list">
  <%	
		set rs=server.CreateObject("adodb.recordset")
		str="select * from picture where piccat_id1="&request("piccat_id1")&" order by pic_px asc,pic_id desc"
	    rs.open str,conn,1,1
        if rs.recordcount>0 then 
			widthcnt=4 '每行显示记录数
			heightcnt=3  '每页显示行数
	  		rs.PageSize =widthcnt*heightcnt '每页记录条数
			iCount=rs.RecordCount '记录总数
			iPageSize=rs.PageSize
    		maxpage=rs.PageCount 
    		page=request("page")
				if Not IsNumeric(page) or page="" then
					page=1
				else
					page=cint(page)
				end if
    			if page<1 then
        			page=1
    			elseif  page>maxpage then
        			page=maxpage
    			end if  
    			rs.AbsolutePage=Page
				if page=maxpage then
	    			if (iCount-(maxpage-1)*iPageSize) mod widthcnt = 0 then
  		  				x=(iCount-(maxpage-1)*iPageSize)/widthcnt
					else
		  				x=(iCount-(maxpage-1)*iPageSize)/widthcnt + 1
					end if
				else
					x=heightcnt
				end if
				cnt = (page-1)*widthcnt*heightcnt
				k=0
				For i=1 To x
					For k=1 To widthcnt
						cnt = cnt+1
						if cnt <= iCount then
  %>
    <li>
      <div class="case_list1"><a href="case2.asp?cat_id=<%=cat_id%>&pic_id=<%=rs("pic_id")%>"><img src="jh_admin/<%=rs("pic_pic1")%>" width="144" height="107"/></a></div>
      <div><a href="case2.asp?cat_id=<%=cat_id%>&pic_id=<%=rs("pic_id")%>"><%=rs("pic_name")%></a></div>
    </li>
    <% 
							if cnt < iCount then 
								rs.movenext
							end if
							end if
						next
				next
	%>
  </ul>
  <div style="clear:both"></div>
  <div class="yema">
    <%
				call PageControl(iCount,maxpage,page,"border=0 align=center","")
				Sub PageControl(iCount,pagecount,page,table_style,font_style)'生成上一页下一页链接
    				Dim query, a, x, temp
    				action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")

    				query = Split(Request.ServerVariables("QUERY_STRING"), "&")
    				For Each x In query
        				a = Split(x, "=")
        			If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            			temp = temp & a(0) & "=" & a(1) & "&"
        			End If
   					Next
					Response.Write("<form method=get name=form1 onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;"">")  
        
    				if page<=1 then
       					 Response.Write ("<font class='yema1'>トップページ</font>")        
       		   			 Response.Write ("<font class='yema1'>前のページ</font>")
    				else        
        				Response.Write("<A class='yema1' HREF=" & action & "?" & temp & "Page=1 >トップページ</A>&nbsp;")
        				Response.Write("<A class='yema1' HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">前のページ</A>&nbsp;")
    				end if

    				if page>=pagecount then
						Response.Write ("<font class='yema1'>次のページ</font>")
        				Response.Write ("<font class='yema1'>末のページ</font>")         
    				else
        				Response.Write("<A class='yema1' HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">次のページ</A></font>")
        				Response.Write("<A class='yema1' HREF=" & action & "?" & temp & "Page=" & pagecount & ">末のページ</A></font>")            
    				end if
						'Response.Write("&nbsp;<font color=000000>共:</font>[<span class='Index_t'>" & pageCount & "</span>]<font color=000000>页</font>" &  vbCrLf)
						'Response.Write("&nbsp;<font color=000000>当前页:</font>[<span class='Index_t'>"  & page & "</span>]" &  vbCrLf)
      					'Response.Write("&nbsp;<font color=000000>共:</font>[<span class='Index_t'>" & iCount & "</span>]<font color=000000>条记录</font>" &  vbCrLf)      
    					Response.Write("</form>")         
			End Sub
			end if
			rs.close
			set rs=nothing
		%>
  </div>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->