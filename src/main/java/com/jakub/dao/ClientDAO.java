package com.jakub.dao;

/**
 * Created by Jakub on 06.04.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji klient

public interface ClientDAO {

    public void addClientAndUser(String firstName, String lastName, String emailAddress, String street, String numberHouse, String postCode, String city,String username, String password);
}
