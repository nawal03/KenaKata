package com.example.kenakata.repository;

import com.example.kenakata.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Integer> {
    public User findByUsername(String username);
    public User findByVerification(String verification);
}