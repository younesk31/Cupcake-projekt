package business.services;

import business.entities.Bottom;
import business.entities.Cupcake;
import business.entities.Top;
import business.exceptions.UserException;
import business.persistence.CupcakeMapper;
import business.persistence.Database;

import java.util.List;

public class CupcakeFacade {
    CupcakeMapper cupcakeMapper;

    public CupcakeFacade(Database database) {
        cupcakeMapper = new CupcakeMapper(database);
    }

    public List<Bottom> getAllBottoms() throws UserException {
        return cupcakeMapper.getAllBottoms();
    }

    public Bottom getBottoms(int bottomId) throws UserException {
        return cupcakeMapper.getBottoms(bottomId);
    }

    public List<Top> getAllToppings() throws UserException {
        return cupcakeMapper.getAllToppings();
    }

    public Top getToppings(int topId) throws UserException {
        return cupcakeMapper.getToppings(topId);
    }

    public int insertOrder(int user_id, double total, List<Cupcake> cupcakeList) throws UserException {
        return cupcakeMapper.insertOrder(user_id, total, cupcakeList);
    }

    public int updateBalance(double amount, int user_id) throws UserException {
        return cupcakeMapper.updateBalance(amount, user_id);
    }
}
