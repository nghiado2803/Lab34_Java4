package DAO;

import Entity.User;

public interface UserDAO extends GenericDAO<User, String> {
    User findByIdOrEmail(String idOrEmail);
}