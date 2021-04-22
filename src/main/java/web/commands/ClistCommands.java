package web.commands;

import business.entities.OrderListing;
import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.OrderListingFacade;
import business.services.UserFacade;

import javax.el.ELException;
import javax.servlet.ServletException;
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
        if (edit != null) {
            String[] balances = request.getParameterValues("balance");
            int i = Integer.parseInt(edit);
            double balance = Double.parseDouble(balances[i]);
            User u = customerList.get(i);
            
            u.setBalance(balance);
            cupcakeFacade.updateBalance(balance, u.getId());

            request.setAttribute("error", "Bruger: "+ customerList.get(i).getEmail() +" Balance er ændret til " + balance);
        }

        String delete = request.getParameter("delete");
        if(delete != null) {
            if (Integer.parseInt(delete) != this.userFacade.getAllUsers().get(1).getId()) {
                customerList.removeIf(u -> u.getId() == Integer.parseInt(delete));

                userFacade.deleteUser(Integer.parseInt(delete));

                request.setAttribute("error", "Brugeren er nu blevet slettet!");
            } else {
                request.setAttribute("error", "Kan ikke slette en Admin konto!");
                return "customerlist";
            }
        }

        String olist = request.getParameter("olist");

        if(olist != null){
            int user_id = Integer.parseInt(olist);
            if (user_id != this.userFacade.getAllUsers().get(1).getId()){

                OrderListingFacade orderListingFacade = new OrderListingFacade(database);

                List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID(user_id);

                request.setAttribute("userOrderListings", orderListings);

                return "showcustomerorders";

            } else {
                request.setAttribute("error", "Admin ordrer findes ikke!");
                return "customerlist";
            }
        }



        return pageToShow;
    }

}
