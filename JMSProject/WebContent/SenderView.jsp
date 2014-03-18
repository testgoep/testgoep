<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>"Insert Message on Queue"</title>
</head>

<body bgcolor="green">

<a href="Menu.jsp"><font color="white">
         <% 
			if(session.getAttribute("menu")==null)
			{
				out.println(" Return to \"Menu\" ");
			}
			else
				out.println(session.getAttribute("menu")); 
		 %></font>
</a>
<br>

<a href="ReceiverView.jsp">
     <font color="white">
          <% 
			if(session.getAttribute("menu")==null)
			{
				out.println(" Go to \"Receiver\" ");
			}
			else
				out.println(session.getAttribute("receiver")); 
		 %>
     </font>
</a>
<br><br>

<center>
   <font color= "white" size=20>
         <% 
			if(session.getAttribute("insert")==null)
			{
				out.println("<center><b><font size=50 color=\"white\" face=\"Arial\"> Insert Message on Queue </font></b></center>");
			}
			else
				out.println("<center><b><font size=50 color=\"white\" face=\"Arial\">" + session.getAttribute("insert") + "</font></b></center>"); 
		 %>
   </font>
</center>

<br>

<form action="Sender">
<center>
<br>
<font color = "white"><% 
							if(session.getAttribute("queue")==null)
						{
							out.println("<center><font color=\"white\" face=\"Arial\"> Insert message on queue: </font></center>");
						}
							else
							out.println("<center><font color=\"white\" face=\"Arial\">" + session.getAttribute("queue") + "</font></center>"); 
					   %> 
					   
</font>

<input type = "text" size=40 name = "queueName">

<br><br><br>

<textArea name = "message" rows=4 cols="40">

<% 
							if(session.getAttribute("msg")==null)
						{
							out.println("<center> Insert here the message you want to send </center>");
						}
							else
							out.println(session.getAttribute("msg")); 
%>                       
					   
</textArea>

<br><br>

<input type = "submit" <% if(session.getAttribute("send")==null)
							{       
	                    		 out.println("value=\"Send\"");
							}
						  else
							     out.println("value=\"" + session.getAttribute("send") + "\"");
	                    %>>
</center>
</form>
<br>
<font size= 20 color = "white"> 

	<%
		if(request.getParameter("msg")!=null && request.getParameter("msg").equals("MessageSent"))
			
			out.println("<br><center><IMG widht=\"284\" height=\"52\" src=\"MessageSent.png\" alt=\"alt\"></center>"); 
		
		else if(request.getParameter("msg")!=null && request.getParameter("msg").equals("QueueNotFound"))
		{
			out.println("<br><center><IMG widht=\"286\" height=\"59\" src=\"QueueNotFound.png\" alt=\"alt\"></center>"); 
			out.println("<br><center><IMG widht=\"407\" height=\"55\" src=\"InsertValidQueueName.png\" alt=\"alt\"></center>");
		}
	%>

</font>



</body>
</html>
