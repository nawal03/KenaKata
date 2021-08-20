package com.example.kenakata.repository;

import com.example.kenakata.entity.Complain;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ComplainRepo extends JpaRepository<Complain, Integer> {
    public List<Complain> findByUsername(String username);
    public List<Complain> findByReply(String reply);

    public Complain getById(Integer id);
}
