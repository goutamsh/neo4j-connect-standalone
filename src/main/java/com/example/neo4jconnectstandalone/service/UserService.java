package com.example.neo4jconnectstandalone.service;

import com.example.neo4jconnectstandalone.model.User;
import com.example.neo4jconnectstandalone.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers(){
        return userRepository.fetchAllUsers();
    }
}
