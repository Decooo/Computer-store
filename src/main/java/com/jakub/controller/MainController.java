package com.jakub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jakub on 23.03.2017.
 */
@Controller
public class MainController {

    @RequestMapping("/")
    public ModelAndView index() {
        System.out.println("#### index.jsp");

        return new ModelAndView("index");
    }

}
