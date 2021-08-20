package com.example.kenakata.entity;
/*
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
*/

import javax.persistence.*;


/*@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString*/
@Entity
@Table(name = "shops")
public class Shop {
    @Id
    private String shopname;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false)
    private String shop_logo;
    @Column(nullable = false)
    private String shop_email;
    @Column(nullable = false)
    private String contact_number;
    @Column(nullable = false)
    private String delivery_area;
    @Column(nullable = false)
    private String category;
    @Column(nullable = false)
    private String about;

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getShop_logo() {
        return shop_logo;
    }

    public void setShop_logo(String shop_logo) {
        this.shop_logo = shop_logo;
    }

    public String getShop_email() {
        return shop_email;
    }

    public void setShop_email(String shop_email) {
        this.shop_email = shop_email;
    }

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public String getDelivery_area() {
        return delivery_area;
    }

    public void setDelivery_area(String delivery_area) {
        this.delivery_area = delivery_area;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "shopname='" + shopname + '\'' +
                ", password='" + password + '\'' +
                ", shop_logo='" + shop_logo + '\'' +
                ", shop_email='" + shop_email + '\'' +
                ", contact_number='" + contact_number + '\'' +
                ", delivery_area='" + delivery_area + '\'' +
                ", category='" + category + '\'' +
                ", about='" + about + '\'' +
                '}';
    }

    public boolean contains(String delivery_area, String category){
        return this.delivery_area.contains(delivery_area) && this.category.contains(category);
    }

}