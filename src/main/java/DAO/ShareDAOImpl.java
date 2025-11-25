package DAO;

import Utils.XJPA;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Map;

public class ShareDAOImpl implements ShareDAO {
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> getVideoShareReport() {
        EntityManager em = XJPA.getEntityManager();
        try {
            String jpql = "SELECT new map(" +
                    "v.title as title, " +
                    "COUNT(s.id) as shareCount, " +
                    "MIN(s.shareDate) as firstShare, " +
                    "MAX(s.shareDate) as lastShare) " +
                    "FROM Video v LEFT JOIN v.shares s " +
                    "GROUP BY v.id, v.title";
            return (List<Map<String, Object>>) em.createQuery(jpql).getResultList();
        } finally {
            em.close();
        }
    }

}