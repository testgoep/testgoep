package jms;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.jms.JMSException;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sender
 */
@WebServlet("/Sender")
public class Sender extends HttpServlet {
	

	public Sender() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		QueueConnection queueConnection=null;
		String msg = "";
		TextMessage message = null;
		

		String queueName = request.getParameter("queueName");
		
		
			
		
		
		msg = request.getParameter("message");

		System.out.println("SEND MASSAGE: " + msg);

		final Properties p = new Properties();
		p.put(Context.INITIAL_CONTEXT_FACTORY,"org.jboss.naming.remote.client.InitialContextFactory");
		p.put(Context.PROVIDER_URL, "remote://localhost:4447");
		p.put(Context.SECURITY_PRINCIPAL, "fulvio");
		p.put(Context.SECURITY_CREDENTIALS, "cicerano");

		try
		{
			if(queueName!=null && !(queueName.equals("")))
			{
				//Set the Context Object
				Context jndiContext = new InitialContext(p);

				//Lookup the Queue Connection Factory.
				QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory) jndiContext.lookup("jms/RemoteConnectionFactory"); 
        
				//Lookup the JMS Destination
				Queue queue = (Queue) jndiContext.lookup(queueName);
				
				
				
			
      		
				    queueConnection = queueConnectionFactory.createQueueConnection();
		
					//Create session from connection.
					QueueSession queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
					QueueSender queueSender = queueSession.createSender(queue);
		
					message = queueSession.createTextMessage();
		
					message.setText(msg);
					queueSender.send(message);
		
					String path = "SenderView.jsp?msg=Message Sent!!";
					response.sendRedirect(path);
				}
				else
				{
					String path = "SenderView.jsp?msg=Queue not found!";
					response.sendRedirect(path);
					
				}
			
				
			
		} catch (Exception e)
		
		{
			String path = "SenderView.jsp?msg=Queue not found!";
		    response.sendRedirect(path);	
		} 
		
		 
		
		
		finally {
			if (queueConnection != null) {
				try {
					queueConnection.close();
				} catch (final JMSException e) {
					e.printStackTrace();
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
