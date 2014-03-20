<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
					
			<title>Menu</title>

    </head>
    
  <body bgcolor = "green">  

<br>
			<form action="Language" id = "languageForm">

				<select name = "language" onchange="traduci()">

   
    				<option selected="selected"><% 
													if(session.getAttribute("language")==null)
								 					 {       
	                    					 			out.println("Select Language");
										 			 }
													else
							     			 			out.println(session.getAttribute("language"));
	                 				 			 %></option>
	                 				 			 
	                 				 			 
   			    	<option><% if(session.getAttribute("es")==null) 
   			    				{
   			    					out.println("Spanish");
   			    				}
   			    				else
 			 			            out.println(session.getAttribute("es"));
   			    			%>
   			    	</option>
   			    	
   			    	
    				<option><% if(session.getAttribute("it")==null) 
   			    				{
   			    					out.println("Italian");
   			    				}
   			    				else
 			 			            out.println(session.getAttribute("it"));
   			    			%>
   			    	</option>
   			    	
					<option><% if(session.getAttribute("fr")==null) 
   			    				{
   			    					out.println("French");
   			    				}
   			    				else
 			 			            out.println(session.getAttribute("fr"));
   			    			%>
   			    	</option>
   			    	
					<option><% if(session.getAttribute("en")==null) 
   			    				{
   			    					out.println("English");
   			    				}
   			    				else
 			 			            out.println(session.getAttribute("en"));
   			    			%>
   			    	</option>
   			    	

				</select>
				

				<script type="text/javascript">
			
					function traduci()
				 	{
						document.getElementById("languageForm").submit();
				 	}

		    	</script>

			</form>

	<% 
		if(session.getAttribute("benvenuto")==null)
			{
				out.println("<center><b><font size=50 color=\"white\" face=\"Arial\">  Welcome!! </font></b></center>");
			}
		else
				out.println("<center><b><font size=50 color=\"white\" face=\"Arial\">" + session.getAttribute("benvenuto") + "</font></b></center>"); 
	%>
	
<br><br><br>
 
	<Center> <form action = "SenderView.jsp">
	
				<input type="submit" <% 
										if(session.getAttribute("send")==null)
								 		 {       
	                    					 out.println("value=\" Send Message\"");
										 }
										else
							     			 out.println("value=\"" + session.getAttribute("sendM") + "\"");
	                 				  %>>
			 </form>

<br><br><br>

			 <form action = "ReceiverView.jsp">
			 
				<input type="submit" <% 
				
										if(session.getAttribute("receive")==null)
										 {       
	 							 			 out.println("value=\" Receive Message\"");
										 }
										else
     							 			 out.println("value=\"" + session.getAttribute("receiveM") + "\"");
	                 				 %>>
			</form>
			
	</Center>
		
 </body>
 
</html>