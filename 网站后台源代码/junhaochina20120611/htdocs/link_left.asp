<div style="padding-top:25px;"><img src="images/hz_left.jpg"/></div>
<div id="demot" style="overflow: hidden; widht: 194px; height:230px;margin-left:5px; margin-top:10px;">
<table border="0" cellpadding="0" cellspacing="0" width="194">
     <tr>
      <td id="demot1">
  <table width="194" border="0" cellpadding="0" cellspacing="0" height="230">
  <tr>
    <td width="93">&nbsp;</td>
    <td width="18">&nbsp;</td>
    <td width="93">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="images/hz_link.jpg" width="91" height="40" /></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link1.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link2.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link3.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link4.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link6.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link8.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link7.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link14.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link9.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link12.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link13.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link16.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link15.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link19.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link26.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link22.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link23.jpg" width="91" height="40"/></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td><img src="images/hz_link24.jpg" width="91" height="40"/></td>
    <td>&nbsp;</td>
    <td><img src="images/hz_link25.jpg" width="91" height="40"/></td>
  </tr>
</table>
</td>
    </tr>
    <tr>
      <td id="demot2"></td>
    </tr>
  </table>
</div>
<script type="text/javascript">
function MarqueeToTop(){
var speed=30
var demo =document.getElementById("demot");
var demo1 =document.getElementById("demot1");
var demo2 =document.getElementById("demot2");
var MyMarTop=setInterval(MarqueeTop,speed)
demo2.innerHTML=demo1.innerHTML
//ԭ���ǲ��ϵ���demoh2������demoh1�е����ݣ�Ȼ���Ѿ������������
//��һ������һ�еı����һ���ٷ�һ��װ�������ݵı�񣬶���Ϊdemoh1����һ���ǿյ�TD������Ϊdemoh2
//SPEED�����������ٶȵġ�
demo.onmouseover=function(){ clearInterval(MyMarTop) }
demo.onmouseout=function(){ MyMarTop=setInterval(MarqueeTop,speed) }
function MarqueeTop(){
if(demo2.offsetHeight-demo.scrollTop<=0)
   demo.scrollTop-=demo1.offsetHeight
else{
   demo.scrollTop++
}
}
}
MarqueeToTop()
</SCRIPT>
