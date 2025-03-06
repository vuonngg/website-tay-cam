package com.example.web_controller.controller;

import com.example.web_controller.entity.User;
import com.example.web_controller.entity.UserDto;
import com.example.web_controller.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/hien-thi")
    public List<UserDto> getALl(){
        return userService.getAllUser();
    }
    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id")UUID id){
        userService.delete(id);
    }
    @GetMapping("/getuser/{id}")
    public void getOne(@PathVariable("id")UUID id){
        userService.getOne(id);
    }
    @PostMapping("/add")
    public void add(@RequestBody User user){
        user.setId(null);
        userService.saveUser(user);
    }
    @PostMapping("/update")
    public void update(@RequestBody User user){
        userService.saveUser(user);
    }

    @GetMapping("/search")
    public List<UserDto> search(@RequestParam("duLieu") String duLieu,@RequestParam("vaiTro") String vaiTro){
        return userService.search(duLieu,vaiTro);
    }

}
