package com.jakub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.security.Principal;

/**
 * Created by Jakub on 23.03.2017.
 */
@Controller
@Transactional
@EnableWebMvc
public class MainController {


    @RequestMapping("/index")
    public ModelAndView index() {

        return new ModelAndView("index");
    }


    @RequestMapping("/")
    public ModelAndView home() {

        return new ModelAndView("index");
    }

    @RequestMapping("/403")
    public String accesDenied() {
        return "/403";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public Model login(Model model,@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        if (error != null) {
            model.addAttribute("error", "Niepoprawna nazwa użytkownika lub hasło");
        }

        if (logout != null) {
            model.addAttribute("msg", "Wylogowano pomyslnie");
        }
        model.addAttribute("login");
        return model;
    }

    @RequestMapping("/logout")
    public String logout() {
        return "login?logout";
    }

    @RequestMapping(value = {"/accountInfo"}, method = RequestMethod.GET)
    public String accountInfo(Model model, Principal principal) {
        String username = principal.getName();
        System.out.println("Username::: " + username);
        return "accountInfo";
    }

    @RequestMapping("/product")
    public String product() {
        return "product";
    }

}
