package com.example.kenakata.controller;

import com.example.kenakata.entity.Order;
import com.example.kenakata.entity.Product;
import com.example.kenakata.entity.Shop;
import com.example.kenakata.entity.User;
import com.example.kenakata.repository.OrderRepo;
import com.example.kenakata.repository.ProductRepo;
import com.example.kenakata.repository.ShopRepo;
import com.example.kenakata.repository.UserRepo;
import com.example.kenakata.services.ShopService;
import com.example.kenakata.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
public class ShopController {
    @Value("${firebase-apikey}")
    private String firebaseApikey;

    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ShopService shopService;
    @Autowired
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;



    @GetMapping("/home")
    public ModelAndView shopHome(ModelMap modelMap, Principal principal)
    {
        Shop shop = shopRepo.findByShopname(principal.getName());
        modelMap.put("shop", shop);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        ModelAndView mv = new ModelAndView("shop/shopHome");
        mv.addObject(modelMap);
        mv.addObject("categoryList", categoryList);
        return mv;
    }

    @GetMapping("/settings")
    public ModelAndView settings(Principal principal, String flag, String updated)
    {
        Shop shop = shopRepo.findByShopname(principal.getName());
        List<String> daList = new ArrayList<>(Arrays.asList(shop.getDelivery_area().split(",")));
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        ModelAndView mv = new ModelAndView("shop/shopSettings");
        mv.addObject("shop", shop);
        mv.addObject("daList", daList);
        mv.addObject("flag", flag);
        mv.addObject("updated", updated);
        mv.addObject("categoryList", categoryList);
        mv.addObject("firebaseApikey",firebaseApikey);
        return mv;
    }
    @PostMapping("/settings")
    public String settings(Shop shop, @RequestParam String currentpass, Principal principal) {
        Shop shop1 = shopRepo.findByShopname(principal.getName());
        User user= userRepo.findByUsername(principal.getName());

        if(!bCryptPasswordEncoder.matches(currentpass, shop1.getPassword()))
        {
            return "redirect:/shop/settings?flag=false";
        }

        shop1.setContact_number(shop.getContact_number());
        shop1.setAbout(shop.getAbout());
        if(shop.getShop_logo()!=null && !shop.getShop_logo().isEmpty())
        {
            shop1.setShop_logo(shop.getShop_logo());
        }

        if(shop.getPassword() != null && !shop.getPassword().equals("")) {
            shop1.setPassword(shop.getPassword());
            user.setPassword(shop.getPassword());
            shopService.save(shop1);
            userService.save(user);
        }
        else{
            userRepo.save(user);
            shopRepo.save(shop1);
        }

        return "redirect:/shop/settings?updated=true";
    }

    @RequestMapping(value = "/viewCategory/{category}", method = RequestMethod.GET)
    public ModelAndView viewCategory(@PathVariable String category,Principal principal){
        Shop shop = shopRepo.findByShopname(principal.getName());
        List<Product> productList;
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        ModelAndView modelAndView= new ModelAndView("shop/shopViewCategory");
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("cat", category);

        productList= productRepo.findByCategoryAndShopname(category,principal.getName());

        modelAndView.addObject("productList",productList);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @RequestMapping(value = "/searchProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView searchProduct(String str,@PathVariable String category, Principal principal){

        Shop shop = shopRepo.findByShopname(principal.getName());
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList = new ArrayList<>();
        List<Product> allProductList= productRepo.findByCategoryAndShopname(category,principal.getName());
        for(Product product: allProductList){
            if(product.contains(str)) productList.add(product);
        }
        ModelAndView modelAndView= new ModelAndView("shop/shopViewCategory");
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @RequestMapping(value = "/sortProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView sortProduct(String order, String param,@PathVariable String category,Principal principal){
        Shop shop = shopRepo.findByShopname(principal.getName());
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList;
        if(param.equals("Name") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByNameAsc(category, principal.getName());
        else if(param.equals("Name") && order.equals("Descending")) productList=productRepo.findByCategoryAndShopnameOrderByNameDesc(category,principal.getName());
        else if(param.equals("Price") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByPriceAsc(category, principal.getName());
        else productList=productRepo.findByCategoryAndShopnameOrderByPriceDesc(category,principal.getName());
        ModelAndView modelAndView= new ModelAndView("shop/shopViewCategory");
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @GetMapping("/reviews")
    public ModelAndView reviews(Principal principal){
        Shop shop = shopRepo.findByShopname(principal.getName());
        ModelAndView mv = new ModelAndView("shop/shopReviews");
        List<Order> orderList = orderRepo.findByShopname(shop.getShopname());
        mv.addObject("orderList", orderList);
        mv.addObject("shop", shop);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        mv.addObject("categoryList", categoryList);
        return mv;
    }

}
