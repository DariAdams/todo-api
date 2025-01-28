package com.example.todoapi;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @GetMapping(produces = "application/json")
    public String getAllTasks() {
        return "{\"message\": \"This will return all tasks!\"}";
    }
}
