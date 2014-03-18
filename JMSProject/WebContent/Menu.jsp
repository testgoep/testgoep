<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor = "green">

<form action="Language" id = "languageForm">

<select name = "language" onchange="traduci()">

   
    <option selected="selected">Select Language</option>
    <option>es_ES</option>
    <option>it_IT</option>
	<option>fr_FR</option>
	<option>en_GB</option>

</select>

<script type="text/javascript">
function traduci(){
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
 
 
<Center>
<form action = "SenderView.jsp">
<input type="submit" <% if(session.getAttribute("send")==null)
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