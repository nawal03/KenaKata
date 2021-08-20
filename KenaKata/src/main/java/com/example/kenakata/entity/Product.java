package com.example.kenakata.entity;

/*import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;*/

import javax.persistence.*;

/*@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString*/
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pid;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String category;
    @Column(nullable = false)
    private String color;
    @Column(nullable = false)
    private String size;
    private boolean stock;
    @Column(nullable = false)
    private String image1,image2,image3;
    @Column(nullable = false)
    private Double price;
    private String description;
    @Column(nullable = false)
    private String shopname;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public boolean isStock() {
        return stock;
    }

    public void setStock(boolean stock) {
        this.stock = stock;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", stock=" + stock +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", shopname='" + shopname + '\'' +
                '}';
    }

    public Boolean contains(String s){
        if(name.toLowerCase().contains(s.toLowerCase())) return true;
        if(category.toLowerCase().contains(s.toLowerCase())) return true;
        if(color.toLowerCase().contains(s.toLowerCase())) return true;
        if(size.toLowerCase().contains(s.toLowerCase())) return true;
        if(description.toLowerCase().contains(s.toLowerCase())) return true;
        return false;
    }

}