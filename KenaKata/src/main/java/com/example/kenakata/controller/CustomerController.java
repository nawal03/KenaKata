package com.example.kenakata.controller;

import com.example.kenakata.entity.*;
import com.example.kenakata.repository.*;
import com.example.kenakata.services.CustomerService;
import com.example.kenakata.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private CartRepo cartRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;



    @GetMapping("/home")
    public ModelAndView customerHome(Principal principal)
    {
        Customer customer = customerRepo.findByUsername(principal.getName());
        ModelAndView mv = new ModelAndView("customer/customerHome");
        List<Shop> shopList= shopRepo.findAll();
        mv.addObject("shopList", shopList);
        mv.addObject("customer", customer);
        Boolean scroll= false;
        mv.addObject("scroll",scroll);
        return mv;
    }
    @GetMapping("/searchShop")
    public ModelAndView searchShop(Principal principal, String str){
        Customer customer = customerRepo.findByUsername(principal.getName());
        List<Shop> allShopList= shopRepo.findAll();
        Set<Shop> shopList= new HashSet<>();
        for(Shop shop: allShopList){
            if(shop.getShopname().toLowerCase().contains(str.toLowerCase())) shopList.add(shop);
        }
        List<Product> productList= productRepo.findAll();
        for(Product product: productList){
            if(product.contains(str)) shopList.add(shopRepo.findByShopname(product.getShopname()));
        }
        ModelAndView modelAndView= new ModelAndView("customer/customerHome");
        modelAndView.addObject("shopList",shopList);
        modelAndView.addObject("customer", customer);
        Boolean scroll= true;
        modelAndView.addObject("scroll",scroll);
        return modelAndView;
    }
    @GetMapping("/filterShop")
    public ModelAndView searchShop(Principal principal, String category, String delivery_area){
        Customer customer = customerRepo.findByUsername(principal.getName());
        List<Shop> allShopList= shopRepo.findAll();
        List<Shop> shopList= new ArrayList<>();
        for(Shop shop: allShopList){
            if(shop.contains(delivery_area,category)) shopList.add(shop);
        }
        ModelAndView modelAndView= new ModelAndView("customer/customerHome");
        modelAndView.addObject("shopList",shopList);
        modelAndView.addObject("customer", customer);
        Boolean scroll= true;
        modelAndView.addObject("scroll",scroll);
        return modelAndView;
    }

    @GetMapping("/settings")
    public ModelAndView settings(Principal principal, String flag, String updated)
    {
        Customer customer = customerRepo.findByUsername(principal.getName());
        ModelAndView mv = new ModelAndView("customer/customerSettings");
        mv.addObject("customer", customer);
        mv.addObject("flag", flag);
        mv.addObject("updated", updated);
        return mv;
    }
    @PostMapping("/settings")
    public String settings(Customer customer, @RequestParam String currentpass, Principal principal)
    {
        Customer customer1 = customerRepo.findByUsername(principal.getName());
        User user= userRepo.findByUsername(principal.getName());

        if(!bCryptPasswordEncoder.matches(currentpass, customer1.getPassword()))
        {
            return "redirect:/customer/settings?flag=false";
        }

        customer1.setFname(customer.getFname());
        customer1.setLname(customer.getLname());
        customer1.setPhone(customer.getPhone());

        if(customer.getPassword() != null && !customer.getPassword().equals("")) {
            customer1.setPassword(customer.getPassword());
            user.setPassword(customer.getPassword());
            customerService.save(customer1);
            userService.save(user);
        }
        else{
            userRepo.save(user);
            customerRepo.save(customer1);
        }

        return "redirect:/customer/settings?updated=true";
    }

    @GetMapping("/viewShop/{shopname}")
    public String viewShop(@PathVariable String shopname, Principal principal){
        Shop shop= shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        String category = categoryList.get(0);

        return "redirect:/customer/viewShop/"+shopname+"/viewCategory/"+category;
    }
    @GetMapping("/viewShop/{shopname}/viewCategory/{category}")
    public ModelAndView viewCategory(@PathVariable String category, @PathVariable String shopname, Principal principal){

        ModelAndView modelAndView= new ModelAndView("customer/customerViewCategory");
        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        modelAndView.addObject("categoryList",categoryList);
        List<Product> productList = productRepo.findByCategoryAndShopname(category, shopname);
        modelAndView.addObject("productList", productList);
        modelAndView.addObject("shopname",shopname);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);
        modelAndView.addObject("cat", category);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @GetMapping("/viewShop/{shopname}/viewProduct/{id}")
    public ModelAndView viewProduct(@PathVariable String shopname, @PathVariable Integer id, Principal principal, String msg){
        ModelAndView modelAndView= new ModelAndView("customer/customerViewProduct");
        Product product= productRepo.findByPid(id);
        List<String> sizeList = new ArrayList<>(Arrays.asList(product.getSize().split(",")));
        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        List<Integer> quantityList = new ArrayList<>();
        for (int i = 1; i <= 20; i++)
            quantityList.add(i);
        modelAndView.addObject("quantityList", quantityList);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("product",product);
        modelAndView.addObject("shopname",shopname);
        modelAndView.addObject("sizeList", sizeList);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);

        List<Cart> cartList= cartRepo.findByUsername(principal.getName());
        Boolean cartNeedToEmpty= false;
        if(cartList.size()>0 && !cartList.get(0).getShopname().equals(shopname)){
            cartNeedToEmpty=true;
        }
        modelAndView.addObject("cartNeedToEmpty", cartNeedToEmpty);
        modelAndView.addObject("msg", msg);
        return modelAndView;
    }

    @RequestMapping(value = "/viewShop/{shopname}/searchProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView searchProduct(String str,@PathVariable String shopname, @PathVariable String category, Principal principal){

        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList = new ArrayList<>();
        List<Product> allProductList= productRepo.findByCategoryAndShopname(category,shopname);
        for(Product product: allProductList){
            if(product.contains(str)) productList.add(product);
        }
        ModelAndView modelAndView= new ModelAndView("customer/customerViewCategory");
        modelAndView.addObject("shopaname",shopname);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);
        return modelAndView;
    }

    @RequestMapping(value = "/viewShop/{shopname}/sortProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView sortProduct(String order, String param, @PathVariable String shopname,@PathVariable String category, Principal principal){

        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList;
        if(param.equals("Name") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByNameAsc(category, shopname);
        else if(param.equals("Name") && order.equals("Descending")) productList=productRepo.findByCategoryAndShopnameOrderByNameDesc(category,shopname);
        else if(param.equals("Price") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByPriceAsc(category, shopname);
        else productList=productRepo.findByCategoryAndShopnameOrderByPriceDesc(category,shopname);
        ModelAndView modelAndView= new ModelAndView("customer/customerViewCategory");
        modelAndView.addObject("shopname",shopname);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);
        return modelAndView;
    }

    @GetMapping("/viewShop/{shopname}/reviews")
    public ModelAndView reviews(@PathVariable String shopname, Principal principal){
        ModelAndView mv = new ModelAndView("customer/customerReviews");
        List<Order> orderList = orderRepo.findByShopname(shopname);
        mv.addObject("orderList", orderList);
        Shop shop = shopRepo.findByShopname(shopname);
        mv.addObject("shop", shop);
        mv.addObject("customer",customerRepo.findByUsername(principal.getName()));
        return mv;
    }

}
