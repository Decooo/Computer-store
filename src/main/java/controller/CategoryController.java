package controller;

import dao.CategoryDAO;
import entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jakub on 23.03.2017.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    CategoryDAO categoryDAO;

    @RequestMapping("/view")
    public ModelAndView view() {
        Iterable<Category> cat = categoryDAO.findAll();

        ModelAndView model = new ModelAndView("categoryList");
        model.addObject("category", cat);

        return model;
    }
}
