<script language="JavaScript">
<!--
function insertstr(str)
{document.form1.news_content.value=document.form1.news_content.value+str;}
var Quote = 0;
var Bold  = 0;
var Italic = 0;
var Underline = 0;
var Code = 0;
var Center = 0;
var Strike = 0;
var Sound = 0;
var Swf = 0;
var Ra = 0;
var Rm = 0;
var Marquee = 0;
var Fly = 0;
var fanzi=0;
var text_enter_url      = "ÇëÊäÈëÁ¬½ÓÍøÖ·";
var text_enter_iFrame      = "ÇëÊäÈëÁ¬½ÓÍøÖ·";
var text_enter_txt      = "ÇëÊäÈëÁ¬½ÓËµÃ÷";
var text_enter_image    = "ÇëÊäÈëÍ¼Æ¬ÍøÖ·";
var text_enter_sound    = "ÇëÊäÈëÉùÒôÎÄ¼þÍøÖ·";
var text_enter_swf      = "ÇëÊäÈëFLASH¶¯»­ÍøÖ·";
var text_enter_ra      = "ÇëÊäÈëRealÒôÀÖÍøÖ·";
var text_enter_rm      = "ÇëÊäÈëRealÓ°Æ¬ÍøÖ·";
var text_enter_wmv      = "ÇëÊäÈëMediaÓ°Æ¬ÍøÖ·";
var text_enter_wma      = "ÇëÊäÈëMediaÒôÀÖÍøÖ·";
var text_enter_mov      = "ÇëÊäÈëQuickTimeÒôÀÖÍøÖ·";
var text_enter_sw      = "ÇëÊäÈëshockwaveÒôÀÖÍøÖ·";
var text_enter_email    = "ÇëÊäÈëÓÊ¼þÍøÖ·";
var error_no_url        = "Äú±ØÐëÊäÈëÍøÖ·";
var error_no_txt        = "Äú±ØÐëÁ¬½ÓËµÃ÷";
var error_no_title      = "Äú±ØÐëÊäÈëÊ×Ò³±êÌâ";
var error_no_email      = "Äú±ØÐëÊäÈëÓÊ¼þÍøÖ·";
var error_no_gset       = "±ØÐëÕýÈ·°´ÕÕ¸÷Ê½ÊäÈë£¡";
var error_no_gtxt       = "±ØÐëÊäÈëÎÄ×Ö£¡";
var text_enter_guang1   = "ÎÄ×ÖµÄ³¤¶È¡¢ÑÕÉ«ºÍ±ß½ç´óÐ¡";
var text_enter_guang2   = "Òª²úÉúÐ§¹ûµÄÎÄ×Ö£¡";
function commentWrite(NewCode) {
document.form1.news_content.value+=NewCode;
document.form1.news_content.focus();
return;
}
function storeCaret(text) { 
	if (text.createTextRange) {
		text.caretPos = document.selection.createRange().duplicate();
	}
        if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('Ìû×ÓÕýÔÚ·¢³ö£¬ÇëÄÍÐÄµÈ´ý£¡');return false;}this.document.form.submit();}
}
function AddText(text) {
	if (document.form1.news_content.createTextRange && document.form1.news_content.caretPos) {      
		var caretPos = document.form1.news_content.caretPos;      
		caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?
		text + ' ' : text;
	}
	else document.form1.news_content.value += text;
	document.form1.news_content.focus(caretPos);
}
function inputs(str)
{
AddText(str);
}
function Curl() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_url, "http://");
var enterTxT   = prompt(text_enter_txt, enterURL);
if (!enterURL)    {
FoundErrors += "\n" + error_no_url;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_txt;
}
if (FoundErrors)  {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[URL="+enterURL+"]"+enterTxT+"[/URL]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cimage() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_image, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[IMG]"+enterURL+"[/IMG]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function CiFrame() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_iFrame, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[frame]"+enterURL+"[/frame]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cemail() {
var emailAddress = prompt(text_enter_email,"");
if (!emailAddress) { alert(error_no_email); return; }
var ToAdd = "[EMAIL]"+emailAddress+"[/EMAIL]";
commentWrite(ToAdd);
}
function Ccode() {
if (Code == 0) {
ToAdd = "[CODE]";
document.form.code.value = " ´úÂë*";
Code = 1;
} else {
ToAdd = "[/CODE]";
document.form.code.value = " ´úÂë ";
Code = 0;
}
commentWrite(ToAdd);
}
function Cquote() {
fontbegin="[QUOTE]";
fontend="[/QUOTE]";
fontchuli();
}
function Cbold() {
fontbegin="[B]";
fontend="[/B]";
fontchuli();
}
function Citalic() {
fontbegin="[I]";
fontend="[/I]";
fontchuli();
}
function Cunder() {
fontbegin="[U]";
fontend="[/U]";
fontchuli();
}
function Ccenter() {
fontbegin="[center]";
fontend="[/center]";
fontchuli();
}
function Cstrike() {
fontbegin="[strike]";
fontend="[/strike]";
fontchuli();
}
function Csound() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_sound, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[SOUND]"+enterURL+"[/SOUND]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}

function Cswf() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_swf, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[FLASH]"+enterURL+"[/FLASH]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cra() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_ra, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[RA]"+enterURL+"[/RA]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Crm() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_rm, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[RM=500,350]"+enterURL+"[/RM]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cwmv() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_wmv, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[MP=500,350]"+enterURL+"[/MP]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}

function Cfanzi() {
fontbegin="[xray]";
fontend="[/xray]";
fontchuli();
}

function Cwma() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_wma, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[wma]"+enterURL+"[/wma]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cmov() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_mov, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[QT=500,350]"+enterURL+"[/QT]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cdir() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_sw, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[DIR=500,350]"+enterURL+"[/DIR]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}
function Cmarquee() {
fontbegin="[move]";
fontend="[/move]";
fontchuli();
}
function Cfly() {
fontbegin="[fly]";
fontend="[/fly]";
fontchuli();
}

function paste(text) {
	if (opener.document.form1.news_content.createTextRange && opener.document.form1.news_content.caretPos) {      
		var caretPos = opener.document.form1.news_content.caretPos;      
		caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?
		text + ' ' : text;
	}
	else opener.document.form1.news_content.value += text;
	opener.document.form1.news_content.focus(caretPos);
}

function showsize(size){
fontbegin="[size="+size+"]";
fontend="[/size]";
fontchuli();
}

function showfont(font){
fontbegin="[face="+font+"]";
fontend="[/face]";
fontchuli();
}

function showcolor(color){
fontbegin="[color="+color+"]";
fontend="[/color]";
fontchuli();
}

function fontchuli(){
if ((document.selection)&&(document.selection.type == "Text")) {
var range = document.selection.createRange();
var ch_text=range.text;
range.text = fontbegin + ch_text + fontend;
} 
else {
document.form1.news_content.value=fontbegin+document.form1.news_content.value+fontend;
document.form1.news_content.focus();
}
}

function Cguang() {
var FoundErrors = '';
var enterSET   = prompt(text_enter_guang1, "255,red,2");
var enterTxT   = prompt(text_enter_guang2, "ÎÄ×Ö");
if (!enterSET)    {
FoundErrors += "\n" + error_no_gset;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_gtxt;
}
if (FoundErrors)  {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[glow="+enterSET+"]"+enterTxT+"[/glow]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}

function Cying() {
var FoundErrors = '';
var enterSET   = prompt(text_enter_guang1, "255,blue,1");
var enterTxT   = prompt(text_enter_guang2, "ÎÄ×Ö");
if (!enterSET)    {
FoundErrors += "\n" + error_no_gset;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_gtxt;
}
if (FoundErrors)  {
alert("´íÎó£¡"+FoundErrors);
return;
}
var ToAdd = "[SHADOW="+enterSET+"]"+enterTxT+"[/SHADOW]";
document.form1.news_content.value+=ToAdd;
document.form1.news_content.focus();
}

ie = (document.all)? true:false
if (ie){
function ctlent(eventobject){if(event.ctrlKey && window.event.keyCode==13){this.document.form1.submit();}}
}
function DoTitle(addTitle) { 
var revisedTitle; 
var currentTitle = document.form1.subject.value; 
revisedTitle = currentTitle+addTitle; 
document.form1.subject.value=revisedTitle; 
document.form1.subject.focus(); 
return; }

function insertsmilie(smilieface){

	document.form1.news_content.value+=smilieface;
}
//-->
</script>