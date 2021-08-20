package com.example.kenakata.repository;

import com.example.kenakata.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartRepo extends JpaRepository<Cart, Integer> {
    public List<Cart> findByUsername(String username);
    public List<Cart> deleteByUsername(String username);

}