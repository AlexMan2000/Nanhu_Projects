<!--#include file="conn.asp"-->
<!--#include file="img_upload.inc"-->
<!--#include file="inc/format.asp"-->
<!--#include file="inc/config.asp"-->
<%
dim upload,file,formName,formPath,iCount,filename,fileExt
set upload=new upload_5xSoft ''�����ϴ�����

 formPath="upload"
 ''��Ŀ¼���(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 


iCount=0
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.filesize<100 then
 	response.write "<font size=2>����ѡ����Ҫ�ϴ����ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</font>"
	response.end
 end if
 	
 if file.filesize>(upbig*1024) then
 	response.write "ͼƬ���ܳ���"&upbig&"K[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</font>"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))

 if fileEXT<>".jpg" and fileEXT<>".gif" and fileEXT<>".bmp" then
 	response.write "<font size=2>�ļ���ʽ����ȷ��[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</font>"
	response.end
 end if 

 randomize
 ranNum=int(90000*rnd)+10000
 filename=formPath&year(now)&month(now)&day(now)&ranNum&fileExt
 
' filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&file.FileName

 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  file.SaveAs Server.mappath(FileName)   ''�����ļ�
'  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" �ɹ�!<br>"
 	if fileEXT=".jpg" then
 	weizhi=FileName
	elseif fileEXT=".gif" then
 	weizhi=FileName
	elseif fileEXT=".bmp" then
 	weizhi=FileName
 	end if
 iCount=iCount+1
 end if
 set file=nothing
next
set upload=nothing  ''ɾ���˶���
response.write "<br>"
dim image
if session("image")="" then
session("image")=weizhi
end if
 file.SaveToFile Server.mappath(FileName)
  response.write "<script>window.opener.document."&session("FormName")&"."&session("EditName")&".value='"&Replace(FileName,"../","")&"'</script>"
%>
<script language="javascript">
window.alert("�ļ��ϴ��ɹ�!�벻Ҫ�޸����ɵ����ӵ�ַ��");
window.close();
</script>