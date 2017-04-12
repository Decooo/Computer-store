package com.jakub.controller;

import com.jakub.dao.ClientDAO;
import com.jakub.dao.UsersDAO;
import com.jakub.model.Category;
import com.jakub.model.Client;
import com.jakub.model.Users;
import com.jakub.validator.ClientValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

    @Autowired
    private ClientDAO clientDAO;

    @Autowired
    private UsersDAO usersDAO;

    @Autowired
    private ResourceBundleMessageSource messageSource;

    @Autowired
    private ClientValidator clientValidator;

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("target = " + target);

        if (target.getClass() == Client.class) {
            dataBinder.setValidator(clientValidator);
        }
    }

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
    public Model login(Model model, @RequestParam(value = "error", required = false) String error,
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

    @RequestMapping(value = {"/registration"}, method = RequestMethod.POST)
    public ModelAndView registration(Users users) {
        ModelAndView model = new ModelAndView("registration");
        model.addObject("registration", new Client());

        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Model model, Users users, @Validated Client client, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        try {
            if (usersDAO.findUsersID(users.getUsername()) == -1) {
                clientDAO.addClientAndUser(
                        client.getFirstName(),
                        client.getLastName(),
                        client.getEmailAddress(),
                        client.getStreet(),
                        client.getNumberHouse(),
                        client.getPostCode(),
                        client.getCity(),
                        users.getUsername(),
                        users.getPassword());

                return "redirect:/login";}
             else {
                return "redirect:/registration";
            }
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "registration";
        }
//        return "registration";
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
