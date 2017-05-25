package com.jakub.validator;

import com.jakub.model.Client;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Jakub on 12.04.2017.
 */

//klasa odpowiedzialna za validacje poprawnosci danych i wyświetlaniu odpowiednich błędów

@Component
public class ClientValidator implements Validator {

    private EmailValidator emailValidator = EmailValidator.getInstance();
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == Client.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Client client = (Client) target;
        ValidationUtils.rejectIfEmpty(errors,"firstName","NotEmpty.registration.firstName");
        ValidationUtils.rejectIfEmpty(errors,"lastName","NotEmpty.client.lastNae");
        ValidationUtils.rejectIfEmpty(errors,"emailAddress","NotEmpty.client.emailAddress");
        ValidationUtils.rejectIfEmpty(errors,"street","NotEmpty.client.street");
        ValidationUtils.rejectIfEmpty(errors,"numberHouse","NotEmpty.client.numberHouse");
        ValidationUtils.rejectIfEmpty(errors,"postCode","NotEmpty.client.postCode");
        ValidationUtils.rejectIfEmpty(errors,"city","NotEmpty.registrationForm.city");


        if (!emailValidator.isValid(client.getEmailAddress())) {
            errors.rejectValue("emailAddress", "Pattern.registration.emailAddress");
        }

    }
}
