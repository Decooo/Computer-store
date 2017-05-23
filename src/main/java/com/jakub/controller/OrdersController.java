package com.jakub.controller;

import com.jakub.dao.OrderDetailsDAO;
import com.jakub.dao.OrdersDAO;
import com.jakub.dao.ProductDAO;
import com.jakub.dao.UsersDAO;
import com.jakub.model.OrderDetails;
import com.jakub.model.Orders;
import com.jakub.model.Product;
import com.jakub.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jakub on 23.05.2017.
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private UsersDAO usersDAO;

    @Autowired
    private OrdersDAO ordersDAO;

    @Autowired
    private OrderDetailsDAO orderDetailsDAO;

    @Autowired
    private ProductDAO productDAO;

    @RequestMapping("/list")
    public ModelAndView show() {
        List<Orders> iterable = ordersDAO.findAll();
        ModelAndView model = new ModelAndView("orderList");
        model.addObject("orders", iterable);
        List<Users> users = new ArrayList<Users>();

        for (Orders o : iterable) {
            users.add(usersDAO.findByID(o.getUserID()));
        }

        model.addObject("users", users);

        return model;
    }

    @RequestMapping(value = "/details/{orderID}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("orderID") int orderID) {
        ModelAndView model = new ModelAndView("orderDetails");
        List<OrderDetails> iterable = orderDetailsDAO.findAll(orderID);
        List<Product> product = new ArrayList<Product>();

        for (OrderDetails o : iterable) {
            product.add(productDAO.findByID(o.getProductID()));
        }

        model.addObject("orderDetails", iterable);
        model.addObject("products", product);

        return model;
    }

}
