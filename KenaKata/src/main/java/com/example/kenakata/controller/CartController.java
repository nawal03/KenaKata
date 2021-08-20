package com.example.kenakata.controller;

import com.example.kenakata.entity.*;
import com.example.kenakata.repository.*;
import com.example.kenakata.services.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.Clock;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CartController {
    @Autowired
    private CartRepo cartRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private EmailSenderService emailSenderService;

    @RequestMapping("/cart/addProduct/{id}")
    public String addToCart(@PathVariable Integer id, Principal principal, Cart cart){
        List<Cart> carts= cartRepo.findByUsername(principal.getName());
        String shopname= productRepo.findByPid(id).getShopname();
        if(carts.size()>0 && !productRepo.findByPid(carts.get(0).getPid()).getShopname().equals(shopname)){
            for(Cart cart1: carts) cartRepo.deleteById(cart1.getCid());
        }
        Product product= productRepo.findByPid(id);
        cart.setPid(product.getPid());
        cart.setPname(product.getName());
        cart.setShopname(product.getShopname());
        cart.setPrice(product.getPrice()*cart.getQuantity());
        cart.setUsername(principal.getName());
        cartRepo.save(cart);
        return "redirect:/customer/viewShop/"+product.getShopname()+"/viewProduct/"+product.getPid()+"?msg=addedToCart";
    }

    @GetMapping("/cart/delete/{id}")
    public String deleteFromCart(@PathVariable Integer id){
        cartRepo.deleteById(id);
        return "redirect:/customer/cart/view";
    }

    @GetMapping("/cart/view")
    public ModelAndView viewCart(Principal principal,String updated){
        List<Cart> carts= cartRepo.findByUsername(principal.getName());
        Customer customer = customerRepo.findByUsername(principal.getName());
        ModelAndView modelAndView= new ModelAndView("cart/viewCart");
        double totalPrice=0;
        for(Cart cart:carts){
            totalPrice+=cart.getPrice();
        }
        List<String> delivery_areaList = new ArrayList<>();
        Shop shop;
        if(carts.size() > 0)
        {
            shop = shopRepo.findByShopname(carts.get(0).getShopname());
            delivery_areaList = Arrays.asList(shop.getDelivery_area().split(","));
        }
        modelAndView.addObject("cartList",carts);
        modelAndView.addObject("totalPrice", totalPrice);
        modelAndView.addObject("customer", customer);
        modelAndView.addObject("order", new Order());
        modelAndView.addObject("daList", delivery_areaList);
        if(updated != null && updated.equals("updated")) modelAndView.addObject("updated","*Error processing order! Your cart has been modified.");
        return  modelAndView;
    }
    @PostMapping("/cart/view")
    public String viewCart(Principal principal, Order order, @RequestParam("da") String delivery_division){
        order.setAddress(order.getAddress()+","+delivery_division);
        order.setUsername(principal.getName());
        order.setTime(Timestamp.from(Instant.now(Clock.systemDefaultZone()).truncatedTo(ChronoUnit.SECONDS)));
        order.setStatus("pending");
        List<Cart> cartList =cartRepo.findByUsername(principal.getName());
        order.setTotalprice(0.0);
        order.setPnum(0);
        boolean shouldUpdate=false;
        for(Cart cart: cartList){
            Integer pid= cart.getPid();
            if(productRepo.existsById(pid) && productRepo.findByPid(pid).isStock()){
                order.setTotalprice(order.getTotalprice()+cart.getPrice());
                order.setPnum(order.getPnum()+1);
                if(order.getShopname()==null){
                    order.setShopname(cart.getShopname());
                }
                String temp = "#"+cart.getPid()+"\t"+cart.getPname()+" (" +cart.getSize()+") x "+cart.getQuantity()+" = "+
                        cart.getPrice()+" tk";
                if(order.getPnum() == 1) {
                    order.setDetails(temp);
                }
                else {
                    order.setDetails(order.getDetails()+", "+temp);
                }
            }
            else{
                shouldUpdate=true;
                cartRepo.deleteById(cart.getCid());
            }
        }
        if(shouldUpdate){
            return "redirect:/customer/cart/view?updated=updated";
        }
        for(Cart cart: cartList){
            cartRepo.deleteById(cart.getCid());
        }
        orderRepo.save(order);
        Customer customer= customerRepo.findByUsername(principal.getName());
        String temp[]= order.getDetails().split(",");
        String details="";
        for(int i=0;i< temp.length;i++) details=details.concat(temp[i]+"\n");
        String emailBody="Dear "+customer.getFname()+" "+customer.getLname()+","
                +"\n\nYour order from "+ order.getShopname()+ " is placed.\nOrder details:\n\n "+details
                +"\n\nTotal price: " + order.getTotalprice()+" Taka"
                +"\n\nShipping address: "+order.getAddress()
                +"\n\nWe will confirm the order soon."
                +"\n\nThank you for shoping with us.\n\nKenaKata";;
        emailSenderService.sendSimpleEmail(customer.getEmail(),emailBody,"Order Is Placed");
        emailBody="Dear "+order.getShopname()+","
                +"\n\nAn order is placed from your shop.\nOrder details:\n\n "+details
                +"\n\nTotal price: " + order.getTotalprice()+" Taka"
                +"\n\nShipping address: "+order.getAddress()
                +"\n\nThank you.\n\nKenaKata";
        Shop shop= shopRepo.findByShopname(order.getShopname());
        emailSenderService.sendSimpleEmail(shop.getShop_email(),emailBody,"You Got an Order!");
        return  "redirect:/customer/orders";
    }
}




