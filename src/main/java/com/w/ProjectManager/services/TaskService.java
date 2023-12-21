package com.w.ProjectManager.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w.ProjectManager.model.Task;
import com.w.ProjectManager.repositories.TaskRepository;

@Service
public class TaskService {
	@Autowired
     TaskRepository taskRepository;


    // Example method to save a task
    public Task saveTask(Task task) {
        return taskRepository.save(task);
    }

    // Example method to retrieve all tasks
    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    // Add other methods as needed
}

