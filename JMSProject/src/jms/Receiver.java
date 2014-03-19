package jms;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;



/**
 * Servlet implementation class Operation
 */

@WebServlet("/Receiver")

public class Receiver extends HttpServlet 
	{
	
	
		private final String queueConnectionFactoryName = "jms/RemoteConnectionFactory";

    
    /**
     * @throws IOException 
     * @see HttpServlet#HttpServlet()
     */
 
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	     {
			 //Create connection
			 QueueConnection queueConnection=null;
			 
			 String queueName=request.getParameter("queueName");
			
			 final Properties p = new Properties();
			 
			
			 
			 FileInputStream fis = (FileInputStream) this.getClass().getResourceAsStream("/user.properties");
			 
			 Properties properties = new Properties();
			 
			 // load from input stream
	         properties.load(fis);
	         
	         String usr=properties.getProperty("username");
	         
	         String pwd=properties.getProperty("password");
	
			
	         p.put(Context.INITIAL_CONTEXT_FACTORY,"org.jboss.naming.remote.client.InitialContextFactory");
	         p.put(Context.PROVIDER_URL,"remote://localhost:4447");
	         p.put(Context.SECURITY_PRINCIPAL, usr);
	         p.put(Context.SECURITY_CREDENTIALS, pwd);

      
		
	         try
		
	          {
	        	 if(queueName!=null && !(queueName.equals("")))
	        	  {
	        		 //Set the Context Object
	        		 Context jndiContext = new InitialContext(p);
	
					 //Lookup the Queue Connection Factory.
					 QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory) jndiContext.lookup(queueConnectionFactoryName); 
		        
					 //Lookup the JMS Destination
					 Queue queue = (Queue) jndiContext.lookup(queueName);
				
				     queueConnection = queueConnectionFactory.createQueueConnection();
		
					 //Create session from connection.
					 QueueSession queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
		
					 //Create receiver.
					 QueueReceiver queueReceiver = queueSession.createReceiver(queue);
		
					 //Start queue connection
					 queueConnection.start();
					
					 final Message m = queueReceiver.receive(1);
		
					 //if there is some message on queue
					 if (m != null)
					  {
		
						 if (m instanceof TextMessage)
						  {
		
							 TextMessage message = (TextMessage) m;
							
							 String path = "ReceiverView.jsp?msg=Message Received: " + message.getText() ;
							
							 response.sendRedirect(path);
							 
						  }
								
						
					 }
					 
					else
					 {

						String path = "ReceiverView.jsp?msg=QueueIsEmpty";
						
						response.sendRedirect(path);
						
					 }
	      		
	        	  }
			    else
			     {
			    	String path = "ReceiverView.jsp?msg=QueueNotFound";
				
			    	response.sendRedirect(path);
				 
			     }
			
					
	          }catch (final JMSException e) { System.out.println("Exception occurred: " + e.toString()); }
		
	           catch (final NamingException e) {

	        	   									String path = "ReceiverView.jsp?msg=QueueNotFound";
			
	        	   									response.sendRedirect(path);
	           									
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
				       catch (final JMSException e) { System.out.println(e.toString()); }
	        	    }

	            }
		
		
	    }
			
	}



    


