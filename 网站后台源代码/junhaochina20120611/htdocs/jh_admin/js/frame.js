///////////////////////////////////////////////////////////////////////
///////////                Ajax 异步通讯框架                ///////////
///////////    创建日期：星期二，2006年06月27日 13:10:15    ///////////
///////////档案名称：frame.js                               ///////////
///////////原创作者：陈朕                                   ///////////
///////////说明：本框架可供任何人学习与使用，但是请在使用时 ///////////
///////////保留本说明文件。                                 ///////////
///////////作者邮件：sucsy@sina.com                         ///////////
///////////版权所有(C)创新网络工作室                        ///////////
///////////////////////////////////////////////////////////////////////
//========================通讯框架==============================
    function createXMLHttpRequest()
	{		
	    var g_xhRequest=null;
		try
		{
			g_xhRequest= new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e)
		{
		    g_xhRequest=null;
		}
		if(g_xhRequest==null)
		{
		    try
		    {
			    g_xhRequest=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    catch(e)
		    {
		        g_xhRequest=null;
		    }
		    if(g_xhRequest==null)
		    {
		        try
		        {
			        g_xhRequest= new XMLHttpRequest();
		        }
		        catch(e)
		        {
		            g_xhRequest= null;
		        }	
		    }
		}	
		return g_xhRequest;	
	}
		
		
		function SendRequest(url,callback)
		{
		    var g_xhRequest=null;
			g_xhRequest=createXMLHttpRequest();
			if(g_xhRequest!=null&&(g_xhRequest.readyState!=0&&g_xhRequest.readyState!=4))
			{
				g_xhRequest.abort();
			}
			g_xhRequest=createXMLHttpRequest();
			if(g_xhRequest==null)
			{
				window.status="Global: XMLHttpRequest not supported";
			}
			try
			{		    
				g_xhRequest.onreadystatechange=createFunction(null,"updatePage",callback,g_xhRequest);				
				g_xhRequest.open("GET",url,true);
				g_xhRequest.send(null);				
			}catch(e)
			{
				window.status="Global: XMLHttpRequest Send Error:["+e+"]";
			}			
		}
		function updatePage(callback,g_xhRequest) 
		 {
			if(g_xhRequest.readyState == 4)
			{
				if(g_xhRequest.status == 200)
				{	
				       callback(g_xhRequest.responseText);						    					
				}
				else if (g_xhRequest.status == 404)
				{
					window.status="File lost!";						
				}
				else if (g_xhRequest.status == 500)
				{
					window.status="server Error!";	
				}
				else
				{
					window.status="Error: status code is " + g_xhRequest.status;	
				}
			}			
		}
		//========================通讯框架==============================
		//========================消息框架==============================
		//将有参数的函数封装为无参数的函数 
		function createFunction(obj,strFunc)
		{ 
			 var args=[];  //定义args用于存储传递给事件处理程序的参数 
			 if(!obj)obj=window; //如果是全局函数则obj=window; 
			 //得到传递给事件处理程序的参数 
			 for(var i=2;i<arguments.length;i++)args.push(arguments[i]); 
			 //用无参数函数封装事件处理程序的调用 			
			 return  function(){ obj[strFunc].apply(obj,args);}//将参数传递给指定的事件处理程序 
		} 
		//========================消息框架==============================
		function Trim(Str){if(Str==null){Str="";
		}Str=Str.replace(/^\s+/g,"");
		return Str.replace(/\s+$/g,"");
		};