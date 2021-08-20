package com.example.kenakata.controller;

import com.example.kenakata.entity.Customer;
import com.example.kenakata.entity.Order;
import com.example.kenakata.entity.Shop;
import com.example.kenakata.repository.CustomerRepo;
import com.example.kenakata.repository.OrderRepo;
import com.example.kenakata.repository.ShopRepo;
import com.example.kenakata.services.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private ShopRepo shopRepo;

    @Autowired
    private EmailSenderService emailSenderService;

    @GetMapping("/customer/orders")
    public ModelAndView customerOrders(Principal principal){
        List<Order> orderList= orderRepo.findByUsername(principal.getName());
        ModelAndView modelAndView= new ModelAndView("order/customerOrders");
        modelAndView.addObject("orderList",orderList);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);

        return modelAndView;
    }

    @GetMapping("/customer/order/review/{id}")
    public String customerReview(Principal principal, String review,@PathVariable Integer id){
        Order order= orderRepo.getByOid(id);
        if(!order.getUsername().equals(principal.getName()) || order.getStatus().equals("pending")){
            return "redirect:/customer/orders";
        }
        if(review==null || review.equals(" ")) return "redirect:/user/orders";
        order.setReview(review);
        orderRepo.save(order);
        return "redirect:/customer/orders";
    }

    @GetMapping("/shop/orders")
    public ModelAndView shopOrders(Principal principal){
        List<Order> orderList= orderRepo.findByShopname(principal.getName());
        ModelAndView modelAndView= new ModelAndView("order/shopOrders");
        modelAndView.addObject("orderList",orderList);
        Shop shop=shopRepo.findByShopname(principal.getName());
        modelAndView.addObject("shop",shop);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        modelAndView.addObject("categoryList",categoryList);
        return modelAndView;
    }

    @GetMapping("/shop/order/status/{id}")
    public String shopOrderStatus(@PathVariable Integer id,String status,Principal principal){
        Order order= orderRepo.getByOid(id);
        if(!order.getShopname().equals(principal.getName()) || !order.getStatus().equals("pending")){
            return "redirect:/shop/orders";
        }
        if(!status.equals("accepted") && !status.equals("rejected")){
            return "redirect:/shop/orders";
        }
        order.setStatus(status);
        orderRepo.save(order);
        Customer customer = customerRepo.findByUsername(order.getUsername());
        String temp[]= order.getDetails().split(",");
        String details="";
        for(int i=0;i< temp.length;i++) details=details.concat(temp[i]+"\n");
        String emailBody="Dear "+customer.getFname()+" "+customer.getLname()+","
                +"\n\nYour order from "+ order.getShopname()+ " is " +order.getStatus()+ ".\nOrder details:\n\n "+details
                +"\n\nTotal price: " + order.getTotalprice()+" Taka"
                +"\n\nShipping address: "+order.getAddress()
                +"\n\nThank you for shopping with us.\n\nKenaKata";
        emailSenderService.sendSimpleEmail(customer.getEmail(),emailBody,"Order is "+order.getStatus());
        return "redirect:/shop/orders";
    }

}

