<!--#include file="conn.asp"-->
<!--#include file="img_upload.inc"-->
<!--#include file="inc/format.asp"-->
<!--#include file="inc/config.asp"-->
<%
dim upload,file,formName,formPath,iCount,filename,fileExt
set upload=new upload_5xSoft ''建立上传对象

 formPath="upload"
 ''在目录后加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 


iCount=0
for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.filesize<100 then
 	response.write "<font size=2>请先选择你要上传的文件　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if
 	
 if file.filesize>(upbig*1024) then
 	response.write "图片不能超过"&upbig&"K[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))

 if fileEXT<>".jpg" and fileEXT<>".gif" and fileEXT<>".bmp" then
 	response.write "<font size=2>文件格式不正确　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if 

 randomize
 ranNum=int(90000*rnd)+10000
 filename=formPath&year(now)&month(now)&day(now)&ranNum&fileExt
 
' filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&file.FileName

 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  file.SaveAs Server.mappath(FileName)   ''保存文件
'  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
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
set upload=nothing  ''删除此对象
response.write "<br>"
dim image
if session("image")="" then
session("image")=weizhi
end if
 file.SaveToFile Server.mappath(FileName)
  response.write "<script>window.opener.document."&session("FormName")&"."&session("EditName")&".value='"&Replace(FileName,"../","")&"'</script>"
%>
<script language="javascript">
window.alert("文件上传成功!请不要修改生成的链接地址！");
window.close();
</script>