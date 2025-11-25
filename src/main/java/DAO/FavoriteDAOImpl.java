package DAO;
import DAO.FavoriteDAO;
import Entity.Favorite;

public class FavoriteDAOImpl extends AbstractDAO<Favorite, Long> implements FavoriteDAO {

    public FavoriteDAOImpl() {
        // Khởi tạo AbstractDAO với kiểu Class của thực thể Favorite
        super(Favorite.class);
    }


}
