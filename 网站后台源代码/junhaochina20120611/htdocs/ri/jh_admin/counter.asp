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
D1 = rs("inputdate")                                                   ' ��ʼͳ������(��/��/��)
D2 = DateValue(N)
D3 = DateDiff("d", D1, D2)


response.write "<SCRIPT LANGUAGE=JavaScript>" & vbcrlf
response.write "<!--" & vbcrlf
response.write "cou=""<a onMouseOut=toolTip() onMouseOver="&chr(92)&"""toolTip('"

N = Now
D2 = DateValue(N)
D1 = rs("inputdate")                                                   ' ��ʼͳ������(��/��/��)
response.write  "��&nbsp;&nbsp;&nbsp;&nbsp;�У�&nbsp;"
GCounter( DateDiff("d", D1, D2) )
response.write  " �� "
D3 = DateDiff("d", D1, D2)
response.write  "<Br>ƽ&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;"
GCounter( RS("TOTAL")\D3 )
response.write  " ��/��<br>"

response.write "��ǰ���ߣ�&nbsp;"
GCounter(online)
response.write " ��<br>"

response.write  "��&nbsp;&nbsp;&nbsp;&nbsp;�£�&nbsp;"
GCounter( RS("MONTH") )
response.write  " ��<br>"
response.write  "��&nbsp;&nbsp;&nbsp;&nbsp;�£�&nbsp;"
GCounter( RS("BMONTH") )
response.write  " ��<br>"
response.write  "��&nbsp;&nbsp;&nbsp;&nbsp;�գ�&nbsp;"
GCounter( RS("YESTERDAY") )
response.write  " ��')"&chr(92)&""">"
response.write "��վ�ԣ�"&D1&" ��IP������  <b>[</b> "
response.write  "�ܷ�������<b><font color=#008000>"
GCounter( RS("TOTAL") )
response.write  "</b></font>  ���գ�<font color=#008000>"
GCounter( RS("TODAY") )
response.write  "</font> �� <b>]</b></a><Br><br> """ & vbcrlf
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