package com.example.web_controller.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Webconfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:5173", "http://localhost:5176")  // URL của frontend Vue.js
                .allowedMethods("GET", "POST", "PUT", "DELETE")  // Phương thức HTTP được phép
                .allowedHeaders("*");
    }
}
