<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="css.css" type="text/css" rel="stylesheet"/>
<!-- Website design 网站建设 上海天照信息科技有限公司 网址：www.SWHL.com.cn 电话：021-51696162 咨询QQ:34067779 E-mail:colin06@163.com-->
<title>上海隽昊展览服务有限公司</title>
</head>

<body>
<style type="text/css">
.rollBox{width:917px;overflow:hidden; height:155px;}
.rollBox .Cont{width:810px;overflow:hidden;margin:0 auto; padding-top:15px;}
.rollBox .ScrCont{width:10000000px;}
.rollBox .Cont .pic{width:810px;float:left;}
*+html .rollBox .Cont .pic{width:810px;float:left;}
.rollBox #List1,.rollBox #List2{float:left;}
 </style>
 <div id="Index_link">
      <div class="rollBox">
     <div style="float:left; margin-top:65px; display:inline;margin-left:18px; margin-right:25px;"><img onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()"  class="img1" src="images/prev1.jpg" width="13" height="20" />
     </div>
     <div class="Cont" id="ISL_Cont" style="float:left;">
      <div class="ScrCont">
       <div id="List1">
        <!-- 图片列表 begin -->
        <div class="pic">
           <table width="810" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
              </tr>
              <tr>
                <td colspan="11">&nbsp;</td>
              </tr>
              <tr>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
              </tr>
            </table>

        </div>
      	<div class="pic">
          <table width="810" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
              </tr>
              <tr>
                <td colspan="11">&nbsp;</td>
              </tr>
              <tr>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link1.jpg" width="125" height="55"/></td>
                <td>&nbsp;</td>
                <td><img src="images/link2.jpg" width="125" height="55"/></td>
              </tr>
            </table>
        </div>
        <!-- 图片列表 end -->
       </div>
       <div id="List2"></div>
      </div>
     </div>
	 <div style="float:left; margin-top:65px;display:inline; margin-left:25px;"><img onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"  class="img2" src="images/next1.jpg" width="13" height="20" />
     </div>
</div>
<script language="javascript" type="text/javascript">
<!--//--><![CDATA[//><!--
//图片滚动列表 mengjia 070816
var Speed = 20; //速度(毫秒)
var Space = 20; //每次移动(px)
var PageWidth = 810; //翻页宽度
var fill = 0; //整体移位
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function(){clearInterval(AutoPlayObj);}
GetObj("ISL_Cont").onmouseout = function(){AutoPlay();}
AutoPlay();
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval

('document.all.'+objName)}}
function AutoPlay(){ //自动滚动
clearInterval(AutoPlayObj);
AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',5000); //间隔时间
}
function ISL_GoUp(){ //上翻开始
if(MoveLock) return;
clearInterval(AutoPlayObj);
MoveLock = true;
MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
}
function ISL_StopUp(){ //上翻停止
clearInterval(MoveTimeObj);
if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
CompScr();
}else{
MoveLock = false;
}
AutoPlay();
}
function ISL_ScrUp(){ //上翻动作
if(GetObj('ISL_Cont').scrollLeft <= 0){GetObj('ISL_Cont').scrollLeft = GetObj

('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth}
GetObj('ISL_Cont').scrollLeft -= Space ;

}
function ISL_GoDown(){ //下翻
clearInterval(MoveTimeObj);
if(MoveLock) return;
clearInterval(AutoPlayObj);
MoveLock = true;
ISL_ScrDown();
MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
}
function ISL_StopDown(){ //下翻停止
clearInterval(MoveTimeObj);
if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
CompScr();
}else{
MoveLock = false;
}
AutoPlay();
}
function ISL_ScrDown(){ //下翻动作
if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){GetObj('ISL_Cont').scrollLeft =

GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;}
GetObj('ISL_Cont').scrollLeft += Space ;
}
function CompScr(){
var num;
if(Comp == 0){MoveLock = false;return;}
if(Comp < 0){ //上翻
if(Comp < -Space){
   Comp += Space;
   num = Space;
}else{
   num = -Comp;
   Comp = 0;
}
GetObj('ISL_Cont').scrollLeft -= num;
setTimeout('CompScr()',Speed);
}else{ //下翻
if(Comp > Space){
   Comp -= Space;
   num = Space;
}else{
   num = Comp;
   Comp = 0;
}
GetObj('ISL_Cont').scrollLeft += num;
setTimeout('CompScr()',Speed);
}
}
//--><!]]>
</script>
</div>
</body>
</html>
