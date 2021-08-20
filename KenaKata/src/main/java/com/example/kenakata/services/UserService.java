package com.example.kenakata.services;

import com.example.kenakata.entity.User;
import com.example.kenakata.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    @Autowired
    private UserRepo repo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    public User findByUsername(String username) {
        return repo.findByUsername(username);
    }

    @Transactional
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        repo.save(user);
    }
}
