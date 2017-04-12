package com.jakub.validator;

import com.jakub.model.Category;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Jakub on 30.03.2017.
 */
@Component
public class CategoryValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == Category.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Category category = (Category) target;
        ValidationUtils.rejectIfEmpty(errors, "categoryName", "NotEmpty.categoryForm.categoryName");
        ValidationUtils.rejectIfEmpty(errors, "categoryDescription", "NotEmpty.categoryForm.categoryDescription");

        if (category.getCategoryName().length() < 3) {
            errors.rejectValue("categoryName", "SmallSize.categoryForm.categoryName");
        }
        if (category.getCategoryDescription().length() < 10) {
            errors.rejectValue("categoryDescription", "SmallSize.categoryForm.categoryDescription");
        }
    }
}
