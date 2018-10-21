package com.example.neo4jconnectstandalone.repository;

import com.example.neo4jconnectstandalone.model.User;
import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends Neo4jRepository<User, Long> {

    @Query("MATCH (u:User) return u")
    List<User> fetchAllUsers();
}
