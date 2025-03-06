package com.example.web_controller.service;

import com.example.web_controller.entity.User;
import com.example.web_controller.entity.UserDto;
import com.example.web_controller.reposirories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public List<UserDto> getAllUser(){
        return userRepository.getAllUsers();
    }

    public User getOne(UUID id){
       return userRepository.findById(id).get();
    }

    public void delete(UUID id){
        userRepository.deleteById(id);
    }
    public void saveUser(User user){
        userRepository.save(user);
    }

    public List<UserDto> search(String duLieu, String vaiTro){
       return userRepository.timKiemUsers(duLieu,vaiTro);
    }

}
