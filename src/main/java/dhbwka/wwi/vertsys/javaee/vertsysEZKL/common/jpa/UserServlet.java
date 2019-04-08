

/*
 * Copyright © 2019 Ekrem Zoroglu und Kevin Lederer
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */

package dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.jpa;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ejb.EJB;
import dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.ejb.UserBean;
import dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.ejb.UserBean.InvalidCredentialsException;
import dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.jpa.User;
import dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.web.WebUtils;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KE_LE
 */

@WebServlet(urlPatterns = {"/app/tasks/benutzerverwaltung/"})
public class UserServlet extends HttpServlet {
    
    @EJB
    UserBean userBean;    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       User benutzer = userBean.getCurrentUser();
       
       request.setAttribute("benutzer", benutzer);
        
       request.getRequestDispatcher("/WEB-INF/tasks/benutzerverwaltung").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User benutzer = userBean.getCurrentUser();
        
        String vorname = request.getParameter("vorname");
        String nachname = request.getParameter("nachname");
        String passwortAlt = request.getParameter("passwort_alt");
        String passwortNeu = request.getParameter("passwort_neu");
        
        if (benutzer.checkPassword(passwortAlt)) {
            benutzer.setNachname(nachname);
            benutzer.setVorname(vorname); 
            
            if (!passwortNeu.equals("")) {
                try {
                userBean.changePassword(benutzer, passwortAlt, passwortNeu);
                }
                catch (InvalidCredentialsException e) {
                }
            }
            
            benutzer = userBean.update(benutzer);
            response.sendRedirect(WebUtils.appUrl(request, "/app/dashboard/"));
        }                             
        
        else {
            String error = "Passwort falsch!";
            request.setAttribute("error", error);
            request.setAttribute("benutzer", benutzer);            
            response.sendRedirect(request.getRequestURI());
        }
        
    }

}
