package com.example.neo4jconnectstandalone.resource;

import com.example.neo4jconnectstandalone.model.User;
import com.example.neo4jconnectstandalone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("rest/neo4j")
public class UserResource {

    @Autowired
    UserService userService;

    @GetMapping("users")
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }
}
