package com.example.web_controller.reposirories;

import com.example.web_controller.entity.User;
import com.example.web_controller.entity.UserDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {
    @Query("SELECT new com.example.web_controller.entity.UserDto(u.id, u.username, u.email, u.phone, u.role, u.createdAt) FROM User u")
    List<UserDto> getAllUsers();

    @Query("SELECT new com.example.web_controller.entity.UserDto(u.id, u.username, u.email, u.phone, u.role, u.createdAt) FROM User u WHERE " +
            "(u.username LIKE %:search1% OR u.email LIKE %:search1% OR u.phone LIKE %:search1%) " +
            "AND u.role LIKE %:search2%")
    List<UserDto> timKiemUsers(String search1, String search2);
}