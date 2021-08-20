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
@Table(name = "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cid;
    @Column(nullable = false)
    private String username;
    @Column(nullable = false)
    private Integer pid;
    @Column(nullable = false)
    private String pname;
    @Column(nullable = false)
    private String shopname;
    @Column(nullable = false)
    private String size;
    @Column(nullable = false)
    private Integer quantity;
    @Column(nullable = false)
    private Double price;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cid=" + cid +
                ", username='" + username + '\'' +
                ", pid=" + pid +
                ", pname='" + pname + '\'' +
                ", shopname='" + shopname + '\'' +
                ", size='" + size + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
}