package tn.formation.springproject.model.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import tn.formation.springproject.model.dao.UserRepository;
import tn.formation.springproject.model.entities.User;

@Controller
@RequestMapping("api")
public class UserController {
	@Autowired
	UserRepository userRepository;

	@PostMapping("/user/ajouter")
	public void ajouter(@RequestBody User user) {
		try{
			userRepository.save(user); 
		}catch (Exception e) {
			// TODO: handle exception
		}
	
	}

	@PutMapping("/user/")
	public ResponseEntity<Void> modifer(@RequestBody User user) {
		if (userRepository.findOne(user.getId()) == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {

			userRepository.save(user);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);

	}

	@DeleteMapping("/user/{id}")
	public void deleteUser(@PathVariable(name = "id") long id) {
		userRepository.delete(id);
	}

	/**
	 * deleteAllUsers
	 */
	@DeleteMapping("/user")
	public void deleteAllUsers() {
		userRepository.deleteAll();

	}

	@GetMapping("/user/{id}")
	public ResponseEntity<User> getUser(@PathVariable(name = "id") long id) {

		User user = userRepository.findOne(id);

		/**
		 * en cas de reponse vide, non parcourable
		 */
		if (user == null) {
			return new ResponseEntity<>(HttpStatus.UNPROCESSABLE_ENTITY);
		}

		/**
		 * 200
		 */
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	/**
	 * get All Users
	 * 
	 * @return
	 */
	@GetMapping("/user/")
	public ResponseEntity<List<User>> getAllUsers() {
		List<User> users = userRepository.findAll();
		/**
		 * en cas de reponse vide, non parcourable
		 */
		if (users == null)
			return new ResponseEntity<>(HttpStatus.UNPROCESSABLE_ENTITY);
		if (users.isEmpty())
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		/**
		 * 200
		 */
		return new ResponseEntity<>(users, HttpStatus.OK);

	}
}
