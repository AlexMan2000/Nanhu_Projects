<html>
<head>
<title>∷ 管理中心 ∷</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<META http-equiv="refresh" content="500;">
<style type="text/css">.navPoint {COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt}</style>

<script>
function switchSysBar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frmTitle").style.display="none"
}else{
switchPoint.innerText=3
document.all("frmTitle").style.display=""
}}
</script>
<link href="inc/adminstyle.css" rel="stylesheet">
<body scroll=no topmargin=0  rightmargin=0  leftmargin=0>
<table border="0" cellPadding="0" cellSpacing="0" height="100%" width="100%">
  <tr>
    <td align="middle" id="frmTitle" noWrap vAlign="center" name="frmTitle">
    <iframe frameBorder="0" id="carnoc" name="carnoc" scrolling=no  src="leftmenu.asp" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 170px; Z-INDEX: 2">
    </iframe>
    </td>
    <td class=a2 style="WIDTH: 9pt">
    <table border="0" cellPadding="0" cellSpacing="0" height="100%">
      <tr>
        <td style="HEIGHT: 100%" onClick="switchSysBar()">
        <font style="FONT-SIZE: 9pt; CURSOR: default; COLOR: #ffffff">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <span class="navPoint" id="switchPoint" title="关闭/打开左栏">3</span><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        屏幕切换 </font></td>
      </tr>
    </table>
    </td>
    <td style="WIDTH: 100%">
    <iframe frameBorder="0" id="main" name="main" scrolling="yes" src="login.asp" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1">
    </iframe>
	</td>
  </tr>
</table>
</html>