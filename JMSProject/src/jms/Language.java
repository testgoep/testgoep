package jms;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.jsp.jstl.core.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Language
 */
@WebServlet("/Language")
public class Language extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String combo = request.getParameter("language");
		String language = combo.substring(0,2);
		String country = combo.substring(3);
		HttpSession session = request.getSession(true);
		
		
		Locale currentLocale;
	
        ResourceBundle messages;
        
        currentLocale = new Locale(language, country);
        
        
        messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
        
        
        String benvenuto= messages.getString("benvenuto");
        session.setAttribute("benvenuto", benvenuto);
        
        
        
        String insert= messages.getString("insert");
        session.setAttribute("insert", insert);
        
        
        
        String queue= messages.getString("queue");
        session.setAttribute("queue", queue);
        
        
        
        String msg= messages.getString("msg");
        session.setAttribute("msg", msg);
       
        
        
        String menu= messages.getString("menu");
        session.setAttribute("menu", menu);
       
     
       
        String receiver= messages.getString("receiver");
        session.setAttribute("receiver", receiver);
        
       
        
        String sendM= messages.getString("sendM");
        session.setAttribute("sendM", sendM);
       
        
        
        String receiveM= messages.getString("receiveM");
        session.setAttribute("receiveM", receiveM);
        
        
        String send= messages.getString("send");
        session.setAttribute("send", send);
        
        
        String receive= messages.getString("receive");
        session.setAttribute("receive", receive);
       
        
        String read= messages.getString("read");
        session.setAttribute("read", read);
        
        
        
		response.sendRedirect("Menu.jsp");
       
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
