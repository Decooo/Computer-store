package com.jakub.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.persistence.*;

/**
 * Created by Jakub on 20.04.2017.
 */

//klasa reprezentująca encje produkt z bazy danych

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer productID;
    private String productName;
    private Double productPrice;
    private byte[] picture;
    private String productDescription;
    private Integer categoryID;

    public Product(String productName, Double productPrice, byte[] picture, String productDescription, Integer categoryID) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.picture = picture;
        this.productDescription = productDescription;
        this.categoryID = categoryID;
    }

    public Product(Integer productID, String productName, Double productPrice, byte[] picture, String productDescription, Integer categoryID) {
        this.productID=productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.picture = picture;
        this.productDescription = productDescription;
        this.categoryID = categoryID;
    }


    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", Picture='" + picture + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", categoryID=" + categoryID +
                '}';
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Integer getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
    }


}
