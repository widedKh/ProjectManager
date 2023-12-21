package com.w.ProjectManager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.w.ProjectManager.model.Project;
import com.w.ProjectManager.model.User;

public interface ProjectRepository extends CrudRepository<Project, Long> {
	List<Project> findAll();
	Optional<Project> findById(Long id);
	List<Project> findAllByUsers(User user);
	List<Project> findByUsersNotContains(User user);

}
