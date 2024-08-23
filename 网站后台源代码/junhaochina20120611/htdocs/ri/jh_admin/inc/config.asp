<%
'******************************************************
'本程序由刘德华修改制作！
'本程序为免费程序，只能个人站点或者非营利性机构或组织！
'QQ:376117502 E-mail:oujianjun376117502@yahoo.com
'******************************************************
dim sessionvar,WebName,weburl,trueurl,logo,webboss,webemail,qq,born,jieshao,from,border,setupdate,add
dim indexnews,diaryperpage,indexdj,indexarticle,indexsoft,indexpic,indexfriendlink,upbig,upimages,e_page
dim newsperpage,adflperpage
dim djperpage,bestdj
dim topdjnum,articleperpage,toparticlenum,face
dim softperpage,newsoft,topsoftnum
dim picperpage,bestpic,toppicnum
dim datename,datecheck
dim menu1,menu2,menu3,menu4,menu5,murl1,murl2,murl3,murl4,murl5
dim usery,guestdj,guestsoft,guestart,guestphoto,guestdiary,guestwish,guestflash
dim datadir,dataname,datadirbak,datanamebak
sessionvar="刘德华"
WebName="『Candy』"
weburl="http://"
trueurl="http://"
logo="logo/logo.gif"
setupdate="2004-6-12"
Webboss="欧建军"
webemail="oujianjun376117502@yahoo.com.cn"
qq=376117502
born="1984-10-06"
from="江苏淮安"
jieshao="<font color='#FF0000'>‖→</font>爱情是一个漫长的旅途，而经历则是我们每一个人必须绘画的白板，成长需要一个适应的过程，跌倒并不意味着失败。"
upimages="upload/"
upbig=1000000
border="#C0C0C0"
face="0"
add="<A HREF='#' target=_blank><IMG SRC=images/banner.gif WIDTH=550 HEIGHT=129 BORDER=0 alt='点击这里进入『Candy』，赶快加入我们的行列吧！'></A><Br>\n"
datename="党的生日"
datecheck="2004-7-1"
 usery="yes"
 guestdj="no"
 guestsoft="no"
 guestart="no"
 guestphoto="no"
 guestdiary="no"
 guestwish="no"
 guestflash="no"
menu1="精彩FLASH"
menu2="心理测试"
menu3="星座缘分"
menu4="心灵祁愿"
menu5="心情日记"
murl1="flash.asp"
murl2="onlinetest.asp"
murl3="star.asp"
murl4="wish.asp"
murl5="rj.asp"
datadir="Database/"
dataname="db.mdb"
datadirbak="DataBackup"
datanamebak="db#.mdb"
indexnews=7
diaryperpage=5
indexdj=5
indexarticle=8
indexsoft=5
indexpic=6
indexfriendlink=8
newsperpage=15
adflperpage=5
djperpage=20
bestdj=7
topdjnum=5
articleperpage=30
toparticlenum=20
softperpage=8
newsoft=5
topsoftnum=10
picperpage=20
bestpic=2
toppicnum=5
e_page=2
%>
