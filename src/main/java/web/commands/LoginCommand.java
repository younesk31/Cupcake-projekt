package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCommand extends CommandUnprotectedPage {
    private UserFacade userFacade;

    public LoginCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userFacade.login(email, password);

            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("user_id", user.getId());
            session.setAttribute("role", user.getRole());
            session.setAttribute("email", email);
            session.setAttribute("balance", user.getBalance());

            String pageToShow = user.getRole() + "page";

            if (user.getRole().equals("customer")){
                pageToShow = "orderpage";
            }

            return REDIRECT_INDICATOR + pageToShow;

        } catch (UserException ex) {
            request.setAttribute("error", "Wrong username or password!");
            return "loginpage";
        }
    }
}
