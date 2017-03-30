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
import org.springframework.web.bind.annotation.InitBinder;
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
    public String save(Model model, @Validated Category category, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "addCategory";
        }
        try {
            categoryDAO.add(category.getCategoryName(), category.getCategoryDescription());
        } catch(Exception e){
            String message = e.getMessage();
            model.addAttribute("message",message);
            return "addCategory";
        }
        return "redirect:/";
    }

    //nie działą

    @RequestMapping(value = {"/view"})
    public ModelAndView view() {
        List<Category[]> iterable = categoryDAO.findCategory();

        ModelAndView model = new ModelAndView("categoryList");
        model.addObject("categories", iterable);

        return model;
    }
}
