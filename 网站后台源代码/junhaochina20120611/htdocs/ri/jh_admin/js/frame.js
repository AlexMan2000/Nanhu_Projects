///////////////////////////////////////////////////////////////////////
///////////                Ajax �첽ͨѶ���                ///////////
///////////    �������ڣ����ڶ���2006��06��27�� 13:10:15    ///////////
///////////�������ƣ�frame.js                               ///////////
///////////ԭ�����ߣ�����                                   ///////////
///////////˵��������ܿɹ��κ���ѧϰ��ʹ�ã���������ʹ��ʱ ///////////
///////////������˵���ļ���                                 ///////////
///////////�����ʼ���sucsy@sina.com                         ///////////
///////////��Ȩ����(C)�������繤����                        ///////////
///////////////////////////////////////////////////////////////////////
//========================ͨѶ���==============================
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
		//========================ͨѶ���==============================
		//========================��Ϣ���==============================
		//���в����ĺ�����װΪ�޲����ĺ��� 
		function createFunction(obj,strFunc)
		{ 
			 var args=[];  //����args���ڴ洢���ݸ��¼��������Ĳ��� 
			 if(!obj)obj=window; //�����ȫ�ֺ�����obj=window; 
			 //�õ����ݸ��¼��������Ĳ��� 
			 for(var i=2;i<arguments.length;i++)args.push(arguments[i]); 
			 //���޲���������װ�¼��������ĵ��� 			
			 return  function(){ obj[strFunc].apply(obj,args);}//���������ݸ�ָ�����¼�������� 
		} 
		//========================��Ϣ���==============================
		function Trim(Str){if(Str==null){Str="";
		}Str=Str.replace(/^\s+/g,"");
		return Str.replace(/\s+$/g,"");
		};