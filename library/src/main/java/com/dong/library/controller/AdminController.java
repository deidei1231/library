package com.dong.library.controller;

import com.dong.library.entity.Admin;
import com.dong.library.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/admins")
public class AdminController {
    @Autowired
    private AdminRepository adminRepository;

    /**
     * 获取所有管理员
     *
     * @return
     */
    @GetMapping("/findAll")
    public List<Admin> list() {
        List<Admin> adminList = adminRepository.findAll();
        return adminList;
    }

    /**
     * by id to get admin
     *
     * @param id
     * @return
     */
    @GetMapping("/findById/{id}")
    public Admin findById(@PathVariable int id) {

        // optional 容器 isParent() 是否为null get()获取对象
        Optional<Admin> optionalAdmin = adminRepository.findById(id);
        if (optionalAdmin.isPresent()) {
            Admin admin = optionalAdmin.get();
            return admin;
        }
        return new Admin();
    }

    @PutMapping("/update")
    public String update(@RequestBody Admin admin) {
        Admin save = adminRepository.save(admin);

        if (Objects.isNull(save)) {
            return "error";
        }

        return "success";
    }
}
