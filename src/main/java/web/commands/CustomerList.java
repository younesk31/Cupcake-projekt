package web.commands;

import business.entities.Cupcake;
import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public class CustomerList extends CommandProtectedPage {
    private UserFacade userFacade;

    public CustomerList(String pageToShow,String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {


        List<User> customerList = userFacade.getAllUsers();

        request.getSession().setAttribute("customerList", customerList);


        // TODO: 21-04-2021 skal laves senere
        for (User user : customerList) {

            System.out.println(user.getBalance());
            request.getSession().setAttribute("balance", user.getBalance());
        }

        return pageToShow;

    }

    public  String getRole() { return role;}
}
