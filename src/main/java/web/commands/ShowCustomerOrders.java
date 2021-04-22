package web.commands;

import business.entities.OrderListing;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderListingFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCustomerOrders extends CommandProtectedPage{
    OrderListingFacade orderListingFacade = new OrderListingFacade(database);
    UserFacade userFacade = new UserFacade(database);

    public ShowCustomerOrders(String pageToShow, String role) {
        super(pageToShow, role);

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        int user_id = (Integer)request.getSession().getAttribute("user_id");

        List<User> customerList = userFacade.getAllUsers();
        request.getSession().setAttribute("customerList", customerList);

        List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID(user_id);

        request.setAttribute("orderListings",orderListings);
        return pageToShow;
    }


}
