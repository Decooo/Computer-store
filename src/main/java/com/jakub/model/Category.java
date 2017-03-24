package com.jakub.model;

import javax.persistence.*;

/**
 * Created by Jakub on 23.03.2017.
 */
@Table(name = "category")
@Entity
public class Category {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer categoryID;
    @Column(name = "categoryName")
    private String categoryName;
    @Column(name = "categoryDescription")
    private String categoryDescription;

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
