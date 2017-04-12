package com.jakub.dao;

import com.jakub.model.Users;

/**
 * Created by Jakub on 29.03.2017.
 */
public interface UsersDAO {

    Users findUsers(String username);

    Integer findUsersID(String username);
}
