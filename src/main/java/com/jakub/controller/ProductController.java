package com.jakub.controller;

import com.jakub.dao.CartDAO;
import com.jakub.dao.CategoryDAO;
import com.jakub.dao.ProductDAO;
import com.jakub.dao.UsersDAO;
import com.jakub.model.Category;
import com.jakub.model.Product;
import com.jakub.validator.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

/**
 * Created by Jakub on 20.04.2017.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private CartDAO cartDAO;

    @Autowired
    private UsersDAO usersDAO;

    @Autowired
    private ProductValidator productValidator;

    private static byte[] readBytesFromFile(MultipartFile filePath) throws IOException {
        byte[] img = filePath.getBytes();

        return img;
    }

    @InitBinder
    public void myInitBuilder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("target = " + target);
        if (target.getClass() == Product.class) {
            dataBinder.setValidator(productValidator);
        }
    }

    @RequestMapping("/list")
    public ModelAndView show() {
        List<Product> iterable = productDAO.findAll();
        ModelAndView model = new ModelAndView("productList");
        model.addObject("products", iterable);

        return model;
    }

    @RequestMapping("/add")
    public ModelAndView add() {
        ModelAndView model = new ModelAndView("addProduct");
        model.addObject("product", new Product());

        populateDefaultModel(model);

        return model;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public ModelAndView save(HttpServletRequest request, ModelAndView m, @Validated Product product, BindingResult bindingResult, @ModelAttribute("file") MultipartFile file) throws IOException {
        ModelAndView model = new ModelAndView("addProduct");

        if (bindingResult.hasErrors()) {
            populateDefaultModel(model);
            model.addObject("css", "error");
            model.addObject("msg", "Nie wprowadzono wszystkich danych lub wprowadzono je niepoprawnie!");
            return model;
        }

        byte[] photoBytes = readBytesFromFile(file);
        product.setPicture(photoBytes);
        System.out.println("Ustawiono image");


        productDAO.add(product);
        model.addObject("css", "msgSuccess");
        model.addObject("msg", "Dodano poprawnie!");
        populateDefaultModel(model);

        product.setProductName("");
        product.setProductDescription("");
        product.setProductPrice(0.0);

        return model;

    }

    private void populateDefaultModel(ModelAndView model) {
        List<Category> category = categoryDAO.findAll();
        model.addObject("categoryID", category);
    }

    @RequestMapping(value = {"/productImage"}, method = RequestMethod.GET)
    public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
                             @RequestParam("id") String id) throws IOException {
        Product product = null;
        if (id != null) {
            product = this.productDAO.findProduct(id);
        }
        if (product != null && product.getPicture() != null) {
            response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            response.getOutputStream().write(product.getPicture());
        }
        response.getOutputStream().close();
    }

    @RequestMapping(value = "/delete/{productID}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("productID") int productID) {
        ModelAndView model = new ModelAndView("redirect:/product/list");
        productDAO.deleteProduct(productID);
        return model;
    }

    @RequestMapping(value = "/update/{productID}", method = RequestMethod.GET)
    public ModelAndView updateProduct(@PathVariable("productID") int productID) {
        ModelAndView model = new ModelAndView("updateProduct");
        Product product = productDAO.findByID(productID);
        model.addObject("updateProduct", product);
        model.addObject("productID", productID);
        populateDefaultModel(model);
        return model;
    }

    @RequestMapping(value = "saveupdate", method = RequestMethod.POST)
    public ModelAndView update(ModelAndView model, @ModelAttribute("updateProduct") @Validated Product product, @ModelAttribute("file") MultipartFile file, BindingResult bindingResult) throws IOException {
        ModelAndView m = new ModelAndView("updateProduct");
        populateDefaultModel(m);
        if (bindingResult.hasErrors()) {
            populateDefaultModel(m);
            m.addObject("css", "error");
            m.addObject("msg", "Nie wprowadzono wszystkich danych albo wprowadzono je niepoprawnie!");
            return m;
        }
        byte[] photoBytes = readBytesFromFile(file);

        product.setPicture(photoBytes);

        productDAO.update(product.getProductID(), product.getProductName(), product.getProductDescription(), product.getProductPrice(), product.getPicture(), product.getCategoryID());
        m.setViewName("redirect:/product/list");
        return m;
    }

    @RequestMapping(value = "/cart/{productID}")
    public ModelAndView addToCart(ModelAndView m, Product product, Principal principal) {
        ModelAndView model = new ModelAndView("redirect:/cart/view");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication.getName().equals("anonymousUser")) {
            model.setViewName("redirect:/login");
            return model;
        } else {
            int userID = usersDAO.findUsersID(principal.getName());
            Product p = productDAO.findByID(product.getProductID());
            System.out.println("productID: " + product.getProductID() + " ,cena: " + p.getProductPrice());
            cartDAO.add(userID, product.getProductID(), 1, p.getProductPrice());
            return model;
        }
    }

}