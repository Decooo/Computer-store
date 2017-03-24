package com.jakub.controller;

import com.jakub.dao.CategoryDAO;
import com.jakub.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Jakub on 23.03.2017.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryDAO categoryDAO;

    @RequestMapping("/add")
    public ModelAndView add() {
        ModelAndView model = new ModelAndView("addCategory");
        model.addObject("category", new Category());
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Category category) {
        categoryDAO.add(category.getCategoryName(), category.getCategoryDescription());

        return "redirect:/";
    }

    @RequestMapping(value = {"/view"})
    public ModelAndView view() {
        List<Category> iterable = categoryDAO.findAll();

        ModelAndView model = new ModelAndView("categoryList");
        model.addObject("categories", iterable);

        return model;
    }
}
