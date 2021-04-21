package web;

import business.exceptions.UserException;
import business.persistence.Database;
import business.services.CupcakeFacade;
import web.commands.Command;
import web.commands.CommandUnknown;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "FrontController", urlPatterns = {"/fc/*"})
public class FrontController extends HttpServlet {
    private final static String USER = "cf";
    private final static String PASSWORD = "cf1234";
    private final static String URL = "jdbc:mysql://192.168.1.79:3306/cupcake?serverTimezone=CET";

    public static Database database;

    public void init() throws ServletException {
        // Initialize database connection
        if (database == null) {
            try {
                database = new Database(USER, PASSWORD, URL);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger("web").log(Level.SEVERE, ex.getMessage(), ex);
            }
        }

        CupcakeFacade cupcakeFacade = new CupcakeFacade(database);
        try {
            getServletContext().setAttribute("bottomList", cupcakeFacade.getAllBottoms());
        } catch (UserException e) {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage(), e);
        }

        try {
            getServletContext().setAttribute("topList", cupcakeFacade.getAllToppings());
        } catch (UserException e) {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage(), e);
        }

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            Command action = Command.fromPath(request, database);

            if (action instanceof CommandUnknown) {
                response.sendError(404);
                return;
            }

            String view = action.execute(request, response);

            if (view.startsWith(Command.REDIRECT_INDICATOR)) {
                String page = view.substring(Command.REDIRECT_INDICATOR.length());
                response.sendRedirect(page);
                return;
            }

            request.getRequestDispatcher("/WEB-INF/" + view + ".jsp").forward(request, response);

        } catch (UnsupportedEncodingException | UserException ex) {
            request.setAttribute("problem", ex.getMessage());
            Logger.getLogger("web").log(Level.SEVERE, ex.getMessage(), ex);
            request.getRequestDispatcher("/errorpage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "FrontController for application";
    }

}
