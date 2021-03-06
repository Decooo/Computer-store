package com.jakub.dao;

import com.jakub.model.Category;
import com.jakub.model.Users;

/**
 * Created by Jakub on 29.03.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji użytkownicy

public interface UsersDAO {

    Users findByID(Integer id);

    Users findUsers(String username);

    Integer findUsersID(String username);
}
