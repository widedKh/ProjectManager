package com.w.ProjectManager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;


import com.w.ProjectManager.model.Task;
import com.w.ProjectManager.model.User;

public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	Optional<Task> findById(Long id);
	List<Task> findAllByUser(User user);
}
