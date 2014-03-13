package jms;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.QueueReceiver;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;



/**
 * Servlet implementation class Operation
 */

@WebServlet("/Receiver")
public class Receiver extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private final String queueConnectionFactoryName = "jms/RemoteConnectionFactory";
	private Context jndiContext = null;
	
	private String queueName;
	private QueueConnectionFactory queueConnectionFactory = null;
	private QueueConnection queueConnection = null;
	private QueueSession queueSession = null;
	private Queue queue = null;
	private QueueReceiver queueReceiver = null;
	private TextMessage message = null;
       
    /**
     * @throws IOException 
     * @see HttpServlet#HttpServlet()
     */
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String queueName=request.getParameter("queueName");
		
		final Properties p = new Properties();

		p.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.naming.remote.client.InitialContextFactory");

		p.put(Context.PROVIDER_URL, "remote://localhost:4447");

		p.put(Context.SECURITY_PRINCIPAL, "fulvio");

		p.put(Context.SECURITY_CREDENTIALS, "cicerano");

		try
		{
			//Set the Context Object
			this.jndiContext = new InitialContext(p);

			//Lookup the Queue Connection Factory.
			this.queueConnectionFactory = (QueueConnectionFactory) jndiContext.lookup(queueConnectionFactoryName); 
        
			//Lookup the JMS Destination
			//this.queue = (Queue) jndiContext.lookup(queueName);
        }catch (final NamingException e)
		{
			System.out.println("JNDI lookup is failed: " + e.toString());
			System.exit(1);
		}
		catch (final Exception e)
		{
			e.printStackTrace();
		}
		
		try
		{
			//Create connection
			queueConnection = queueConnectionFactory.createQueueConnection();

			//Create session from connection.
			queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);

			//Create receiver.
			queueReceiver = queueSession.createReceiver(queue);

			//Start queue connection
			queueConnection.start();
			
			final Message m = queueReceiver.receive(1);

			//if there is some message on queue
			if (m != null)
			{

				if (m instanceof TextMessage)
				{

					this.message = (TextMessage) m;

					//usare message per la JSP 
					PrintWriter out = response.getWriter();
				    out.println (
				      
				      "<html> \n" +
				        "<head> \n" +
				          "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\"> \n" +
				          "<title> Message Queue  </title> \n" +
				        "</head> \n" +
				        "<body> \n" +
				          "<font size=\"12px\"\">" +
				            "Messaggio:" + message +
				          "</font> \n" +
				        "</body> \n" +
				      "</html>" 
				    );  
					 
					 
				}
				
				
					
				
			}
			
					
		}catch (final JMSException e)
		{
			System.out.println("Exception occurred: " + e.toString());
		}

		//Close connection Finally
		finally
		{
			if (queueConnection != null)
			{
				try
				{
					queueConnection.close();
				}
				catch (final JMSException e)
				{
					System.out.println(e.toString());
				}
			}
		}
	}
    
}