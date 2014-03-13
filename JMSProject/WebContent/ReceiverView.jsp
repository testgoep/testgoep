<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor = "yellow">

<form action="/Receiver">
<center>
<br>
<font color = "blue">Insert the queue name: </font>
<input type = "text" size=40 name = "queueName">

<br><br>
<input type = "submit" value = "RECEIVE">
</center>


<font size= 20 color = "red"> 

	<%
		if(request.getParameter("msg")!=null)
			
			out.println(request.getParameter("msg")); 
	%>

</font>


</form>


</body>
</html>