package DAOImpl;

import DAO.UserDAO;
import Entity.User;

public class UserDAOImpl extends AbstractDAOImpl<User> implements UserDAO {

    @Override
    public User findByEmail(String email) {
        return findSingleByNamedQuery("User.findByEmail", "email", email);
    }

    @Override
    public User login(String email, String password) {
        return findSingleByNamedQuery("User.findByEmailAndPassword",
                "email", email,
                "password", password);
    }
    public User findByIdOrEmail(String input) {
        if (input == null || input.trim().isEmpty()) {
            return null;
        }
        input = input.trim();

        // Ưu tiên tìm bằng Id trước (vì Id là khóa chính, nhanh hơn)
        User user = findById(input);
        if (user != null) {
            return user;
        }

        // Nếu không thấy bằng Id → mới tìm bằng Email
        return findByEmail(input);
    }


}