package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterCommand extends CommandUnprotectedPage {
    private UserFacade userFacade;

    public RegisterCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        User user;

        if(email.equals("") || password1.equals("")){
            request.setAttribute("error", "Hallo taber, du skal fylde ud!");
            return "registerpage";
        }




        if (password1.equals(password2)) {
            try {
                user = userFacade.createUser(email, password1);
            } catch (Exception e){
                request.setAttribute("error", "Brugernavn eksisterer allerede!");
                return "registerpage";
            }
            HttpSession session = request.getSession();

            session.setAttribute("email", email);
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            return "orderpage";

        } else {

            request.setAttribute("error", "Den ene kode passer ikke med den anden!");
            return "registerpage";
        }
    }
}
