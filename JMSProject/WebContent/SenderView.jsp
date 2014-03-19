<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 		<title>"Sender"</title>
 		
	</head>

	
	<body bgcolor="green">

		<a href="index.jsp">
		
			<font color="white">
         						 <% 
									if(session.getAttribute("menu")==null)
									 {
										 out.println(" Return to \"Menu\" ");
									 }
									else
										 out.println(session.getAttribute("menu")); 
		 						 %>
		 	</font>
		 	
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
   
   		<font color= "white" size=10 face="Arial">
						         <% 
									if(session.getAttribute("insert")==null)
									{
										out.println("<b> Insert Message on Queue </b>");
									}
									else
										out.println("<b>" + session.getAttribute("insert") + "</b>"); 
								 %>
   		</font>
   		
	</center>

	<br>

		
	<form action="Sender">

		<center>
	
			<br>
			
            	<center>
					
					<font color = "white" face="Arial">
									   <% 
										if(session.getAttribute("queue")==null)
										 {
											out.println("Insert here a valid queue name:");
										 }
										else
											out.println(session.getAttribute("queue")); 
					   				   %> 
					   
					</font>
					
				</center>

			<input type = "text" size=40 name = "queueName">

			<br><br><br>

           <font color= "white" size=4> 										
           							
           							<% 
									  if(session.getAttribute("msg")==null)
										{
												out.println("Insert here the message you want to send:");
										}
									  else
												out.println(session.getAttribute("msg")); 
									 %> 
									 
		   </font>

           <br>
           
		   <textArea name = "message" rows=1 cols="50">  </textArea>

		   <br><br>

		   <input type = "submit" <% 
									 if(session.getAttribute("send")==null)
									  {       
	                    		 		  out.println("value=\"Send\"");
									  }
						  			 else
							     		  out.println("value=\"" + session.getAttribute("send") + "\"");
	                    		   %>>
		</center>
		
	</form>
	
	 <br>
	
	 <center>
	 
	 	<font size= 20 color = "white"> 
	   								   <%
											if(request.getParameter("msg")!=null && request.getParameter("msg").equals("MessageSent"))
				
												out.println("<IMG widht=\"284\" height=\"52\" src=\"MessageSent.png\" alt=\"alt\">"); 
			
											else if(request.getParameter("msg")!=null && request.getParameter("msg").equals("QueueNotFound"))
											 {
												out.println("<br><IMG widht=\"286\" height=\"59\" src=\"QueueNotFound.png\" alt=\"alt\">"); 
				
												out.println("<br><IMG widht=\"407\" height=\"55\" src=\"InsertValidQueueName.png\" alt=\"alt\">");
											 }
									   %>
	 	</font>
	 	
	 </center>

  </body>

</html>
