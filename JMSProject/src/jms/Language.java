package jms;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		Locale currentLocale;
        ResourceBundle messages;

        currentLocale = new Locale(language, country);

        messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
        
        String benvenuto = messages.getString("benvenuto");
        String insert = messages.getString("insert");
        String queue = messages.getString("queue");
        String msg = messages.getString("msg");
        String menu = messages.getString("menu");
        String receiver = messages.getString("sender");
        
        System.out.println(benvenuto + " " + insert + " " + queue + " " + msg + " " + menu + " " + receiver);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
