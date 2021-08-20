package com.example.kenakata.controller;

import com.example.kenakata.entity.Complain;
import com.example.kenakata.entity.Customer;
import com.example.kenakata.entity.Shop;
import com.example.kenakata.entity.User;
import com.example.kenakata.repository.ComplainRepo;
import com.example.kenakata.repository.CustomerRepo;
import com.example.kenakata.repository.ShopRepo;
import com.example.kenakata.repository.UserRepo;
import com.example.kenakata.services.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class ComplainController {
    @Autowired
    private ComplainRepo complainRepo;
    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private EmailSenderService emailSenderService;
    @Autowired
    private UserRepo userRepo;

    @RequestMapping(value = {"/customer/complain/add"}, method = RequestMethod.GET)
    public ModelAndView customerAddComplain(Principal principal){
        List<Complain> complainList=complainRepo.findByUsername(principal.getName());
        ModelAndView modelAndView= new ModelAndView("complain/customerAddComplain");
        modelAndView.addObject("complainList",complainList);
        Customer customer = customerRepo.findByUsername(principal.getName());
        modelAndView.addObject("customer", customer);
        return modelAndView;
    }
    @RequestMapping(value = {"/shop/complain/add"}, method = RequestMethod.GET)
    public ModelAndView shopAddComplain(Principal principal){
        List<Complain> complainList=complainRepo.findByUsername(principal.getName());
        ModelAndView modelAndView= new ModelAndView("complain/shopAddComplain");
        modelAndView.addObject("complainList",complainList);
        Shop shop = shopRepo.findByShopname(principal.getName());
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        modelAndView.addObject("shop", shop);
        modelAndView.addObject("categoryList", categoryList);
        return modelAndView;
    }
    @RequestMapping(value = {"/customer/complain/add"}, method = RequestMethod.POST)
    public String customerAddComplain(Principal principal, Complain complain){
        complain.setUsername(principal.getName());
        complain.setTime(Timestamp.from(Instant.now(Clock.systemDefaultZone()).truncatedTo(ChronoUnit.SECONDS)));
        complainRepo.save(complain);
        return "redirect:/customer/complain/add";
    }
    @RequestMapping(value = {"/shop/complain/add"}, method = RequestMethod.POST)
    public String shopAddComplain(Principal principal, Complain complain){
        complain.setUsername(principal.getName());
        complain.setTime(Timestamp.from(Instant.now(Clock.systemDefaultZone()).truncatedTo(ChronoUnit.SECONDS)));
        complainRepo.save(complain);
        return "redirect:/shop/complain/add";
    }
    @GetMapping("/admin/complains/view")
    public ModelAndView viewComplains(){
        ModelAndView modelAndView= new ModelAndView("complain/adminReplyComplain");
        List<Complain> complainList= complainRepo.findAll();
        List<Complain> unrepliedComplains = new ArrayList<>();
        List<Complain> repliedComplains = new ArrayList<>();
        for(Complain complain: complainList){
            if(complain.getReply()==null || complain.getReply().equals("")) unrepliedComplains.add(complain);
            else repliedComplains.add(complain);
        }
        modelAndView.addObject("unrepliedComplains", unrepliedComplains);
        modelAndView.addObject("repliedComplains", repliedComplains);
        return modelAndView;
    }
    @GetMapping("/admin/complain/reply/{id}")
    public String viewComplains(@PathVariable Integer id, String reply){
        Complain complain= complainRepo.getById(id);
        if(complain.getReply()==null || complain.getReply().equals("")){
            complain.setReply(reply);
        }
        complainRepo.save(complain);
        String emailBody="Dear "+complain.getUsername()+","
                +"\n\nYour complain has been replied by our admin."
                +"\n\nOriginal Complain: " + complain.getMessage()
                +"\n\nAdmin Reply: "+complain.getReply()
                +"\n\nThank you for staying with us.\n\nKenaKata";
        User user = userRepo.findByUsername(complain.getUsername());
        if(user.getAuthority().equals("ROLE_CUSTOMER")) {
            Customer customer = customerRepo.findByUsername(complain.getUsername());
            emailSenderService.sendSimpleEmail(customer.getEmail(),emailBody,"Reply of Complain "+complain.getId());
        }
        else {
            Shop shop = shopRepo.findByShopname(complain.getUsername());
            emailSenderService.sendSimpleEmail(shop.getShop_email(),emailBody,"Reply of Complain "+complain.getId());
        }
        return "redirect:/admin/complains/view";
    }
}