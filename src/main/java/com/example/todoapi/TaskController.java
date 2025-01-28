package com.example.todoapi;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @GetMapping
    public String getAllTasks() {
        return "This will return all tasks!";
    }
}
