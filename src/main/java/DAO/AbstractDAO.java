package DAO;

import DAO.GenericDAO;
import Utils.XJPA;
import jakarta.persistence.*;
import java.util.List;
import Entity.*;

public abstract class AbstractDAO<T, ID> implements GenericDAO<T, ID> {

    private final Class<T> entityClass;

    protected AbstractDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected EntityManager getEntityManager() {
        return XJPA.getEntityManager();
    }

    @Override
    public T create(T entity) {
        EntityManager em = getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(entity);
            trans.commit();
            return entity;
        } catch (RuntimeException e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public T update(T entity) {
        EntityManager em = getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            T updatedEntity = em.merge(entity);
            trans.commit();
            return updatedEntity;
        } catch (RuntimeException e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteById(ID id) {
        EntityManager em = getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            trans.commit();
        } catch (RuntimeException e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public T findById(ID id) {
        EntityManager em = getEntityManager();
        try {
            if (entityClass == User.class) {
                String jpql = "SELECT u FROM User u " +
                        "LEFT JOIN FETCH u.favorites f " +
                        "LEFT JOIN FETCH u.shares " +
                        "WHERE u.id = :id";
                TypedQuery<T> query = em.createQuery(jpql, entityClass);
                query.setParameter("id", id);
                return query.getSingleResult();
            } else {
                return em.find(entityClass, id);
            }
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public List<T> findAll() {
        EntityManager em = getEntityManager();
        try {
            String jpql = "SELECT o FROM " + entityClass.getSimpleName() + " o";
            TypedQuery<T> query = em.createQuery(jpql, entityClass);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
