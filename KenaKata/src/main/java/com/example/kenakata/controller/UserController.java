package com.example.kenakata.controller;

import com.example.kenakata.entity.*;
import com.example.kenakata.repository.*;
import com.example.kenakata.services.CustomerService;
import com.example.kenakata.services.EmailSenderService;
import com.example.kenakata.services.ShopService;
import com.example.kenakata.services.UserService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
public class UserController {

    @Value("${firebase-apikey}")
    private String firebaseApikey;
    @Value("${root-path}")
    private String rootPath;

    @Autowired
    private UserService userService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    private ShopRepo shopRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private OrderRepo orderRepo;

    @GetMapping("/")
    public ModelAndView home() {
        List<Shop> shopList= shopRepo.findAll();
        ModelAndView modelAndView= new ModelAndView("user/landingpage");
        modelAndView.addObject("shopList", shopList);
        Boolean scroll= false;
        modelAndView.addObject("scroll",scroll);
        return modelAndView;
    }

    @GetMapping("/searchShop")
    public ModelAndView searchShop(String str){
        List<Shop> allShopList= shopRepo.findAll();
        Set<Shop> shopList= new HashSet<>();
        for(Shop shop: allShopList){
            if(shop.getShopname().toLowerCase().contains(str.toLowerCase())) shopList.add(shop);
        }
        List<Product> productList= productRepo.findAll();
        for(Product product: productList){
            if(product.contains(str)) shopList.add(shopRepo.findByShopname(product.getShopname()));
        }
        ModelAndView modelAndView= new ModelAndView("user/landingpage");
        modelAndView.addObject("shopList",shopList);
        Boolean scroll= true;
        modelAndView.addObject("scroll",scroll);
        return modelAndView;
    }
    @GetMapping("/filterShop")
    public ModelAndView searchShop(String category, String delivery_area){
        List<Shop> allShopList= shopRepo.findAll();
        List<Shop> shopList= new ArrayList<>();
        for(Shop shop: allShopList){
            if(shop.contains(delivery_area,category)) shopList.add(shop);
        }
        ModelAndView modelAndView= new ModelAndView("user/landingpage");
        modelAndView.addObject("shopList",shopList);
        Boolean scroll= true;
        modelAndView.addObject("scroll",scroll);
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login(ModelMap model, String error, String logout, String verified) {

        if (error != null) {
            model.put("error", "Your username or password is invalid.");
        }

        if (logout != null) {
            model.put("logout", "You have been logged out successfully.");
        }

        model.put("user", new User());
        ModelAndView mv = new ModelAndView("user/login");
        mv.addObject("verified", verified);
        return mv;
    }

    @GetMapping("/register")
    public ModelAndView register(ModelMap modelMap, String error){
        modelMap.put("customer", new Customer());

        ModelAndView mv = new ModelAndView("user/register");
        if(error != null) {
            modelMap.put("error", "This username is already taken");
        }
        return mv;
    }
    @PostMapping("/register")
    public String register(@Validated @ModelAttribute("customer") Customer customer, BindingResult bindingResult, ModelMap modelMap){
        if (foundDuplicateUsername(customer.getUsername())) {
            bindingResult.rejectValue("username", "", "This username has already been taken!");
        }

        if (bindingResult.hasErrors()) {
            return "redirect:/register?error=error";
        }
        User user = new User();
        user.setUsername(customer.getUsername());
        user.setPassword(customer.getPassword());
        user.setAuthority("ROLE_CUSTOMER");
        user.setEnabled(false);
        user.setVerification(RandomString.make(64));
        userService.save(user);
        customerService.save(customer);
        String content = "Dear [[name]],\n"
                + "Please click the link below to verify your registration:\n"
                + "link\n[[URL]]\n"
                + "Thank you,\n"
                + "KenaKata";
        content = content.replace("[[name]]", customer.getFname()+" "+customer.getLname());
        String verifyURL =  rootPath+"/verify?code=" + user.getVerification();
        content = content.replace("[[URL]]", verifyURL);
        emailSenderService.sendSimpleEmail(customer.getEmail(),content,"Verification of Email");
        return "redirect:/emailVerify";
    }

    @GetMapping("/emailVerify")
    public ModelAndView emailVerfiy(){
        return new ModelAndView("user/emailVerify");
    }

    @GetMapping("/registershop")
    public ModelAndView registershop(ModelMap modelMap, String error) {
        modelMap.put("shop", new Shop());
        if(error != null) {
            modelMap.put("error", error);
        }
        ModelAndView modelAndView= new ModelAndView("user/registershop");
        modelAndView.addObject("firebaseApikey",firebaseApikey);
        return modelAndView;
    }
    @PostMapping("/registershop")
    public String registershop(@Validated @ModelAttribute("shop") Shop shop, BindingResult bindingResult,
                               @RequestParam(value = "category1", defaultValue = "null") String category1,
                               @RequestParam(value = "category2", defaultValue = "null") String category2,
                               @RequestParam(value = "category3", defaultValue = "null") String category3,
                               @RequestParam(value = "category4", defaultValue = "null") String category4,
                               @RequestParam(value = "category5", defaultValue = "null") String category5,
                               @RequestParam(value = "category6", defaultValue = "null") String category6,
                               @RequestParam(value = "category7", defaultValue = "null") String category7,
                               @RequestParam(value = "da1", defaultValue = "null") String da1,
                               @RequestParam(value = "da2", defaultValue = "null") String da2,
                               @RequestParam(value = "da3", defaultValue = "null") String da3,
                               @RequestParam(value = "da4", defaultValue = "null") String da4,
                               @RequestParam(value = "da5", defaultValue = "null") String da5,
                               @RequestParam(value = "da6", defaultValue = "null") String da6,
                               @RequestParam(value = "da7", defaultValue = "null") String da7) throws IOException {

        System.out.println("registershop: "+shop);

        if(shop.getShop_logo()==null || shop.getShop_logo().isEmpty()) {
            return "redirect:/registershop?error=Please insert shop cover photo";
        }

        List<String> categoryList = new ArrayList<>();
        if(!category1.equals("null"))
            categoryList.add(category1);
        if(!category2.equals("null"))
            categoryList.add(category2);
        if(!category3.equals("null"))
            categoryList.add(category3);
        if(!category4.equals("null"))
            categoryList.add(category4);
        if(!category5.equals("null"))
            categoryList.add(category5);
        if(!category6.equals("null"))
            categoryList.add(category6);
        if(!category7.equals("null"))
            categoryList.add(category7);

        List<String> daList = new ArrayList<>();
        if(!da1.equals("null"))
            daList.add(da1);
        if(!da2.equals("null"))
            daList.add(da2);
        if(!da3.equals("null"))
            daList.add(da3);
        if(!da4.equals("null"))
            daList.add(da4);
        if(!da5.equals("null"))
            daList.add(da5);
        if(!da6.equals("null"))
            daList.add(da6);
        if(!da7.equals("null"))
            daList.add(da7);

        if(categoryList.size() == 0 || daList.size() == 0) {
            return "redirect:/registershop?error=Please check atleast 1 field from category and delivery_area";
        }

        String category = String.join(",", categoryList);
        shop.setCategory(category);

        String delivery_area = String.join(",", daList);
        shop.setDelivery_area(delivery_area);


        if (foundDuplicateUsername(shop.getShopname())) {
            bindingResult.rejectValue("shopname", "", "This Shop Name has already been taken!");
        }
        if (bindingResult.hasErrors()) {
            return "redirect:/registershop?error=Shop name is already taken";
        }
        User user = new User();
        user.setUsername(shop.getShopname());
        user.setPassword(shop.getPassword());
        user.setEnabled(false);
        user.setAuthority("ROLE_SHOP");


        user.setVerification(RandomString.make(64));
        userService.save(user);
        shopService.save(shop);


        String content = "Dear [[name]],\n"
                + "Please click the link below to verify your registration:\n"
                + "link\n[[URL]]\n"
                + "Thank you,\n"
                + "KenaKata";
        content = content.replace("[[name]]", shop.getShopname());
        String verifyURL =  rootPath+"/verify?code=" + user.getVerification();
        content = content.replace("[[URL]]", verifyURL);
        emailSenderService.sendSimpleEmail(shop.getShop_email(),content,"Verification of Email");
        return "redirect:/emailVerify";
    }

    private boolean foundDuplicateUsername(String username) {
        User duplicateUser = userService.findByUsername(username);
        return Objects.nonNull(duplicateUser);
    }

    @GetMapping("/viewShop/{shopname}")
    public String viewShop(@PathVariable String shopname){
        Shop shop= shopRepo.findByShopname(shopname);

        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        String category = categoryList.get(0);

        return "redirect:/viewShop/"+shopname+"/viewCategory/"+category;
    }
    @GetMapping("/viewShop/{shopname}/viewCategory/{category}")
    public ModelAndView viewCategory(@PathVariable String category, @PathVariable String shopname){

        ModelAndView modelAndView= new ModelAndView("user/userViewCategory");
        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        modelAndView.addObject("categoryList",categoryList);
        List<Product> productList = productRepo.findByCategoryAndShopname(category, shopname);
        modelAndView.addObject("productList", productList);
        modelAndView.addObject("shopname", shopname);
        modelAndView.addObject("shop", shop);
        modelAndView.addObject("cat", category);
        return modelAndView;
    }

    @GetMapping("/viewShop/{shopname}/viewProduct/{id}")
    public ModelAndView viewProduct(@PathVariable String shopname, @PathVariable Integer id){
        ModelAndView modelAndView= new ModelAndView("user/userViewProduct");
        Product product= productRepo.findByPid(id);
        Shop shop = shopRepo.findByShopname(shopname);
        List<String> sizeList = new ArrayList<>(Arrays.asList(product.getSize().split(",")));
        List<Integer> quantityList = new ArrayList<>();
        for (int i = 1; i <= 20; i++)
            quantityList.add(i);
        modelAndView.addObject("quantityList", quantityList);
        modelAndView.addObject("product",product);
        modelAndView.addObject("shopname",shopname);
        modelAndView.addObject("sizeList", sizeList);
        modelAndView.addObject("shop", shop);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));
        modelAndView.addObject("categoryList", categoryList);
        return modelAndView;
    }

    @RequestMapping(value = "/viewShop/{shopname}/searchProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView searchProduct(String str,@PathVariable String shopname, @PathVariable String category){

        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList = new ArrayList<>();
        List<Product> allProductList= productRepo.findByCategoryAndShopname(category,shopname);
        for(Product product: allProductList){
            if(product.contains(str)) productList.add(product);
        }
        ModelAndView modelAndView= new ModelAndView("user/userViewCategory");
        modelAndView.addObject("shopaname",shopname);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @RequestMapping(value = "/viewShop/{shopname}/sortProductResult/{category}", method = RequestMethod.GET)
    public ModelAndView sortProduct(String order, String param,@PathVariable String shopname,@PathVariable String category){

        Shop shop = shopRepo.findByShopname(shopname);
        List<String> categoryList = new ArrayList<>(Arrays.asList(shop.getCategory().split(",")));

        List<Product> productList;
        if(param.equals("Name") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByNameAsc(category, shopname);
        else if(param.equals("Name") && order.equals("Descending")) productList=productRepo.findByCategoryAndShopnameOrderByNameDesc(category,shopname);
        else if(param.equals("Price") && order.equals("Ascending")) productList=productRepo.findByCategoryAndShopnameOrderByPriceAsc(category, shopname);
        else productList=productRepo.findByCategoryAndShopnameOrderByPriceDesc(category,shopname);
        ModelAndView modelAndView= new ModelAndView("user/userViewCategory");
        modelAndView.addObject("shopname",shopname);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("category",category);
        modelAndView.addObject("shop", shop);
        return modelAndView;
    }

    @GetMapping("/viewShop/{shopname}/reviews")
    public ModelAndView reviews(@PathVariable String shopname){
        ModelAndView mv = new ModelAndView("user/userReviews");
        List<Order> orderList = orderRepo.findByShopname(shopname);
        mv.addObject("orderList", orderList);
        Shop shop = shopRepo.findByShopname(shopname);
        mv.addObject("shop", shop);
        return mv;
    }

    @GetMapping("/verify")
    public String verify(String code){
        User user = userRepo.findByVerification(code);
        if (user == null || user.getEnabled()){
            return "redirect:/failedVerification";
        }
        else {
            user.setVerification(null);
            user.setEnabled(true);
            userRepo.save(user);
            return "redirect:/login?verified=true";
        }
    }

    @GetMapping("/failedVerification")
    public ModelAndView failedVerify(){
        return new ModelAndView("user/failedVerification");
    }

    @GetMapping("/forgotPassword")
    public ModelAndView forgotPassword(Principal principal, String msg){
        ModelAndView modelAndView= new ModelAndView("user/forgotPassword");
        modelAndView.addObject("msg",msg);
        return modelAndView;
    }
    @PostMapping("/forgotPassword")
    public String forgotPassword(String username){
        User user= userRepo.findByUsername(username);
        if(user==null){
            return "redirect:/forgotPassword?msg=NotFound";
        }
        if(user.getAuthority().equals("ROLE_OWNER")){
            Shop shop= shopRepo.findByShopname(username);
            String password= RandomString.make(8);
            shop.setPassword(password);
            user.setPassword(password);
            shopService.save(shop);
            userService.save(user);

            String emailBody= "Dear "+username+",\n\n"
                    +"Your new password is: "+password
                    +"\n\n You can change this password from account settings upon successful login."
                    +"\n\nThank you for staying with us.\nKenaKata";

            emailSenderService.sendSimpleEmail(shop.getShop_email(),emailBody,"New Password");
        }
        else{
            Customer customer= customerRepo.findByUsername(username);
            String password= RandomString.make(8);
            customer.setPassword(password);
            user.setPassword(password);
            customerService.save(customer);
            userService.save(user);

            String emailBody= "Dear "+customer.getUsername()+",\n\n"
                    +"Your new password is: "+password
                    +"\n\n You can change this password from account settings upon successful login."
                    +"\n\nThank you for staying with us.\nKenaKata";

            emailSenderService.sendSimpleEmail(customer.getEmail(),emailBody,"New Password");

        }
        return "redirect:/login";
    }

    @GetMapping("/aboutUs")
    public ModelAndView aboutUs(){
        return new ModelAndView("user/aboutUs");
    }
}
