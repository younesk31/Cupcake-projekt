package web.commands;

import business.entities.Cupcake;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCartCommand extends Command
{
    public String role;
    public String pageToShow;


    public ShowCartCommand(String pageToShow, String role)
    {
        this.pageToShow = pageToShow;
        this.role = role;

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        //todo reset cart
        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        double total = 0;

        // TODO: lots of things go wrong when you press buttons and the cart hasn't been initialised yet.
        //  consider giving sessionScope an empty List from the start. Wrapping in != null everywhere seems tedious.
        if (cupcakeList != null)
        {
            for (int i = 0; i < cupcakeList.size(); i++)
            {
                total += cupcakeList.get(i).getPrice();
            }
        }

        request.getSession().setAttribute("total", total);
        return pageToShow;
    }

    public String getRole()
    {
        return role;
    }
}
