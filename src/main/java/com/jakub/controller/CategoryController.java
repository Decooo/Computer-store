package com.jakub.controller;

import com.jakub.com.jakub.dao.impl.CategoryDAOImpl;
import com.jakub.dao.CategoryDAO;
import com.jakub.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = {"/view"}, method = RequestMethod.GET)
    public ModelAndView view() {
//        List<CategoryDAO> categoryList = this.categoryDAO.listCategoryDao();
//        model.addAttribute("categoryList", categoryList);


        return new ModelAndView("categoryList");
    }
}
