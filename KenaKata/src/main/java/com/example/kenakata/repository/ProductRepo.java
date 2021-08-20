package com.example.kenakata.repository;

import com.example.kenakata.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    public Product findByPid(Integer id);
    public List<Product> findByCategoryAndShopname(String category, String shopname);
    public List<Product> findByCategoryAndShopnameOrderByNameAsc(String category,String shopname);
    public List<Product> findByCategoryAndShopnameOrderByNameDesc(String category, String shopname);
    public List<Product> findByCategoryAndShopnameOrderByPriceAsc(String category, String shopname);
    public List<Product> findByCategoryAndShopnameOrderByPriceDesc(String category,String shopname);


}
