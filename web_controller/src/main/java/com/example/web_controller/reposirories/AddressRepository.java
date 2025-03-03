package com.example.web_controller.reposirories;

import com.example.web_controller.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, Integer> {
}