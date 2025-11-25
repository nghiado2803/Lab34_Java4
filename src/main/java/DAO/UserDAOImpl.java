package DAO;

import DAO.UserDAO;
import Entity.User;
import Utils.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class UserDAOImpl extends AbstractDAO<User, String> implements UserDAO {

    public UserDAOImpl() {
        // Khởi tạo AbstractDAO với kiểu Class của thực thể User
        super(User.class);
    }
    @Override
    public User findByIdOrEmail(String idOrEmail) {
        EntityManager em = XJPA.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.id = :info OR u.email = :info";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("info", idOrEmail);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

}
