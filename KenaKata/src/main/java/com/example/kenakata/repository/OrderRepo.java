package com.example.kenakata.repository;

import com.example.kenakata.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepo extends JpaRepository<Order, Integer> {
    public List<Order> findByUsername(String username);
    public List<Order> findByShopname(String shopname);

    public Order getByOid(Integer id);
}
