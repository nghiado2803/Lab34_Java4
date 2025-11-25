package DAO;


import java.util.List;

public interface GenericDAO<T, ID> {

    /**
     * Tạo mới thực thể.
     * @param entity Thực thể cần tạo mới.
     * @return Thực thể đã được lưu (thường là cùng thực thể đầu vào).
     */
    T create(T entity);

    /**
     * Cập nhật thực thể.
     * @param entity Thực thể cần cập nhật.
     * @return Thực thể đã được cập nhật.
     */
    T update(T entity);

    /**
     * Xóa thực thể theo Id.
     * @param id Khóa chính của thực thể cần xóa.
     */
    void deleteById(ID id);

    /**
     * Truy vấn thực thể theo Id.
     * @param id Khóa chính của thực thể.
     * @return Thực thể tìm thấy, hoặc null nếu không tìm thấy.
     */
    T findById(ID id);

    /**
     * Truy vấn tất cả các thực thể.
     * @return Danh sách tất cả các thực thể.
     */
    List<T> findAll();
}
