package com.fastkart.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.List;

@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDescription;
    @OneToMany(mappedBy = "category")
    private List<Product> products;

    public Category(String categoryTitle, String categoryDescription) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }

    public Category() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public void addProduct(Product producct) {
        this.products.add(producct);
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + '}';
    }

}
