package com.example.kenakata.entity;
/*
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;*/

import javax.persistence.*;
import java.sql.Timestamp;

/*@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString*/
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer oid;
    @Column(nullable = false)
    private String username;
    @Column(nullable = false)
    private String shopname;
    @Column(nullable = false)
    private String address;
    @Column(nullable = false)
    private String status;
    @Column(nullable = false)
    private Timestamp time;
    @Column(nullable = false)
    private String details;
    @Column(nullable = false)
    private Double totalprice;
    private String review;
    @Column(nullable = false)
    private Integer pnum;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", username='" + username + '\'' +
                ", shopname='" + shopname + '\'' +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", time=" + time +
                ", details='" + details + '\'' +
                ", totalprice=" + totalprice +
                ", review='" + review + '\'' +
                ", pnum=" + pnum +
                '}';
    }
}
