package com.jakub.model;

import javax.persistence.*;

/**
 * Created by Jakub on 23.03.2017.
 */

//klasa reprezentująca encje kategorie z bazy danych


@Entity
@Table(name = "category")
public class Category {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "categoryID")
    private Integer categoryID;
    @Column(name = "categoryName")
    private String categoryName;
    @Column(name = "categoryDescription")
    private String categoryDescription;

    public Category(Integer id, String name, String desc) {
    this.categoryID=id;
    this.categoryName=name;
    this.categoryDescription=desc;
    }

    public Category() {

    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryID=" + categoryID +
                ", categoryName='" + categoryName + '\'' +
                ", categoryDescription='" + categoryDescription + '\'' +
                '}';
    }

    public Integer getCategoryID() {
        return categoryID;
    }

    public Category setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
        return this;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public Category setCategoryName(String categoryName) {
        this.categoryName = categoryName;
        return this;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public Category setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
        return this;
    }
}
