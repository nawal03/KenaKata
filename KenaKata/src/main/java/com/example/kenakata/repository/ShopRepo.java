package com.example.kenakata.repository;

import com.example.kenakata.entity.Shop;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ShopRepo extends JpaRepository<Shop, String> {
    public Shop findByShopname(String shopname);
    
}