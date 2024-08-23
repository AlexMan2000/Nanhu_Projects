<%
mode = LCASE(Request("mode"))
gif  = Request("gif")

SET rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "Select * From counters" ,conn,1,3

if Request.Cookies("IsFirst")=fail then
LASTIP = RS("LASTIP")
NEWIP = REQUEST.servervariables("REMOTE_ADDR")

IF CSTR(Month(RS("DATE"))) <> CSTR(Month(DATE())) THEN

       RS("DATE") = DATE()
       RS("YESTERDAY") = RS("TODAY")
       RS("BMONTH") = RS("MONTH")
       RS("MONTH") = 1
       RS("TODAY") = 1
       RS.Update
ELSE
   IF CSTR(Day(RS("DATE"))) <> CSTR(Day(DATE())) THEN
       RS("DATE") = DATE()
       RS("YESTERDAY") = RS("TODAY")
       RS("TODAY") = 1
       RS.Update
   END IF
response.Cookies("IsFirst")=true
END IF
RS("LASTIP")=NEWIP
RS("TOTAL")  =  RS("TOTAL") + 1
RS("TODAY") =  RS("TODAY") + 1
RS("MONTH")  =  RS("MONTH") + 1
RS.Update
Session("UserID")=RS("TOTAL")

end if

t=(cint(day(date()))*24+cint(hour(time())))*60+cint(minute(time()))
k=0
i=1
y=0
Do While application("zxip"&i)<>""
	if application("zxip"&i)=Request.ServerVariables("REMOTE_ADDR")  then
		application("zxsj"&i)=t
		y=1
	end if
	if t-application("zxsj"&i)>9 or t<application("zxsj"&i) then
		k=k+1
	else
		if k>0 then
			application.lock
			application("zxip"&i-k)=application("zxip"&i)
			application("zxsj"&i-k)=application("zxsj"&i)
			application.unlock
		end if
	end if
	if k>0 then
		application.lock
		application("zxip"&i)=""
		application.unlock
	end if
	i=i+1
loop
if y=0 then
	application("zxip"&i)=Request.ServerVariables("REMOTE_ADDR")
	application("zxsj"&i)=t
else
	i=i-1
end if
online=i


N = Now
D1 = rs("inputdate")                                                   ' 开始统计日期(月/日/年)
D2 = DateValue(N)
D3 = DateDiff("d", D1, D2)


response.write "<SCRIPT LANGUAGE=JavaScript>" & vbcrlf
response.write "<!--" & vbcrlf
response.write "cou=""<a onMouseOut=toolTip() onMouseOver="&chr(92)&"""toolTip('"

N = Now
D2 = DateValue(N)
D1 = rs("inputdate")                                                   ' 开始统计日期(月/日/年)
response.write  "运&nbsp;&nbsp;&nbsp;&nbsp;行：&nbsp;"
GCounter( DateDiff("d", D1, D2) )
response.write  " 天 "
D3 = DateDiff("d", D1, D2)
response.write  "<Br>平&nbsp;&nbsp;&nbsp;&nbsp;均：&nbsp;"
GCounter( RS("TOTAL")\D3 )
response.write  " 人/天<br>"

response.write "当前在线：&nbsp;"
GCounter(online)
response.write " 人<br>"

response.write  "本&nbsp;&nbsp;&nbsp;&nbsp;月：&nbsp;"
GCounter( RS("MONTH") )
response.write  " 人<br>"
response.write  "上&nbsp;&nbsp;&nbsp;&nbsp;月：&nbsp;"
GCounter( RS("BMONTH") )
response.write  " 人<br>"
response.write  "昨&nbsp;&nbsp;&nbsp;&nbsp;日：&nbsp;"
GCounter( RS("YESTERDAY") )
response.write  " 人')"&chr(92)&""">"
response.write "本站自："&D1&" 起IP访问量  <b>[</b> "
response.write  "总访问量：<b><font color=#008000>"
GCounter( RS("TOTAL") )
response.write  "</b></font>  今日：<font color=#008000>"
GCounter( RS("TODAY") )
response.write  "</font> 人 <b>]</b></a><Br><br> """ & vbcrlf
response.write "//-->" & vbcrlf
response.write "</Script>"

rs.Close
Function GCounter( counter )
   Dim S, i, G
   S = CStr( counter )

   For i = 1 to Len(S)
      G = G & "" & Mid(S, i, 1) & ""
   Next
   response.write G
End Function
%>