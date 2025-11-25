package DAO;

import Entity.Video;
import Utils.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class VideoDAOImpl extends AbstractDAO<Video, String> implements VideoDAO {
    public VideoDAOImpl() {
        super(Video.class);
    }

    @Override
    public List<Video> searchByTitle(String keyword) {
        EntityManager em = XJPA.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.title LIKE :kw";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            query.setParameter("kw", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}