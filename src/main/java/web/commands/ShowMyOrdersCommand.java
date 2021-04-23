package web.commands;

import business.entities.OrderListing;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderListingFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowMyOrdersCommand extends CommandProtectedPage {
    private final OrderListingFacade orderListingFacade;

    public ShowMyOrdersCommand(String pageToShow, String role) {
        super(pageToShow, role);
        this.orderListingFacade = new OrderListingFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID((Integer)request.getSession().getAttribute("user_id"));
        request.setAttribute("userOrderListings", orderListings);
        return pageToShow;
    }
}
