<HTML>
<HEAD>
<META http-equiv="refresh" content="500;">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="inc/adminstyle.css" type=text/css rel=stylesheet>
<SCRIPT>
function aa(Dir)
{tt.doScroll(Dir);Timer=setTimeout('aa("'+Dir+'")',100)}//����100Ϊ�����ٶ�

function StopScroll()
{if(Timer!=null)clearTimeout(Timer)}

function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
</HEAD>

      <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
        <TBODY>
        <TR align="center">
          <TD height=42 class="a2" style="background-color: #FFFFFF">
            <p align="center">
			<font color="#FF0000"><b>�� վ �� ��</b></font>
			</p>
          </TD>
		</TR>
        </TBODY>
	  </TABLE>
<center>
      <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
        <TBODY>
        <TR align="center" class="a3">
          <TD height=25 valign="middle"background=images/title_bg_quit.gif class=menu_title 
		      onMouseOver="this.className='menu_title2';" onMouseOut="this.className='menu_title';">
		      <SPAN><font color="215DC6"><b><font color=215DC6><a href="../index.asp" target="_blank">����ҳ</a></font></b>
			   &nbsp;|&nbsp;<b><a target="_top" href=login.asp?action=logout ><font color=215DC6>�˳�</font></a></b></font>              </SPAN>		  </TD>
        </TR>
       </TBODY>
     </TABLE>

<TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
     <TBODY>
        <TR align="center" class="a3">
         <TD class=menu_title onMouseOver="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=images/title_bg_quit.gif height=25>
		  <SPAN>
		  <font color="215DC6">
			<b><a  href="index.asp" target=_top><font color=215DC6>������ҳ</font></a></b> 
			</font></SPAN></TD>
	   </TR>
    </TBODY>
</TABLE>
<script>
var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>
<% if session("level")=5 then %>
<TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
    <TBODY>
       <TR align="center" class="a1">
          <TD class=menu_title id=menuTitle1 onMouseOver="this.className='menu_title2';" onclick=showsubmenu(0) 
          onmouseout="this.className='menu_title';"  style=cursor:hand height=25>
		  <SPAN>
		  <b>��������</b>
          </SPAN>
		  </TD>
	   </TR>
      <TR align="center" class="a3">
        <TD id=submenu0 style="DISPLAY: none">
          <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR align="center">
                <TD height=20>
               <a target="main" href="manage.asp?action=admin">����Ա����</a></TD>
              </TR>
              <TR align="center">              
                <TD height=20>
               <a target="main" href="manage.asp?action=modpass">���Ĺ���Ա����</a>			  </TR>
              </TBODY>
		    </TABLE>
		</DIV>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<%end if%>

<%if session("level") >=4 then%>    
<TABLE cellSpacing=1 cellPadding=0 width=158 align=center  class="a2">
   <TBODY>
      <TR align="center" class="a1">
         <TD class=menu_title id=menuTitle1 onMouseOver="this.className='menu_title2';" onclick=showsubmenu(1) 
              onmouseout="this.className='menu_title';"  style=cursor:hand height=25>
		   <SPAN>
		   <b>�����ֲ�</b> 
           </SPAN>
		 </TD>
	  </TR>
	  
        <TR align="center"  class="a3">
          <TD id=submenu1 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR align="center">
                <TD height=20>
				<a href="diary.asp" target=main>��������</a>				</TD>
			  </TR>
              <TR align="center">
                <TD height=20>
                <a href="diary.asp?action=newdiary" target=main>��ӹ���</a></TD>
			  </TR>                
              </TBODY>
			 </TABLE>
			</DIV>
          </TD>
	  </TR>
   </TBODY>
</TABLE>
<%end if%>


<% if   session("level")>=4 then%>	  
 <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
        <TBODY>
        <TR align="center" class="a1">
          <TD class=menu_title id=menuTitle1 onMouseOver="this.className='menu_title2';" onclick=showsubmenu(4) onMouseOut="this.className='menu_title';"  style=cursor:hand height=25><SPAN><b>��������</b> 
            </SPAN></TD>
        </TR>
        <TR align="center" class="a3">
          <TD id=submenu4 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>

              <TR align="center">
                <TD height=20>
                <a href="picture.asp?action=piccat" target=main>�������</a></TD>
                </TR>
              <TR align="center">
                <TD height=20>
                <a href="picture.asp?action=newpiccat2" target=main>��������</a></TD>
                </TR>

              <TR align="center">
                <TD height=20>
                <a href="picture.asp?action=pic" target=main>��������</a></TD>
                </TR>
              <TR align="center">
                <TD height=20>
                <a href="picture.asp?action=newpic" target=main>��������</a>                </TD>
                </TR>
              </TBODY>
			  </TABLE>
			</DIV>
          </TD>
        </TR>
    </TBODY>
</TABLE>
<%end if%>

<% if   session("level")>=4 then%>		
   <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
     <TBODY>     
		<TR align="center" class="a1">
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(6) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          height=25><SPAN><b>��˾���</b></SPAN> 
          </TD>
		</TR>
        <TR align="center" class="a3">
          <TD id=submenu6 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
                <TR align="center">
                <TD height=20>
                <a href="new_tutorial.asp?action=editart&art_id=395" target=main>��˾����</a></TD>
                </TR>
				<TR align="center">
                <TD height=20>
                <a href="new_tutorial.asp?action=editart&art_id=396" target=main>��˾����</a></TD>
                </TR>
              </TBODY>
			  </TABLE>
		    </DIV>
          </TD>
	   </TR>
	</TBODY>
</TABLE>
<%end if%>

<%if session("level") >=4 then%>    
<TABLE cellSpacing=1 cellPadding=0 width=158 align=center  class="a2">
   <TBODY>
      <TR align="center" class="a1">
         <TD class=menu_title id=menuTitle1 onMouseOver="this.className='menu_title2';" onclick=showsubmenu(3) 
              onmouseout="this.className='menu_title';"  style=cursor:hand height=25>
		   <SPAN>
		   <b>���ӹ���</b> 
           </SPAN>
		 </TD>
	  </TR>
	  
        <TR align="center"  class="a3">
          <TD id=submenu3 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
                <TR align="center">
                <TD height=20>
                <a href="manage_tutorial6.asp" target=main>���ӹ���</a></TD>
                </TR>
                <TR align="center">
                <TD height=19>
				<a href="new_tutorial6.asp?action=newart" target=main>��������</a></TD>
                </TR>            
              </TBODY>
			 </TABLE>
			</DIV>
          </TD>
	  </TR>
   </TBODY>
</TABLE>
<%end if%>

<% if   session("level")>=4 then%>		
   <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
     <TBODY>     
		<TR align="center" class="a1">
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(5) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          height=25><SPAN><b>��ϵ����</b></SPAN> 
          </TD>
		</TR>
        <TR align="center" class="a3">
          <TD id=submenu5 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
                <TR align="center">
                <TD height=20>
                <a href="new_tutorial.asp?action=editart&art_id=397" target=main>��ϵ����</a></TD>
                </TR>
              </TBODY>
			  </TABLE>
		    </DIV>
          </TD>
	   </TR>
	</TBODY>
</TABLE>
<%end if%>

<% if   session("level")>=4 then%>		
   <TABLE cellSpacing=1 cellPadding=0 width=158 align=center class="a2">
     <TBODY>     
		<TR align="center" class="a1">
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(15) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          height=25><SPAN><b>���Թ���</b></SPAN> 
          </TD>
		</TR>
        <TR align="center" class="a3">
          <TD id=submenu15 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 156px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
                <TR align="center">
                <TD height=20>
                <a href="message_see.asp" target=main>���Թ���</a></TD>
                </TR>
              </TBODY>
			  </TABLE>
		    </DIV>
          </TD>
	   </TR>
	</TBODY>
</TABLE>
<%end if%>
	  

<table cellspacing="0" cellpadding="0" width="158" align="center" class="a2">
  <TR align="center" class="a1">
     <td align="center" onMouseOver=aa('Down') onMouseOut=StopScroll()><font face="Webdings" color="#FFFFFF">6</font></td>
  </tr>
</table>
