<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#999999">
        <tr bgcolor="#FFFFFF">
          <td align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="778" height="89">
            <param name="movie" value="../falsh/w1.swf" />
            <param name="quality" value="high" />
            <embed src="../falsh/w1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="778" height="89"></embed>
          </object>
            fdsa
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="<%=request("pic_width")%>" height="<%=request("pic_height")%>">
            <param name="movie" value="falsh/<%=request("pic_falsh")%>.swf" />
            <param name="quality" value="high" />
            <embed src="falsh/<%=request("pic_falsh")%>.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="<%=request("pic_width")%>" height="<%=request("pic_height")%>"></embed>
          </object></td>
        </tr>
      </table>
</body>
</html>
