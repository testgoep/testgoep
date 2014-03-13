package jms;

import java.io.IOException;
import java.util.Properties;

import javax.jms.JMSException;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
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
	private static final long serialVersionUID = 1L;

	Context ctx = null;
	QueueConnectionFactory queueConnectionFactory = null;
	Queue queue = null;
	QueueConnection queueConnection = null;
	QueueSession queueSession = null;
	QueueSender queueSender = null;

	String msg = "";
	TextMessage message = null;
	
    public Sender() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String queueName = request.getParameter("queueName");
		msg = request.getParameter("message"); 
		
		System.out.println("SEND MASSAGE: " + msg);

		final Properties p = new Properties();
		p.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.naming.remote.client.InitialContextFactory");
		p.put(Context.PROVIDER_URL, "remote://localhost:4447");
		p.put(Context.SECURITY_PRINCIPAL, "rosanna");
		p.put(Context.SECURITY_CREDENTIALS, "napolitano");
		
		try
		{
			ctx = new InitialContext(p);

			queueConnectionFactory = (QueueConnectionFactory) ctx.lookup("jms/RemoteConnectionFactory");
			queue = (Queue) ctx.lookup(queueName);

			queueConnection = queueConnectionFactory.createQueueConnection();
			queueSession = queueConnection.createQueueSession(false, QueueSession.AUTO_ACKNOWLEDGE);
			queueSender = queueSession.createSender(queue);

			message = queueSession.createTextMessage();

			message.setText(msg);
			queueSender.send(message);

		}
		catch(JMSException e){
			e.printStackTrace();
		}
		catch (final NamingException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				queueConnection.close();
			}
			catch (final JMSException e)
			{
				e.printStackTrace();
			}
		}

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
