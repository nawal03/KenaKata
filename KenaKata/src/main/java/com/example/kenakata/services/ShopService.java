package com.example.kenakata.services;

import com.example.kenakata.entity.Shop;
import com.example.kenakata.repository.ShopRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShopService {
    @Autowired
    private ShopRepo repo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public Shop findByShopname(String shopname) {
        return repo.findByShopname(shopname);
    }

    @Transactional
    public void save(Shop shop) {
        shop.setPassword(bCryptPasswordEncoder.encode(shop.getPassword()));
        repo.save(shop);
    }
}