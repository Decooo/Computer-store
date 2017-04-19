package com.jakub.controller;

import com.jakub.dao.CategoryDAO;
import com.jakub.model.Category;
import com.jakub.validator.CategoryValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
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

    @Autowired
    private CategoryValidator categoryValidator;

    @Autowired
    private ResourceBundleMessageSource messageSource;

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("target = " + target);

        if (target.getClass() == Category.class) {
            dataBinder.setValidator(categoryValidator);
        }

    }

    @RequestMapping("/add")
    public ModelAndView add() {
        ModelAndView model = new ModelAndView("addCategory");
        model.addObject("category", new Category());
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(Model model, @Validated Category category, BindingResult bindingResult) {

        ModelAndView m = new ModelAndView("addCategory");

        if (bindingResult.hasErrors()) {
            m.addObject("css", "error");
            m.addObject("msg", "Nie wprowadzono wszystkich danych lub wprowadzono je niepoprawnie!");
            return m;
        }
        try {
            categoryDAO.add(category.getCategoryName(), category.getCategoryDescription());
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);
            return m;
        }
        category.setCategoryDescription("");
        category.setCategoryName("");
        m.addObject("category", category);
        m.addObject("css", "msgSuccess");
        m.addObject("msg", "Dodano nowa kategorie!");
        return m;
    }

    @RequestMapping(value = {"/view"})
    public ModelAndView view(ModelAndView m) {
        List<Category> iterable = categoryDAO.findAll();
        ModelAndView model = new ModelAndView("categoryList");
        model.addObject("categories", iterable);

        return model;
    }

    @RequestMapping(value = "/delete/{categoryID}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("categoryID") int categoryID) {
        ModelAndView model = new ModelAndView("redirect:/category/view");
        categoryDAO.deleteCategory(categoryID);
        return model;
    }

    @RequestMapping(value = "/update/{categoryID}",method = RequestMethod.GET)
    public ModelAndView updateCat(@PathVariable("categoryID") int categoryID) {
        ModelAndView model = new ModelAndView("updateCategory");
        Category category = categoryDAO.findByID(categoryID);
        model.addObject("updateCategory", category);
        model.addObject("categoryID",categoryID);
        return model;
    }

    @RequestMapping(value = "saveupdate", method = RequestMethod.POST)
    public ModelAndView update(ModelAndView model, @ModelAttribute("updateCategory")@Validated Category category, BindingResult bindingResult) {
        ModelAndView m = new ModelAndView("updateCategory");
        if (bindingResult.hasErrors()) {
            m.addObject("css", "error");
            m.addObject("msg", "Nie wprowadzono wszystkich danych lub wprowadzono je niepoprawnie!");
            return m;
        }
        categoryDAO.update(category.getCategoryID(), category.getCategoryName(), category.getCategoryDescription());
        m.setViewName("redirect:/category/view");
        return m;
    }
}
