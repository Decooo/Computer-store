package dao;

import entity.Category;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Jakub on 23.03.2017.
 */
public interface CategoryDAO extends CrudRepository<Category, Integer> {


}
