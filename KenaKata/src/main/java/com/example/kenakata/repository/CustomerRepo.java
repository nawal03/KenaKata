package com.example.kenakata.repository;


import com.example.kenakata.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepo extends JpaRepository<Customer, String> {
    public Customer findByUsername(String username);
}