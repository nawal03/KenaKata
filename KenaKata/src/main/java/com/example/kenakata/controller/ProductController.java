package com.example.kenakata.controller;

import com.example.kenakata.entity.Product;
import com.example.kenakata.entity.Shop;
import com.example.kenakata.repository.ProductRepo;
import com.example.kenakata.repository.ShopRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "/shop")
public class ProductController {
    @Value("${firebase-apikey}")
    private String firebaseApikey;

    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private ProductRepo productRepo;

    @GetMapping("/addProduct")
    public ModelAndView addProduct(Principal principal, ModelMap modelMap, String error){
        Shop shop = shopRepo.findByShopname(principal.getName());
        modelMap.put("shop", shop);
        if(error != null) {
            modelMap.put("error", error);
        }
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        ModelAndView mv = new ModelAndView("product/addProduct");
        mv.addObject(modelMap);
        mv.addObject("categoryList", categoryList);
        mv.addObject("firebaseApikey",firebaseApikey);
        return mv;
    }

    @PostMapping(value = "/addProduct")
    public String addProduct(Principal principal, Product product){
        System.out.println("addProduct:" +product);
        if(product.getImage1()==null || product.getImage1().isEmpty()
                || product.getImage2()==null || product.getImage2().isEmpty()
                ||product.getImage3()==null || product.getImage3().isEmpty()) {

            return "redirect:/shop/addProduct?error=Please insert all images";
        }


        product.setShopname(principal.getName());
        productRepo.save(product);
        return "redirect:/shop/home";
    }

    @GetMapping(value = ("/editProduct/{id}"))
    public ModelAndView editProduct(@PathVariable int id,Principal principal){
        if(!productRepo.findByPid(id).getShopname().equals(principal.getName())){
            return new ModelAndView("error");
        }
        Shop shop = shopRepo.findByShopname(principal.getName());
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        Product product= productRepo.findByPid(id);
        ModelAndView modelAndView= new ModelAndView("product/editProduct");
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("product",product);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @PostMapping(value = ("/editProduct/{id}"))
    public String editProduct(@PathVariable int id, Product product,Principal principal){
        if(!productRepo.findByPid(id).getShopname().equals(principal.getName())){
            return "redirect:/shop/home";
        }
        Product product1= productRepo.findByPid(id);

        product1.setSize(product.getSize());

        product1.setPrice(product.getPrice());

        System.out.println(product.isStock());

        product1.setStock(product.isStock());

        productRepo.save(product1);

        return "redirect:/shop/viewCategory/"+product1.getCategory();
    }

    @RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable int id,Principal principal){
        if(productRepo.findByPid(id) == null){
            return "redirect:/shop/home";
        }
        if(!productRepo.findByPid(id).getShopname().equals(principal.getName())){
            return "redirect:/shop/home";
        }
        System.out.println(productRepo.findByPid(id));
        Product product= productRepo.findByPid(id);
        productRepo.delete(product);
        return "redirect:/shop/viewCategory/"+product.getCategory();
    }
}

