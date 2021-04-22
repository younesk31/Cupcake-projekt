package web.commands;

import business.entities.OrderListing;
import business.exceptions.UserException;
import business.services.OrderListingFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class UpdateOrder extends CommandProtectedPage{
    OrderListingFacade orderListingFacade = new OrderListingFacade(database);


    public UpdateOrder(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        orderListingFacade.UpdateOrder(Integer.parseInt(request.getParameter("deliverOrder")));

        int user_id = Integer.parseInt(request.getParameter("user_id"));

        List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID(user_id);

        request.setAttribute("userOrderListings",orderListings);
        return pageToShow;
    }
}
