package com.jakub.dao;

/**
 * Created by Jakub on 06.04.2017.
 */
public interface ClientDAO {

    public void addClientAndUser(String firstName, String lastName, String emailAddress, String street, String numberHouse, String postCode, String city,String username, String password);
}
