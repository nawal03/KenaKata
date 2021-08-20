package com.example.kenakata.util;

import com.example.kenakata.entity.User;
import com.example.kenakata.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    UserRepo userRepo;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery("select username,password,enabled from users where username=?")
                .authoritiesByUsernameQuery("select username, authority from users where username=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable().authorizeRequests()
                .antMatchers("/admin","/admin/**").hasRole("ADMIN")
                .antMatchers("/shop", "/shop/**").hasRole("SHOP")
                .antMatchers("/customer", "/customer/**").hasRole("CUSTOMER")
                .antMatchers("/","/register", "/registershop").permitAll()
                .and().formLogin().loginPage("/login")
                .successHandler((request, response, authentication) -> {
                    // run custom logics upon successful login

                    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                    String username = userDetails.getUsername();
                    User user = userRepo.findByUsername(username);
                    String authority = user.getAuthority();
                    String redirectURL = request.getContextPath();

                    if (authority.equals("ROLE_CUSTOMER")) {
                        redirectURL = "customer/home";
                    } else if (authority.equals("ROLE_SHOP")) {
                        redirectURL = "shop/home";
                    }
                    else if(authority.equals("ROLE_ADMIN")){
                        redirectURL = "admin/complains/view";
                    }

                    response.sendRedirect(redirectURL);
                })
                .and().exceptionHandling().accessDeniedPage("/login");


    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder()
    {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }

}

