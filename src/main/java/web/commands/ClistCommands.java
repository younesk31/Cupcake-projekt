package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ClistCommands extends CommandProtectedPage {
    private CupcakeFacade cupcakeFacade;
    private UserFacade userFacade;

    public ClistCommands(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        List<User> customerList = (List<User>) request.getSession().getAttribute("customerList");

        String balance = request.getParameter("balance");

        // edits item if edit button was pressed
        String edit = request.getParameter("edit");
        if (edit != null)
        {
            for(User u : customerList){
                if(u.getId() == Integer.parseInt(edit)) {

                    u.setBalance(Double.parseDouble(balance));

                    cupcakeFacade.updateBalance(Double.parseDouble(balance), u.getId());
                }
            }
        }

        String delete = request.getParameter("delete");
        if(delete != null)
        {
            customerList.removeIf(u -> u.getId() == Integer.parseInt(delete));

            userFacade.deleteUser(Integer.parseInt(delete));

        }

        return pageToShow;
    }

}
