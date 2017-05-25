package com.jakub.controller;

import com.jakub.dao.ClientDAO;
import com.jakub.dao.UsersDAO;
import com.jakub.model.Client;
import com.jakub.model.Users;
import com.jakub.validator.ClientValidator;
import com.jakub.validator.UsersValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.security.Principal;

/**
 * Created by Jakub on 23.03.2017.
 */

//klasa obsługująca główny kontroler aplikacji, który odpowiada za wyświetlanie strony głównej, logowania i rejestracji nowego użytkownika

@Controller
@Transactional
@EnableWebMvc
public class MainController {

    @Autowired
    private UsersDAO usersDAO;

    @Autowired
    private ClientDAO clientDAO;


    @Autowired
    private ResourceBundleMessageSource messageSource;

    @Autowired
    private ClientValidator clientValidator;

    @Autowired
    private UsersValidator usersValidator;

    //klasa odpowiadająca za validacje danych przy rejestracji nowego użytkownika
    @InitBinder("client")
    public void clientInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("target = " + target);

        if (target.getClass() == Client.class) {
            dataBinder.setValidator(clientValidator);
        }
    }

//metoda odpowiadająca za wyświetlanie widkou strony głównej
    @RequestMapping("/index")
    public ModelAndView index() {

        return new ModelAndView("index");
    }

//metoda odpowiadająca za wyświetlanie widkou strony głównej
    @RequestMapping("/")
    public ModelAndView home() {

        return new ModelAndView("index");
    }

//metoda odpowiadająca za wyświetlanie widkou strony błędu 403
    @RequestMapping("/403")
    public String accesDenied() {
        return "/403";
    }

    //metoda odpowiadająca za wyświetlanie strony logowania
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

    //metoda odpowiadająca za wyświetlanie strony rejestracji
    @RequestMapping(value = {"/registration"}, method = RequestMethod.POST)
    public String registration(ModelMap registration) {

        registration.addAttribute("users", new Users());
        registration.addAttribute("client", new Client());

        return "registration";
    }

    //metoda odpowiadająca za zapisywanie w bazie nowego użytkownika
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(Model model, @ModelAttribute("users")Users users, @ModelAttribute("client") @Validated Client client, BindingResult bindingResult) {

        ModelAndView m = new ModelAndView("registration");

        if (bindingResult.hasErrors()) {
            m.addObject("client", bindingResult);
            m.addObject("css", "error");
            m.addObject("msg", "Nie wprowadzono wszystkich danych lub wprowadzono je niepoprawnie!");
            return m;
        } else {
            if (users.getUsername().equals("")) {
                m.addObject("css", "error");
                m.addObject("msg", "Nie podano nazwy uzytkownika!");
                return m;
            } else if (users.getPassword().equals("")) {
                m.addObject("css", "error");
                m.addObject("msg", "Nie podano hasla!");
                return m;
            } else if (usersDAO.findUsersID(users.getUsername()) == -1) {
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

                m.addObject("css", "msgSuccess");
                m.addObject("msg", "Rejestracja zakonczona sukcesem");
                return m;
            } else {
                m.addObject("css", "error");
                m.addObject("msg", "Użytkownik o takim nicku już istnieje!");
                return m;
            }
        }

    }

    //metoda odpowiadająca za wylogowywanie
    @RequestMapping("/logout")
    public String logout() {
        return "login?logout";
    }

    //metoda odpowiadająca za wyświetlanie informacji o zalogowanym użytkowniku
    @RequestMapping(value = {"/accountInfo"}, method = RequestMethod.GET)
    public String accountInfo(Model model, Principal principal) {
        String username = principal.getName();
        System.out.println("Username::: " + username);
        return "accountInfo";
    }

    //metoda odpowiadająca za podstrone produkt
    @RequestMapping("/product")
    public String product() {
        return "product";
    }

}

