<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="green">

<a href="Menu.jsp"><font color="white">
Return to "Menu"</font>
</a>
<br>

<a href="ReceiverView.jsp"><font color="white">
Go to "Receiver"</font>
</a>
<br><br>

<form action="/Sender">

<center>

<br>
<font color = "white">Insert the queue name: </font>
<input type = "text" size=40 name = "queueName">

<br><br>

<textArea name = "message" rows=4 cols="40">
Insert here the message you want to send
</textArea>

<br><br>

<input type = "submit" value = "SEND">

</center>

</form>
<br>
<font size= 20 color = "white"> 

	<%
		if(request.getParameter("msg")!=null)
			
			out.println(request.getParameter("msg")); 
	%>

</font>


</body>
</html>
