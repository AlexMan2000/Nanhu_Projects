<!--#include file="top.asp"-->
  <table width="917" height="47" border="0" cellpadding="0" cellspacing="0" class="Nav">
  <tr>
    <td><a href="index.asp"><img src="images/home1.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="about.asp"><img src="images/about.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="fenbu.asp"><img src="images/fenbu.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="case.asp"><img src="images/case.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="contact.asp"><img src="images/contact.jpg"/></a></td>
    <td width="2"><img src="images/nav_line.jpg"/></td>
    <td><a href="link.asp"><img src="images/link_2.jpg"/></a></td>
  </tr>
  </table>
</div>
<div id="Main">
<style type="text/css">
.rollBox{width:917px;overflow:hidden; height:260px; font-size:12px; color:#3c545b; line-height:24px; padding-top:35px; padding-bottom:30px;}
.rollBox .Cont{width:746px;overflow:hidden;margin:0 auto;border:3px solid #c3c3c3;}
.rollBox .ScrCont{width:10000000px;}
.rollBox .Cont .pic{width:746px; height:251px;float:left;}
*+html .rollBox .Cont .pic{width:746px; height:251px;float:left;}
.rollBox #List1,.rollBox #List2{float:left;}
 </style>
      <div class="rollBox">
     <div id="Prev"><a href="#" hidefocus="true"><img onMouseDown="ISL_GoDown()" onMouseUp="ISL_StopDown()" onMouseOut="ISL_StopDown()"  class="img1" src="images/prev.jpg" width="71" height="34" /></a>
     </div>
     <div class="Cont" id="ISL_Cont" style="float:left;">
      <div class="ScrCont">
       <div id="List1">
        <!-- 图片列表 begin -->
        <div class="pic">
            <img src="images/banner.jpg"/>
        </div>
      	<div class="pic">
            <img src="images/1.jpg"/>
        </div>
        
        <div class="pic">
            <img src="images/2.jpg"/>
        </div>
        <div class="pic">
            <img src="images/3.jpg"/>
        </div>
        <div class="pic">
            <img src="images/4.jpg"/>
        </div>
        <div class="pic">
            <img src="images/5.jpg"/>
        </div>
        <div class="pic">
            <img src="images/6.jpg"/>
        </div>
        <div class="pic">
            <img src="images/7.jpg"/>
        </div>
        <!-- 图片列表 end -->
       </div>
       <div id="List2"></div>
      </div>
     </div>
	 <div id="Next"><a href="#" hidefocus="true"><img onMouseDown="ISL_GoUp()" onMouseUp="ISL_StopUp()" onMouseOut="ISL_StopUp()"  class="img2" src="images/next.jpg" width="37" height="34" /></a>
     </div>
</div>
<script language="javascript" type="text/javascript">
<!--//--><![CDATA[//><!--
//图片滚动列表 mengjia 070816
var Speed = 15; //速度(毫秒)
var Space = 20; //每次移动(px)
var PageWidth = 746; //翻页宽度
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
AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',2000); //间隔时间
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
<div style="margin-left:7px;"><img src="images/line.jpg"/></div>
<div style="margin-left:7px;"><img src="images/hzhb.jpg"/></div>
<div id="Index_link">
<div id="demol" style="overflow:hidden;height:155px;width:810px;margin:0px auto;">
  <table cellpadding="0" cellspace="0" border="0">
    <tr>
      <td id="demol1">
<table width="810" border="0" cellpadding="0" cellspacing="0">
  <tr>
     <td colspan="11" height="15">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="images/link.jpg" width="125" height="55"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link1.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link2.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link3.jpg"/></td>
    <td>&nbsp;</td>
    <td ><img src="images/link4.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link12.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link13.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link14.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link15.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link16.jpg"/></td>
  </tr>
  <tr>
    <td colspan="11">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="images/link6.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link7.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link8.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link9.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link22.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link23.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link24.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link25.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link26.jpg"/></td>
    <td>&nbsp;</td>
    <td><img src="images/link19.jpg"/></td>
    
    </tr>
</table>
</td>
      <td id="demol2"></td>
    </tr>
  </table>
</div>
<script type="text/javascript">
function MarqueeToLeft(){
var speed=30
var demo =document.getElementById("demol");
var demo1 =document.getElementById("demol1");
var demo2 =document.getElementById("demol2");
var MyMarLeft=setInterval(MarqueeLeft,speed)
demo2.innerHTML=demo1.innerHTML
demo.onmouseover=function() {clearInterval(MyMarLeft)}
demo.onmouseout=function() {MyMarLeft=setInterval(MarqueeLeft,speed)}
function MarqueeLeft(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
   demo.scrollLeft-=demo1.offsetWidth
else{
   demo.scrollLeft++
}
}
}
MarqueeToLeft()
</script>
</div>
<div style="clear:both"></div>
</div>
<!--#include file="foot.asp"-->