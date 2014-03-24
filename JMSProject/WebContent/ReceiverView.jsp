<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 	<title>Receiver</title>
 	
	</head>

		<body bgcolor = "green">

			<a href="index.jsp"><font color="white"><% 
													  if(session.getAttribute("menu")==null)
														{
															out.println(" Return to \"Menu\" ");
														}
													  else
															out.println(session.getAttribute("menu")); 
		 											 %></font> </a>
			<br><br><br>

			
			
			<center>
			
				<b>
			
					<font size=10 color="white" face="Arial">
													 		<% 
																if(session.getAttribute("read")==null)
																 {
													    
																	out.println("Read a Message from Queue");
														
													 			 }
																 else
																 {
																	out.println(session.getAttribute("read")); 
														 
																 }
		 							  		  				%>
				
					</font>
				</b>
				
			</center>		
			
			
			<br><br>

			<form action="Receiver">

				<center>
					
					<br>

					<font color = "white" size=3 face="Arial"><% 
							
											if(session.getAttribute("queue")==null)
											 {
												out.println("Insert the queue name:");
											 }
											else
												out.println(session.getAttribute("queue")); 
					  					   %>  
					</font>
					 
					<br>
					  
				    <input type = "text" size=40 name = "queueName">

				    <br><br>
				    
				    <input type = "submit" <% 
				 						 if(session.getAttribute("receive")==null)
										  {       
	                    		 				out.println("value=\"Receive\"");
										  }
						  				 else
								    				out.println("value=\"" + session.getAttribute("receive") + "\"");
	                   				    %>>
				</center>

			</form>

            <br>
            
            <center>
            
				<font size= 20 color = "white"> 

										      <%
												 if(request.getParameter("msg")!=null && (request.getParameter("msg").equals("QueueIsEmpty")))
											  		{	
			
			 											out.println("<IMG widht=\"304\" height=\"67\" src=\"resources/QueueEmpty.png\" alt=\"alt\">");
		
		 									 	    }
										   
											 	 else if(request.getParameter("msg")!=null && (request.getParameter("msg").equals("QueueNotFound")))
											  		{
													out.println("<IMG widht=\"286\" height=\"59\" src=\"resources/QueueNotFound.png\" alt=\"alt\">"); 
													out.println("<br><IMG widht=\"407\" height=\"55\" src=\"resources/InsertValidQueueName.png\" alt=\"alt\">");
											 	    }
	    
											 	 else if(request.getParameter("msg")!=null)
											 	    {
	        										out.print("<IMG widht=\"32\" height=\"35\" src=\"resources/MessageSentOk.png\" alt=\"alt\">  <FONT style=\"BACKGROUND-COLOR: white\" color=\"black\">-" + request.getParameter("msg") + "-</FONT>  <IMG widht=\"32\" height=\"35\" src=\"resources/MessageSentOk.png\" alt=\"alt\"></center>");
											  		}
		 
											   %>

			 	</font>
			 	
			</center>

	 </body>

</html>
