<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="/Sender">

<font color = "blue">Insert the queue name: </font>
<input type = "text" size=40 name = "queueName">

<textArea name = "message" rows=4 cols="40">
Insert here the message you want to send
</textArea>

<input type = "submit" value = "SEND">

</form>


</body>
</html>