package com.w.ProjectManager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.w.ProjectManager.model.LoginUser;
import com.w.ProjectManager.model.Project;
import com.w.ProjectManager.model.Task;
import com.w.ProjectManager.model.User;
import com.w.ProjectManager.services.ProjectService;
import com.w.ProjectManager.services.TaskService;
import com.w.ProjectManager.services.UserService;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
    private TaskService taskService;

    // Other methods
	
	@GetMapping("/")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	  
	    return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {

	    User user = userService.register(newUser, result);
	     
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	  @GetMapping("/login")
	   public String userLogin(Model model) {

	       model.addAttribute("newLogin", new LoginUser());
	       return "userLogin.jsp";
	   }
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {
	     
		User user = userService.login(newLogin, result);
	 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "userLogin.jsp";
	    }
	     
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
	 
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findById(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("unassignedProjects", projectService.getUnassignedProjects(user));
		model.addAttribute("assignedProjects", projectService.getAssignedProjects(user));
		 
		return "dashboard.jsp";
	}
	
	@RequestMapping("/dashboard/join/{id}")
	public String joinTeam(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		Project project = projectService.findById(id);
		User user = userService.findById(userId);
		
		user.getProjects().add(project);
		userService.updateUser(user);
		
		model.addAttribute("user", user);
		model.addAttribute("unassignedProjects", projectService.getUnassignedProjects(user));
		model.addAttribute("assignedProjects", projectService.getAssignedProjects(user));
		
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/dashboard/leave/{id}")
	public String leaveTeam(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		Project project = projectService.findById(id);
		User user = userService.findById(userId);
		
		user.getProjects().remove(project);
		userService.updateUser(user);
		
		model.addAttribute("user", user);
		model.addAttribute("unassignedProjects", projectService.getUnassignedProjects(user));
		model.addAttribute("assignedProjects", projectService.getAssignedProjects(user));
		
		return "redirect:/dashboard";
	}

	@GetMapping("/projects/{id}")
	public String viewProject(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		return "viewProject.jsp";
	}
	
	@GetMapping("/projects/edit/{id}")
	public String openEditProject(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		return "editProject.jsp";
	}
	
	@PostMapping("/projects/edit/{id}")
	public String editProject(
			@PathVariable("id") Long id, 
			@Valid @ModelAttribute("project") Project project, 
			BindingResult result, 
			HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		User user = userService.findById(userId);
		
		if(result.hasErrors()) {
			return "editProject.jsp";
		}else {
			Project thisProject = projectService.findById(id);
			project.setUsers(thisProject.getUsers());
			project.setLead(user);
			projectService.updateProject(project);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/projects/delete/{id}")
	public String deleteProject(@PathVariable("id") Long id, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Project project = projectService.findById(id);
		projectService.deleteProject(project);
		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null); 
	    return "redirect:/";
	}
	
	@GetMapping("/projects/new")
	public String newProject(@ModelAttribute("project") Project project, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
		return "newProject.jsp";
	}
	
	@PostMapping("/projects/new")
	public String addNewProject(@Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		if(result.hasErrors()) {
			return "newProject.jsp";
		}else {
			projectService.addProject(project);
			
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			user.getProjects().add(project);
			userService.updateUser(user);
			return "redirect:/dashboard";
		}
	}
	
	
	

    @GetMapping("/projects/{projectId}/tasks")
    public String viewProjectTasks(@PathVariable("projectId") Long projectId, Model model) {
        // Retrieve the project and its tasks
        Project project = projectService.findById(projectId);
        List<Task> tasks = project.getTasks();

        // Add project and tasks to the model
        model.addAttribute("project", project);
        model.addAttribute("tasks", tasks);

        // Add a new task object to the model for the form
        model.addAttribute("newTask", new Task());

        return "projectTasks.jsp"; // Create a JSP page for displaying project tasks
    }

    @PostMapping("/projects/{projectId}/tasks")
    public String addTaskToProject(
            @PathVariable("projectId") Long projectId,
            @Valid @ModelAttribute("newTask") Task newTask,
            BindingResult result,
            HttpSession session) {

        // Validate the form inputs
        if (result.hasErrors()) {
            
            return "redirect:/projects/" + projectId + "/tasks?error";
        }

        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        // Retrieve the project
        Project project = projectService.findById(projectId);

        // Set the project and user for the new task
        newTask.setProject(project);
        newTask.setUser(user);

        // Save the new task
        taskService.saveTask(newTask);

        // Redirect to the tasks page with a success message
        return "redirect:/projects/" + projectId + "/tasks?success";
    }
}

