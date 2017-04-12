package com.jakub.validator;

import com.jakub.model.Client;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Jakub on 12.04.2017.
 */
@Component
public class ClientValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == Client.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Client client = (Client) target;
        ValidationUtils.rejectIfEmpty(errors,"firstName","NotEmpty.registrationForm.firstName");
        ValidationUtils.rejectIfEmpty(errors,"lastName","NotEmpty.registrationForm.lastName");
        ValidationUtils.rejectIfEmpty(errors,"emailAddress","NotEmpty.registrationForm.emailAddress");
        ValidationUtils.rejectIfEmpty(errors,"street","NotEmpty.registrationForm.street");
        ValidationUtils.rejectIfEmpty(errors,"numberHouse","NotEmpty.registrationForm.numberHouse");
        ValidationUtils.rejectIfEmpty(errors,"postCode","NotEmpty.registrationForm.postCode");
        ValidationUtils.rejectIfEmpty(errors,"city","NotEmpty.registrationForm.city");

    }
}
