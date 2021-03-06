package web.commands;

import business.entities.Cupcake;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCartCommand extends CommandProtectedPage {

    public ShowCartCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        double total = 0;

        if (cupcakeList != null) {
            for (Cupcake cupcake : cupcakeList) {
                total += cupcake.getPrice();
            }
            request.getSession().setAttribute("total", total);
        }
        return pageToShow;
    }

    public String getRole() {
        return role;
    }
}
