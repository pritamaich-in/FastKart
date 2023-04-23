package com.fastkart.entities;

import jakarta.persistence.*;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private String productName;
	@Column(length = 3000)
	private String productDescription;
	private String productPhoto;
	private int productPrice;
	private int productDiscount;
	private int productQuantity;
	@ManyToOne
	private Category category;

	public Product() {
	}

	public Product(String productName, String productDescription, String productPhoto, int productPrice,
			int productDiscount, int productQuantity) {
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPhoto=" + productPhoto + ", productPrice=" + productPrice
				+ ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + '}';
	}

	public int getPriceAfterDiscount() {
		return (int) ((100 - this.productDiscount) * this.productPrice / 100.0);
	}
}
