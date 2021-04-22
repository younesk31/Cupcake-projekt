package web.commands;

import business.entities.OrderListing;
import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.OrderListingFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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

        // edits item if edit button was pressed
        String edit = request.getParameter("edit");
        if (edit != null)
        {
            String[] balances = request.getParameterValues("balance");
            int i = Integer.parseInt(edit);
            double balance = Double.parseDouble(balances[i]);
            User u = customerList.get(i);
            
            u.setBalance(balance);
            cupcakeFacade.updateBalance(balance, u.getId());
        }

        String delete = request.getParameter("delete");
        if(delete != null)
        {
            customerList.removeIf(u -> u.getId() == Integer.parseInt(delete));

            userFacade.deleteUser(Integer.parseInt(delete));

        }

        String olist = request.getParameter("olist");

        if(olist != null){

            int user_id = Integer.parseInt(olist);
            OrderListingFacade orderListingFacade = new OrderListingFacade(database);

            List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID(user_id);

            request.setAttribute("userOrderListings",orderListings);

            return "showcustomerorders";

        }



        return pageToShow;
    }

}
