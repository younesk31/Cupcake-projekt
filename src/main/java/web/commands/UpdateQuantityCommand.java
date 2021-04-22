package web.commands;

import business.entities.Cupcake;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class UpdateQuantityCommand extends CommandProtectedPage {
    public UpdateQuantityCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
    }
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        List<Integer> quantityList = new ArrayList<>();
        
        try {
            for (String quantity : request.getParameterValues("quantity")) {
                quantityList.add(Integer.parseInt(quantity));
            }
        }
        catch (NumberFormatException e) {
            request.setAttribute("error", "Antal skal være et tal.");
            return pageToShow;
        }
    
        // sets all quantities in cart to quantities from form
        for (int i = 0; i < cupcakeList.size(); ++i) {
            cupcakeList.get(i).setQuantity(quantityList.get(i));
        }
    
        // removes item if remove button was pressed
        String remove = request.getParameter("remove");
        if (remove != null) {
            cupcakeList.remove(Integer.parseInt(remove));
//            quantityList.remove(Integer.parseInt(remove));
        }
        
        // removes all items whose quantity is now 0
        // written as swanky 1-liner to avoid ConcurrentModificationException
        cupcakeList.removeIf(c -> c.getQuantity() <= 0);
        
        double total = 0;
    
        // TODO duplicate code.
        if (cupcakeList != null) {
            for (Cupcake cupcake : cupcakeList) {
                total += cupcake.getPrice();
            }
        }
    
        request.getSession().setAttribute("total", total);
        
        return pageToShow;
    }
}
