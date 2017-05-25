package com.jakub.validator;

import com.jakub.model.Users;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Jakub on 12.04.2017.
 */

//klasa odpowiedzialna za validacje poprawnosci danych i wyświetlaniu odpowiednich błędów

@Component
public class UsersValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == Users.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Users users = (Users) target;

        ValidationUtils.rejectIfEmpty(errors, "username", "NotEmpty.registrationForm.username");
        ValidationUtils.rejectIfEmpty(errors, "password", "NotEmpty.registrationForm.password");



    }
}
