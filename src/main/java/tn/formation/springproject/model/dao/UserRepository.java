package tn.formation.springproject.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.stereotype.Repository;

import tn.formation.springproject.model.entities.User;
/**
 * 
 * @author MAHDI
 *RepositoryRestController deuxieme méthode pour générer les service
 */

@Repository
@RepositoryRestResource(path="user")
public interface UserRepository extends JpaRepository<User, Long> {

}
