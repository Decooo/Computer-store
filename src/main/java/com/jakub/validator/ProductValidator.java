package com.jakub.validator;

import com.jakub.model.Product;
import org.apache.commons.validator.routines.DoubleValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Jakub on 20.04.2017.
 */
@Component
public class ProductValidator implements Validator {
    private DoubleValidator doubleValidator = DoubleValidator.getInstance();

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == Product.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;
        ValidationUtils.rejectIfEmpty(errors, "productName", "NotEmpty.product.productName");
        ValidationUtils.rejectIfEmpty(errors, "productDescription", "NotEmpty.product.productDescription");
        ValidationUtils.rejectIfEmpty(errors, "productPrice", "NotEmpty.product.productPrice");

        if (product.getProductPrice() != null) {
            if (doubleValidator.isValid(product.getProductPrice().toString())) {
                errors.rejectValue("productPrice", "Pattern.product.productPrice");

            }
        }
    }
}
