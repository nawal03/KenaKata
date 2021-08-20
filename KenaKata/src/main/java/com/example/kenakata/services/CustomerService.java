package com.example.kenakata.services;

import com.example.kenakata.entity.Customer;
import com.example.kenakata.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepo repo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    public Customer findByUsername(String username) {
        return repo.findByUsername(username);
    }

    @Transactional
    public void save(Customer customer) {
        customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
        repo.save(customer);
    }
}

