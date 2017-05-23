package com.jakub.controller;

import com.jakub.dao.*;
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
import java.util.ArrayList;
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
    private OrdersDAO ordersDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private OrderDetailsDAO orderDetailsDAO;

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
            List<Product> product = new ArrayList<Product>();

            for (Cart c : iterable) {
                product.add(productDAO.findByID(c.getProductID()));
            }

            model.addObject("products", product);
            model.addObject("carts", iterable);
            Double amount = cartDAO.amount(userID);
            model.addObject("amount", amount);
            Double rebate = cartDAO.rebate(userID);
            model.addObject("rebate", rebate);
            Double finalAmount = amount - rebate;
            model.addObject("finalAmount", finalAmount);
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

    @RequestMapping(value = {"/addQuantity"}, method = RequestMethod.GET)
    public ModelAndView addQuantity(HttpServletRequest request, HttpServletResponse response, Model m, @RequestParam("id") String id) {
        ModelAndView model = new ModelAndView("redirect:/cart/view");

        cartDAO.addQuantity(Integer.valueOf(id));

        return model;
    }

    @RequestMapping(value = {"/reduceQuantity"}, method = RequestMethod.GET)
    public ModelAndView reduceQuantity(HttpServletRequest request, HttpServletResponse response, Model m, @RequestParam("id") String id) {
        ModelAndView model = new ModelAndView("redirect:/cart/view");

        cartDAO.reduceQuantity(Integer.valueOf(id));

        return model;
    }

    @RequestMapping(value = {"order"}, method = RequestMethod.POST)
    public ModelAndView order(Model m, Cart cart, Principal principal) {
        ModelAndView model = new ModelAndView("redirect:/cart/view");

        int userID = usersDAO.findUsersID(principal.getName());
        List<Cart> iterable = cartDAO.findAll(userID);

        if (iterable.size() != 0) {
            Double amount = cartDAO.amount(userID);
            Double rebate = cartDAO.rebate(userID);
            Double totalPrice = amount - rebate;
            Integer orderID = ordersDAO.addOrders(userID, totalPrice);
            System.out.println("orderID = " + orderID);
            for (int i = 0; i < iterable.size(); i++) {
                orderDetailsDAO.addOrderDetails(orderID, iterable.get(i).getProductID(), iterable.get(i).getQuantity(), iterable.get(i).getTotalPrice());
            }
            cartDAO.clearCart(userID);
        }

        return model;
    }
}
