<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body bgcolor = "green">

<a href="index.jsp"><font color="white">
Return to "Menu"</font>
</a>
<br><br>

<center><font color= "white" size=20><% 
										if(session.getAttribute("insert")==null)
										{
											out.println("<center><b><font size=50 color=\"white\" face=\"Arial\" Read a Message from Queue </font></b></center>");
										}
										else
											out.println("<center><b><font size=50 color=\"white\" face=\"Arial\">" + session.getAttribute("read") + "</font></b></center>"); 
		 							  %>
</font></center>
<br>

<form action="Receiver">

<center>
<br>
<font color = "white"><% 
							if(session.getAttribute("queue")==null)
						{
							out.println("<center><font color=\"white\" face=\"Arial\"> Insert the queue name: </font></center>");
						}
							else
							out.println("<center><b><font color=\"white\" face=\"Arial\">" + session.getAttribute("queue") + "</font></b></center>"); 
					   %>  </font>
					   
<input type = "text" size=40 name = "queueName">

<br><br>
<input type = "submit" <% if(session.getAttribute("receive")==null)
							{       
	                    		 out.println("value=\"Receive\"");
							}
						  else
							     out.println("value=\"" + session.getAttribute("receive") + "\"");
	                    %>>
</center>

</form>

<font size= 20 color = "white"> 

	<%
		if(request.getParameter("msg")!=null && (request.getParameter("msg").equals("QueueIsEmpty")))
		 {	
			
			 out.println("<br><center><IMG widht=\"304\" height=\"67\" src=\"QueueEmpty.png\" alt=\"alt\"></center>");
		
		 }
		else if(request.getParameter("msg")!=null && (request.getParameter("msg").equals("QueueNotFound")))
			{
			out.println("<br><center><IMG widht=\"286\" height=\"59\" src=\"QueueNotFound.png\" alt=\"alt\"></center>"); 
			out.println("<br><center><IMG widht=\"407\" height=\"55\" src=\"InsertValidQueueName.png\" alt=\"alt\"></center>");
			}
	    
		else if(request.getParameter("msg")!=null)
		{
	        out.print("<br><center><IMG widht=\"32\" height=\"35\" src=\"MessageSentOk.png\" alt=\"alt\">  <FONT style=\"BACKGROUND-COLOR: white\" color=\"black\"> " + request.getParameter("msg") + "</FONT>  <IMG widht=\"32\" height=\"35\" src=\"C:/Users/fulvio.cicerano/eclipseWorkspace/MessageSentOk.png\" alt=\"alt\"></center>");
		}
		 
	%>

</font>



</body>
</html>
