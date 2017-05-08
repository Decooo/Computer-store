package com.jakub.controller;

import com.jakub.dao.CartDAO;
import com.jakub.dao.ProductDAO;
import com.jakub.dao.UsersDAO;
import com.jakub.model.Cart;
import com.jakub.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

/**
 * Created by Jakub on 08.05.2017.
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private UsersDAO usersDAO;

    @Autowired
    private ProductDAO productDAO;

    @RequestMapping("/view")
    public ModelAndView view(Principal principal) {
        ModelAndView model = new ModelAndView("cart");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication.getName().equals("anonymousUser")) {
            model.setViewName("redirect:/login");
            return model;
        } else {
            int userID = usersDAO.findUsersID(principal.getName());
            List<Cart> iterable = cartDAO.findAll(userID);
            model.addObject("carts", iterable);
            return model;
        }
    }

    @RequestMapping(value = "/delete/{cartID}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("cartID") int productID) {
        ModelAndView model = new ModelAndView("redirect:/cart/view");
        cartDAO.deleteProduct(productID);
        return model;
    }

    @RequestMapping(value = {"/productName"}, method = RequestMethod.GET, produces = "text/plain")
    @ResponseBody
    public String productImage(HttpServletRequest request, HttpServletResponse response, Model model,
                               @RequestParam("id") String id) throws IOException, ServletException {
        Product product = null;
        product = this.productDAO.findProduct(id);

        String name = product.getProductName();
        response.setContentType("text/plain");
        request.setAttribute("data", name);
        PrintWriter out = response.getWriter();
        out.println(name);
        out.close();
        System.out.println("name: " + name);

        return name;
    }

}
